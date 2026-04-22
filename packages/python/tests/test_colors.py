from material_design_color import (
    DARK_COLOR_SCHEME,
    LIGHT_COLOR_SCHEME,
    MaterialColors,
    colors,
    create_theme,
    get_color,
)


def test_color_values():
    assert colors.pink400 == "#EC407A"
    assert MaterialColors.BLUE_300.rgb == (100, 181, 246)
    assert get_color("tealA700").hex == "#00BFA5"


def test_material3_color_scheme_values():
    assert LIGHT_COLOR_SCHEME.primary.hex == "#65558F"
    assert LIGHT_COLOR_SCHEME.on_surface.hex == "#1D1B20"
    assert LIGHT_COLOR_SCHEME.role_color("primaryContainer").hex == "#E9DDFF"
    assert DARK_COLOR_SCHEME.surface_container_highest.hex == "#36343A"
    assert create_theme(dark=True).color_scheme.primary.hex == "#CFBDFE"
