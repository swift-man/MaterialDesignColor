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

For existing call sites, ``MaterialTheme/light``, ``MaterialTheme/dark``, ``MaterialColorScheme/baselineLight``, and ``MaterialColorScheme/baselineDark`` remain aliases for the `tonalSpot` preset.

## Topics

### Material 3 Themes

- ``MaterialTheme``
- ``MaterialThemePreset``
- ``MaterialThemeKeyColors``
- ``MaterialAppearance``

### Material 3 Color Schemes

- ``MaterialColorScheme``

### Material Colors

- ``MaterialColor``
- ``MaterialPalette``
