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

## macOS SwiftUI and extended status colors (2.2)

Supports macOS 10.15+ (including macOS 14+) and iOS 13+; `foregroundStyle` in this example requires macOS 12+/iOS 15+. Add the `MaterialDesignColorSwiftUI` product to the app target.

```swift
import SwiftUI
import MaterialDesignColorSwiftUI

struct ContentView: View {
  @Environment(\.materialTheme) private var theme

  var body: some View {
    VStack {
      Text("안전")
        .foregroundStyle(theme.colorScheme.onSuccess.color)
        .padding().background(theme.colorScheme.success.color)
      Text("주의")
        .foregroundStyle(theme.colorScheme.onWarningContainer.color)
        .padding().background(theme.colorScheme.warningContainer.color)
    }
  }
}

// At the root, inside WindowGroup:
ContentView().materialTheme(preset: .tonalSpot)
// Or supply any custom light/dark pair:
ContentView().materialTheme(light: .light, dark: .dark)
```

The modifier reads SwiftUI's `colorScheme` environment and updates `materialTheme` when the system appearance (or an ancestor's color scheme override) changes. The existing `.materialTheme(theme)` still injects a fixed theme. Set the modifier above views that read `@Environment(\.materialTheme)`.

There are **48 standard M3 roles + 8 custom extended roles**. Standard role enumerations remain at 48 for compatibility. The extensions are not official M3 status roles. They use Google's MCU `customColor(..., blend: true)` (HCT harmonization) with success seed `#228B22`, warning seed `#FF9800`, and default theme source `#6750A4`. All built-in presets share that source, so they share the status colors. Light/dark values live in `tokens/material3/extended-color-schemes.json`.

| Custom fill | Matching content | Meaning |
| --- | --- | --- |
| `success` | `onSuccess` | Safe/successful operation |
| `successContainer` | `onSuccessContainer` | Low-emphasis success surface |
| `warning` | `onWarning` | Caution |
| `warningContainer` | `onWarningContainer` | Low-emphasis warning surface |

All four fill/content pairs are tested at WCAG contrast **≥ 4.5:1 in both modes**. This guarantee applies to the generated pairs, not arbitrary overrides or a status color used as text on an unrelated background. Do not rely on color alone: include text or an icon.

```swift
// Separate custom role enum; standard MaterialColorRole.allCases remains 48.
let scheme = try MaterialColorScheme.tonalSpotLight.overridingExtended([
  .success: "#006D37", .onSuccess: "#FFFFFF"
])
let customLight = MaterialTheme(colorScheme: scheme)
let status = scheme.extendedColors[.success] // also scheme.success
let defaults = MaterialExtendedColors.light // .dark is also available
let customStatus = try defaults.overriding([.warning: "#805600"])
```

### AppKit

Add the `MaterialDesignColorAppKit` product; it depends only on Core and AppKit.

```swift
import MaterialDesignColorAppKit

let native = MaterialTheme.light.colorScheme.success.nsColor
let explicit = NSColor(materialColor: MaterialTheme.dark.colorScheme.warning)
let adaptive = NSColor.materialBaseline(\.success)
```

### Generate a brand theme at build time

Seed generation is a **build-time tool**, not a Swift runtime `MaterialTheme.generated` API. It uses the official `@material/material-color-utilities` **0.4.0**, pinned in `tools/theme/package-lock.json`, at contrast level 0. It generates all 48 standard roles and harmonizes the 8 status roles against the supplied seed. Available variants: `tonalSpot`, `fidelity`, `content`, `monochrome`, `neutral`, `vibrant`, `expressive`, `rainbow`, `fruitSalad`.

From the repository root (Node 20+):

```bash
npm --prefix tools/theme ci
npm --prefix tools/theme run generate -- '#0A84FF' tonalSpot /absolute/path/to/GeneratedMaterialTheme.swift
# JSON for JS/Python or inspection:
npm --prefix tools/theme run generate -- '#0A84FF' tonalSpot /absolute/path/to/brand.json
npm --prefix tools/theme test
```

Add the generated Swift file to your app target, then use:

```swift
ContentView().materialTheme(light: GeneratedMaterialTheme.light,
                            dark: GeneratedMaterialTheme.dark)
```

The tool accepts only `#RRGGBB` seeds. Output paths are resolved from `tools/theme` when invoked through npm, so use absolute paths. No MCU dependency is added to the app or any platform runtime package. `tsx` handles the extensionless ESM imports in MCU 0.4.0. Checked-in snapshots cover all roles in both modes for `#6750A4`, `#0A84FF`, and `#FF0000` across all nine variants. The generated Swift fixture is compiled in macOS CI.

Reference: [Google Material Color Utilities](https://github.com/material-foundation/material-color-utilities/tree/main/typescript).


Maintainers: status seed definitions are in `tokens/material3/extended-color-schemes.json`.
After intentionally changing them, run `npm --prefix tools/theme run generate:extended`
and `ruby tools/codegen/generate.rb`. Review and refresh MCU snapshots when changing
seed definitions or the pinned MCU version; do not edit generated platform files.
