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

## Material 3 color roles

See the [shared color role guide](../../README.md#material-3-color-roles) for Google-defined role meanings, fill/content pairings, surface and fixed roles, and platform naming conventions. All platforms use the same 48 standard role tokens plus 8 separate custom status roles.


## Extended success / warning roles

```python
from material_design_color import create_theme, EXTENDED_COLOR_ROLES

theme = create_theme(dark=True)
safe = theme.color_scheme.success
text = theme.color_scheme.on_success
caution = theme.color_scheme.warning_container
caution_text = theme.color_scheme.on_warning_container
assert theme.color_scheme.role_color("onWarningContainer") == caution_text
custom = create_theme(color_scheme={"success": "#006D37", "onSuccess": "#FFFFFF"})
```

`COLOR_SCHEME_ROLES` and `as_hex_map()` retain the 48 standard roles. `EXTENDED_COLOR_ROLES` lists the 8 camelCase custom roles, and `extended_colors` is an immutable mapping of those names to `MaterialColor` values. `EXTENDED_COLOR_SCHEMES` provides immutable default light/dark mappings. Properties follow Python snake_case conventions. All four generated fill/content pairs meet 4.5:1 in both modes; arbitrary overrides must be checked separately.

Use the [build-time tool](../../README.md#generate-a-brand-theme-at-build-time) for another seed:

```python
import json
from material_design_color import create_theme
with open("brand.json") as file:
    brand = json.load(file)
light = create_theme(color_scheme={**brand["light"], **brand["extended"]["light"]})
dark = create_theme(dark=True, color_scheme={**brand["dark"], **brand["extended"]["dark"]})
# Custom Python themes have source_color=None; the seed remains in brand["sourceColor"].
```


## App-owned final colors (2.3)

Preset and status colors are templates; the app chooses the final product colors. Export all 48 standard and 8 custom role values with `as_extended_hex_map()` for a lossless color-value round trip. `as_hex_map()` continues to export only the standard 48 roles.

```python
from material_design_color import custom_color_scheme, material_theme_builder_color_scheme
scheme = custom_color_scheme({"warning": "#804000", "onWarning": "#FFFFFF"}, dark=True)
restored = material_theme_builder_color_scheme("dark", scheme.as_extended_hex_map())
assert restored == scheme
```

The exported dictionary is independent of the immutable scheme. Appearance must be supplied separately. See the [shared responsibility guide](../../README.md#템플릿-값과-앱-확정-값). The new contrast validation API is currently in Swift Core.
