# MaterialDesignColor for iOS

Swift Package Manager reads the root `Package.swift`. The iOS source lives in this folder and is exposed through these products:

| Product | Purpose |
| --- | --- |
| `MaterialDesignColor` | Backward-compatible SwiftUI product |
| `MaterialDesignColorCore` | Pure Swift color token model |
| `MaterialDesignColorSwiftUI` | `SwiftUI.Color` extensions |
| `MaterialDesignColorUIKit` | `UIKit.UIColor` extensions |

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
