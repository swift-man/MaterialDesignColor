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

## Topics

### Material 3 Themes

- ``MaterialTheme``
- ``MaterialThemePreset``
- ``MaterialThemeKeyColors``
- ``MaterialAppearance``

### Material 3 Color Schemes

- ``MaterialColorScheme``
- ``MaterialColorRole``
- ``MaterialColorSchemeError``

### Material Colors

- ``MaterialColor``
- ``MaterialColorError``
- ``MaterialPalette``


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
