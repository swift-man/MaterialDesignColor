# MaterialDesignColorCore

Use Material Design palette constants and official Material 3 preset color schemes from a pure Swift target.

## Overview

`MaterialDesignColorCore` contains the platform-neutral Swift model for this package. It exposes the legacy Material Design palette through ``MaterialPalette`` and Material 3 role-based color schemes through ``MaterialTheme`` and ``MaterialColorScheme``.

The default light and dark themes use the official Material 3 `tonalSpot` preset. Other official preset variants are available through ``MaterialThemePreset``:

- `tonalSpot`
- `fidelity`
- `content`
- `monochrome`
- `neutral`
- `vibrant`
- `expressive`
- `rainbow`
- `fruitSalad`

```swift
let theme = MaterialTheme.preset(.expressive, appearance: .light)
let primary = theme.colorScheme.primary
let keyPrimary = MaterialThemePreset.expressive.keyColors.primary
```

Material Theme Builder role colors can be injected with type-safe ``MaterialColorRole`` keys. Missing roles fall back to the selected preset.

```swift
let theme = try MaterialTheme.custom(
    appearance: .light,
    overrides: [
        .primary: "#6750A4",
        .onPrimary: "#FFFFFF",
        .primaryContainer: "#EADDFF",
        .onPrimaryContainer: "#21005D",
        .surface: "#FFFBFE",
        .onSurface: "#1C1B1F"
    ]
)
```

For existing call sites, ``MaterialTheme/light``, ``MaterialTheme/dark``, ``MaterialColorScheme/baselineLight``, and ``MaterialColorScheme/baselineDark`` remain aliases for the `tonalSpot` preset.

## Custom status colors

The standard 48 roles remain unchanged. ``MaterialExtendedColorRole`` defines
success/onSuccess/successContainer/onSuccessContainer and the corresponding warning group.
``MaterialExtendedColors`` stores immutable, harmonized light/dark defaults.
Access them through ``MaterialColorScheme/success`` and ``MaterialColorScheme/warning``:

```swift
let safe = MaterialTheme.light.colorScheme.success
let scheme = try MaterialColorScheme.tonalSpotDark.overridingExtended([
  .warning: "#FFB870", .onWarning: "#482900"
])
let theme = MaterialTheme(colorScheme: scheme)
```

In the SwiftUI adapter, apply `.materialTheme(preset: .tonalSpot)` at the root to
follow the system appearance, or `.materialTheme(light: customLight, dark: customDark)`.
The AppKit adapter provides `MaterialColor.nsColor` and `NSColor(materialColor:)`.
Seed-based schemes can be generated ahead of time with `tools/theme/generate.mjs`;
see the repository README for installation and output formats.


## 템플릿 값과 앱 확정 값

패키지는 롤 이름·구조와 템플릿 기본값, 주입 API, 대비 검증 도구를 제공합니다.
최종 제품 색은 앱이 확정합니다. success/warning 기본값은 #6750A4에 조화시킨 템플릿이며,
앱이 제품 색상을 결정해 덮어쓰는 것을 전제로 합니다. 런타임 override는 앱 값을 재조화하지 않습니다.

| 경로 | 용도 |
| --- | --- |
| 프리셋 | 기본 역할 값의 출발점 |
| tools/theme | seed로 후보 스킴을 생성해 앱 프로젝트에 보관 |
| 값 기반 override / pair | 앱 디자인·사용자 설정·시스템 색의 최종 값 주입 |

```swift
let warning = MaterialColor(name: "appWarning", red: 128, green: 64, blue: 0)
let white = MaterialColor(name: "white", red: 255, green: 255, blue: 255)
let pair = MaterialTheme.pair(extendedLight: [.warning: warning, .onWarning: white])
let ratio = warning.contrastRatio(with: white)
let issues = pair.light.colorScheme.contrastIssues(minimum: 4.5)
```

