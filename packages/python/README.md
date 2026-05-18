# MaterialDesignColor for Python

This package exposes Material Design colors as hex strings and typed color objects.

Material 3 style role colors:

```python
from material_design_color import create_theme, preset_key_colors

theme = create_theme(preset="expressive", dark=True)

primary = theme.color_scheme.primary.hex
on_surface = theme.color_scheme.on_surface.hex
key_primary = preset_key_colors("expressive")["primary"].hex
```

Available presets: `tonalSpot`, `fidelity`, `content`, `monochrome`, `neutral`, `vibrant`, `expressive`, `rainbow`, `fruitSalad`.

Material Theme Builder role colors can be injected as camelCase role keys. Missing roles fall back to the selected preset.

```python
from material_design_color import create_theme

theme = create_theme(
    preset="tonalSpot",
    color_scheme={
        "primary": "#6750A4",
        "onPrimary": "#FFFFFF",
        "primaryContainer": "#EADDFF",
        "onPrimaryContainer": "#21005D",
        "surface": "#FFFBFE",
        "onSurface": "#1C1B1F",
    },
)
```

```python
from material_design_color import colors

hex_value = colors.pink400
```

```python
from material_design_color import MaterialColors

hex_value = MaterialColors.PINK_400.hex
rgb = MaterialColors.PINK_400.rgb
```
