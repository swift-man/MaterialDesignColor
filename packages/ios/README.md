# MaterialDesignColor for Apple platforms

Swift Package Manager reads the root `Package.swift`. The iOS source lives in this folder and is exposed through these products:

| Product | Purpose |
| --- | --- |
| `MaterialDesignColor` | Backward-compatible SwiftUI product |
| `MaterialDesignColorCore` | Pure Swift color token model |
| `MaterialDesignColorSwiftUI` | `SwiftUI.Color` extensions |
| `MaterialDesignColorUIKit` | `UIKit.UIColor` extensions |
| `MaterialDesignColorAppKit` | macOS `NSColor` conversion and adaptive colors |

```swift
import SwiftUI
import MaterialDesignColorSwiftUI

let color: Color = .pink400
```

```swift
import UIKit
import MaterialDesignColorUIKit

let color: UIColor = .pink400
```

Material 3 style role colors are exposed through `MaterialTheme` and `MaterialColorScheme`.

```swift
import MaterialDesignColorSwiftUI

let theme = MaterialTheme.light

Text("Hello")
  .foregroundStyle(theme.colorScheme.primary.color)
  .background(theme.colorScheme.surface.color)
```

Official Material 3 preset variants are available without creating a custom theme:

```swift
let expressive = MaterialTheme.preset(.expressive, appearance: .light)
let fruitSaladDark = MaterialColorScheme.preset(.fruitSalad, appearance: .dark)
let primaryKeyColor = MaterialThemePreset.vibrant.keyColors.primary
```

Available presets: `tonalSpot`, `fidelity`, `content`, `monochrome`, `neutral`, `vibrant`, `expressive`, `rainbow`, `fruitSalad`.

Material Theme Builder role colors can be injected with type-safe role keys. Missing roles fall back to the selected preset.

```swift
let builderTheme = try MaterialTheme.custom(
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

```swift
import MaterialDesignColorUIKit

let scheme = MaterialColorScheme.baseline(.dark)

label.textColor = scheme.onSurface.uiColor
view.backgroundColor = scheme.surface.uiColor
```

## Material 3 color roles

See the [shared color role guide](../../README.md#material-3-color-roles) for Google-defined role meanings, fill/content pairings, surface and fixed roles, and platform naming conventions. All platforms use the same 48 standard role tokens plus 8 separate custom status roles.

## 템플릿 값과 앱 확정 값

패키지는 롤 구조·템플릿·주입 API·검증 도구를 제공합니다. 제품의 최종 색은 앱이 확정합니다.
success/warning 기본값은 기본 seed #6750A4에 조화시킨 템플릿이며 앱에서 최종 값을 덮어쓰는 것을 전제로 합니다.

```swift
import MaterialDesignColorSwiftUI

let warning = MaterialColor(name: "appWarning", red: 128, green: 64, blue: 0)
let onWarning = MaterialColor(name: "appOnWarning", red: 255, green: 255, blue: 255)
let pair = MaterialTheme.pair(extendedLight: [.warning: warning, .onWarning: onWarning])
ContentView().materialTheme(light: pair.light, dark: pair.dark)
assert(pair.light.colorScheme.contrastIssues().isEmpty)
```

[전체 API 예제·프리셋/생성기/런타임 선택 표·대비 검사 범위](../../README.md#템플릿-값과-앱-확정-값)를 참고하세요.
MaterialExtendedColors의 전체 생성자, 값 기반 overriding/custom, AppKit/UIKit 동적 색상 예제도 같은 절에 있습니다.
공통 설명은 루트 README에서 관리합니다.

`\.materialTheme` 환경 기본값은 `MaterialTheme.light`입니다. 모디파이어가 없는 별도 창이나 설정 창은 자동 전환되지 않으므로 각 Scene 루트에 주입하세요.

macOS 10.15+/iOS 13+를 지원하며 새 Swift API는 2.3.0부터 제공합니다.
[macOS SwiftUI, AppKit 및 seed 생성 도구](../../README.md#macos-swiftui-and-extended-status-colors-22)의 설치·사용법도 확인하세요.