``MaterialExtendedColors``의 공개 생성자는 모든 확장 역할을 MaterialColor로 받습니다.
UInt8 sRGB 생성자와 값 기반 overriding/custom은 throw하지 않습니다.
``MaterialThemePair``의 light/dark를 SwiftUI `.materialTheme(light:dark:)` 또는
AppKit/UIKit `.material(light:dark:_:)`에 전달하세요.

`\.materialTheme` 환경 기본값은 MaterialTheme.light입니다. 모디파이어가 없는 장면은
자동 전환되지 않으므로 별도 창·설정 창에도 각 루트에 주입해야 합니다.
``MaterialContrastIssue``는 기본·확장 on 쌍의 미달 대비를 반환합니다. 실제 다른 인접 색상은
contrastRatio(with:)로 검사하세요. 투명도가 적용된 UI는 배경 합성 후 검증합니다.


## 기존 테마 묶기와 외부 입력 검증

```swift
let pair = MaterialThemePair(
    light: MaterialTheme.preset(.fidelity, appearance: .light),
    dark: MaterialTheme.preset(.fidelity, appearance: .dark)
)
// SwiftUI 루트: ContentView().materialTheme(light: pair.light, dark: pair.dark)
let expected = MaterialContrastIssue(colorRole: "warning", onRole: "onWarning", ratio: 1)
let issues = pair.light.colorScheme.contrastIssues()
assert(!issues.contains(expected))
do {
    let checked = try pair.light.colorScheme.validatedContrastIssues(minimum: 4.5)
    assert(checked.isEmpty)
} catch MaterialContrastError.invalidMinimum(let value) {
    print("대비 기준은 유한한 1...21이어야 합니다: \(value)")
}
```

`MaterialThemePair.init(light:dark:)`는 색과 appearance 메타데이터를 그대로 보관합니다.
인수 이름은 표시할 모드를 지정하므로 앱이 각 모드에 맞는 테마를 전달해야 합니다.
`MaterialContrastIssue.init(colorRole:onRole:ratio:)`는 테스트 기대값 등 진단 기록을
직접 구성하며 입력을 검증하거나 대비를 계산하지 않습니다.
외부 설정에는 throwing `validatedContrastIssues`를 사용하세요. 기존 `contrastIssues`의
유한한 1...21 precondition은 유지하며 값을 자동으로 보정하지 않습니다.



### 대비 오류 비교

`MaterialContrastError`는 `Equatable`을 지원합니다. 같은 숫자 기준은 같고, 모든 NaN은
같은 잘못된 입력 범주로 비교합니다. +∞와 −∞는 다르고, +0과 −0은 같습니다.
비교 정책은 원래 연관값을 바꾸지 않아 패턴 매칭으로 NaN의 원래 비트도 읽을 수 있습니다.

```swift
let first = MaterialContrastError.invalidMinimum(.nan)
let second = MaterialContrastError.invalidMinimum(-Double.nan)
assert(first == second)
assert(MaterialContrastError.invalidMinimum(22) != .invalidMinimum(23))
```

## Topics

### Material 3 Themes

- ``MaterialTheme``
- ``MaterialThemePair``
- ``MaterialThemePreset``
- ``MaterialThemeKeyColors``
- ``MaterialAppearance``

### Material 3 Color Schemes

- ``MaterialColorScheme``
- ``MaterialColorRole``
- ``MaterialColorSchemeError``

### Custom Status Colors

- ``MaterialExtendedColors``
- ``MaterialExtendedColorRole``

### Contrast Validation

- ``MaterialContrastIssue``
- ``MaterialContrastError``
- ``MaterialColor/contrastRatio(with:)``
- ``MaterialColorScheme/contrastIssues(minimum:)``
- ``MaterialColorScheme/validatedContrastIssues(minimum:)``

### Material Colors

- ``MaterialColor``
- ``MaterialColorError``
- ``MaterialPalette``
