from material_design_color import (
    DARK_COLOR_SCHEME,
    LIGHT_COLOR_SCHEME,
    MATERIAL_SOURCE_COLOR,
    MaterialThemePreset,
    MaterialColors,
    colors,
    create_theme,
    get_color,
    get_theme,
    preset_color_scheme,
    preset_key_colors,
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


def test_material3_official_preset_color_schemes():
    assert len(MaterialThemePreset) == 9
    assert preset_color_scheme(MaterialThemePreset.TONAL_SPOT).primary.hex == LIGHT_COLOR_SCHEME.primary.hex
    assert preset_color_scheme("rainbow").primary.hex == "#6750A4"
    assert get_theme("fruitSalad", dark=True).color_scheme.primary.hex == "#97CBFF"
    assert get_theme(MaterialThemePreset.EXPRESSIVE).color_scheme.primary.hex == "#006B5A"
    assert create_theme(preset="vibrant").preset is MaterialThemePreset.VIBRANT
    assert preset_key_colors("vibrant")["primary"].hex == "#6C0BFF"


def test_material3_source_color():
    assert MATERIAL_SOURCE_COLOR.hex == "#6750A4"
    assert create_theme().source_color is MATERIAL_SOURCE_COLOR
    assert create_theme(dark=True).source_color.hex == "#6750A4"
