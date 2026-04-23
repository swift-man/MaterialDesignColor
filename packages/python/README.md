# MaterialDesignColor for Python

This package exposes Material Design colors as hex strings and typed color objects.

Material 3 style role colors:

```python
from material_design_color import create_theme

theme = create_theme(dark=True)

primary = theme.color_scheme.primary.hex
on_surface = theme.color_scheme.on_surface.hex
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
