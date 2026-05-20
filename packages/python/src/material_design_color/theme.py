# Generated from tokens/ by tools/codegen/generate.rb.
# Do not edit by hand.
from __future__ import annotations

from collections.abc import Mapping
from dataclasses import dataclass
from enum import Enum
from types import MappingProxyType
from typing import Optional, Union

from .colors import MaterialColor


COLOR_SCHEME_ROLES: tuple[str, ...] = (
    "primary",
    "onPrimary",
    "primaryContainer",
    "onPrimaryContainer",
    "inversePrimary",
    "secondary",
    "onSecondary",
    "secondaryContainer",
    "onSecondaryContainer",
    "tertiary",
    "onTertiary",
    "tertiaryContainer",
    "onTertiaryContainer",
    "background",
    "onBackground",
    "surface",
    "onSurface",
    "surfaceVariant",
    "onSurfaceVariant",
    "surfaceTint",
    "inverseSurface",
    "inverseOnSurface",
    "error",
    "onError",
    "errorContainer",
    "onErrorContainer",
    "outline",
    "outlineVariant",
    "scrim",
    "surfaceBright",
    "surfaceContainer",
    "surfaceContainerHigh",
    "surfaceContainerHighest",
    "surfaceContainerLow",
    "surfaceContainerLowest",
    "surfaceDim",
    "primaryFixed",
    "primaryFixedDim",
    "onPrimaryFixed",
    "onPrimaryFixedVariant",
    "secondaryFixed",
    "secondaryFixedDim",
    "onSecondaryFixed",
    "onSecondaryFixedVariant",
    "tertiaryFixed",
    "tertiaryFixedDim",
    "onTertiaryFixed",
    "onTertiaryFixedVariant",
)

ROLE_FIELDS: dict[str, str] = {
    "primary": "primary",
    "onPrimary": "on_primary",
    "primaryContainer": "primary_container",
    "onPrimaryContainer": "on_primary_container",
    "inversePrimary": "inverse_primary",
    "secondary": "secondary",
    "onSecondary": "on_secondary",
    "secondaryContainer": "secondary_container",
    "onSecondaryContainer": "on_secondary_container",
    "tertiary": "tertiary",
    "onTertiary": "on_tertiary",
    "tertiaryContainer": "tertiary_container",
    "onTertiaryContainer": "on_tertiary_container",
    "background": "background",
    "onBackground": "on_background",
    "surface": "surface",
    "onSurface": "on_surface",
    "surfaceVariant": "surface_variant",
    "onSurfaceVariant": "on_surface_variant",
    "surfaceTint": "surface_tint",
    "inverseSurface": "inverse_surface",
    "inverseOnSurface": "inverse_on_surface",
    "error": "error",
    "onError": "on_error",
    "errorContainer": "error_container",
    "onErrorContainer": "on_error_container",
    "outline": "outline",
    "outlineVariant": "outline_variant",
    "scrim": "scrim",
    "surfaceBright": "surface_bright",
    "surfaceContainer": "surface_container",
    "surfaceContainerHigh": "surface_container_high",
    "surfaceContainerHighest": "surface_container_highest",
    "surfaceContainerLow": "surface_container_low",
    "surfaceContainerLowest": "surface_container_lowest",
    "surfaceDim": "surface_dim",
    "primaryFixed": "primary_fixed",
    "primaryFixedDim": "primary_fixed_dim",
    "onPrimaryFixed": "on_primary_fixed",
    "onPrimaryFixedVariant": "on_primary_fixed_variant",
    "secondaryFixed": "secondary_fixed",
    "secondaryFixedDim": "secondary_fixed_dim",
    "onSecondaryFixed": "on_secondary_fixed",
    "onSecondaryFixedVariant": "on_secondary_fixed_variant",
    "tertiaryFixed": "tertiary_fixed",
    "tertiaryFixedDim": "tertiary_fixed_dim",
    "onTertiaryFixed": "on_tertiary_fixed",
    "onTertiaryFixedVariant": "on_tertiary_fixed_variant",
}


class MaterialThemePreset(str, Enum):
    TONAL_SPOT = "tonalSpot"
    FIDELITY = "fidelity"
    CONTENT = "content"
    MONOCHROME = "monochrome"
    NEUTRAL = "neutral"
    VIBRANT = "vibrant"
    EXPRESSIVE = "expressive"
    RAINBOW = "rainbow"
    FRUIT_SALAD = "fruitSalad"


@dataclass(frozen=True)
class MaterialColorScheme:
    appearance: str
    primary: MaterialColor
    on_primary: MaterialColor
    primary_container: MaterialColor
    on_primary_container: MaterialColor
    inverse_primary: MaterialColor
    secondary: MaterialColor
    on_secondary: MaterialColor
    secondary_container: MaterialColor
    on_secondary_container: MaterialColor
    tertiary: MaterialColor
    on_tertiary: MaterialColor
    tertiary_container: MaterialColor
    on_tertiary_container: MaterialColor
    background: MaterialColor
    on_background: MaterialColor
    surface: MaterialColor
    on_surface: MaterialColor
    surface_variant: MaterialColor
    on_surface_variant: MaterialColor
    surface_tint: MaterialColor
    inverse_surface: MaterialColor
    inverse_on_surface: MaterialColor
    error: MaterialColor
    on_error: MaterialColor
    error_container: MaterialColor
    on_error_container: MaterialColor
    outline: MaterialColor
    outline_variant: MaterialColor
    scrim: MaterialColor
    surface_bright: MaterialColor
    surface_container: MaterialColor
    surface_container_high: MaterialColor
    surface_container_highest: MaterialColor
    surface_container_low: MaterialColor
    surface_container_lowest: MaterialColor
    surface_dim: MaterialColor
    primary_fixed: MaterialColor
    primary_fixed_dim: MaterialColor
    on_primary_fixed: MaterialColor
    on_primary_fixed_variant: MaterialColor
    secondary_fixed: MaterialColor
    secondary_fixed_dim: MaterialColor
    on_secondary_fixed: MaterialColor
    on_secondary_fixed_variant: MaterialColor
    tertiary_fixed: MaterialColor
    tertiary_fixed_dim: MaterialColor
    on_tertiary_fixed: MaterialColor
    on_tertiary_fixed_variant: MaterialColor

    def role_color(self, role: str) -> MaterialColor:
        return getattr(self, ROLE_FIELDS[role])

    def as_hex_map(self) -> dict[str, str]:
        """Map of camelCase role name to ``#RRGGBB`` hex. Not a round-trip
        of the dataclass: fields are snake_case ``MaterialColor`` instances."""
        return {role: self.role_color(role).hex for role in COLOR_SCHEME_ROLES}


TONAL_SPOT_LIGHT_COLOR_SCHEME = MaterialColorScheme(
    appearance="light",
    primary=MaterialColor("primary", "#65558F"),
    on_primary=MaterialColor("onPrimary", "#FFFFFF"),
    primary_container=MaterialColor("primaryContainer", "#E9DDFF"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#4D3D75"),
    inverse_primary=MaterialColor("inversePrimary", "#CFBDFE"),
    secondary=MaterialColor("secondary", "#625B71"),
    on_secondary=MaterialColor("onSecondary", "#FFFFFF"),
    secondary_container=MaterialColor("secondaryContainer", "#E8DEF8"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#4A4458"),
    tertiary=MaterialColor("tertiary", "#7E5260"),
    on_tertiary=MaterialColor("onTertiary", "#FFFFFF"),
    tertiary_container=MaterialColor("tertiaryContainer", "#FFD9E3"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#633B48"),
    background=MaterialColor("background", "#FDF7FF"),
    on_background=MaterialColor("onBackground", "#1D1B20"),
    surface=MaterialColor("surface", "#FDF7FF"),
    on_surface=MaterialColor("onSurface", "#1D1B20"),
    surface_variant=MaterialColor("surfaceVariant", "#E7E0EB"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#49454E"),
    surface_tint=MaterialColor("surfaceTint", "#65558F"),
    inverse_surface=MaterialColor("inverseSurface", "#322F35"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#F5EFF7"),
    error=MaterialColor("error", "#BA1A1A"),
    on_error=MaterialColor("onError", "#FFFFFF"),
    error_container=MaterialColor("errorContainer", "#FFDAD6"),
    on_error_container=MaterialColor("onErrorContainer", "#93000A"),
    outline=MaterialColor("outline", "#7A757F"),
    outline_variant=MaterialColor("outlineVariant", "#CAC4CF"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#FDF7FF"),
    surface_container=MaterialColor("surfaceContainer", "#F2ECF4"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#ECE6EE"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#E6E0E9"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#F8F2FA"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#FFFFFF"),
    surface_dim=MaterialColor("surfaceDim", "#DED8E0"),
    primary_fixed=MaterialColor("primaryFixed", "#E9DDFF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CFBDFE"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#201047"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#4D3D75"),
    secondary_fixed=MaterialColor("secondaryFixed", "#E8DEF8"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#CBC2DB"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1E192B"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#4A4458"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#FFD9E3"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#EFB8C8"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#31101D"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#633B48"),
)


TONAL_SPOT_DARK_COLOR_SCHEME = MaterialColorScheme(
    appearance="dark",
    primary=MaterialColor("primary", "#CFBDFE"),
    on_primary=MaterialColor("onPrimary", "#36275D"),
    primary_container=MaterialColor("primaryContainer", "#4D3D75"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#E9DDFF"),
    inverse_primary=MaterialColor("inversePrimary", "#65558F"),
    secondary=MaterialColor("secondary", "#CBC2DB"),
    on_secondary=MaterialColor("onSecondary", "#332D41"),
    secondary_container=MaterialColor("secondaryContainer", "#4A4458"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#E8DEF8"),
    tertiary=MaterialColor("tertiary", "#EFB8C8"),
    on_tertiary=MaterialColor("onTertiary", "#4A2532"),
    tertiary_container=MaterialColor("tertiaryContainer", "#633B48"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#FFD9E3"),
    background=MaterialColor("background", "#141218"),
    on_background=MaterialColor("onBackground", "#E6E0E9"),
    surface=MaterialColor("surface", "#141218"),
    on_surface=MaterialColor("onSurface", "#E6E0E9"),
    surface_variant=MaterialColor("surfaceVariant", "#49454E"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#CAC4CF"),
    surface_tint=MaterialColor("surfaceTint", "#CFBDFE"),
    inverse_surface=MaterialColor("inverseSurface", "#E6E0E9"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#322F35"),
    error=MaterialColor("error", "#FFB4AB"),
    on_error=MaterialColor("onError", "#690005"),
    error_container=MaterialColor("errorContainer", "#93000A"),
    on_error_container=MaterialColor("onErrorContainer", "#FFDAD6"),
    outline=MaterialColor("outline", "#948F99"),
    outline_variant=MaterialColor("outlineVariant", "#49454E"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#3B383E"),
    surface_container=MaterialColor("surfaceContainer", "#211F24"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#2B292F"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#36343A"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#1D1B20"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#0F0D13"),
    surface_dim=MaterialColor("surfaceDim", "#141218"),
    primary_fixed=MaterialColor("primaryFixed", "#E9DDFF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CFBDFE"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#201047"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#4D3D75"),
    secondary_fixed=MaterialColor("secondaryFixed", "#E8DEF8"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#CBC2DB"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1E192B"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#4A4458"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#FFD9E3"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#EFB8C8"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#31101D"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#633B48"),
)


FIDELITY_LIGHT_COLOR_SCHEME = MaterialColorScheme(
    appearance="light",
    primary=MaterialColor("primary", "#4F378A"),
    on_primary=MaterialColor("onPrimary", "#FFFFFF"),
    primary_container=MaterialColor("primaryContainer", "#6750A4"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#E0D2FF"),
    inverse_primary=MaterialColor("inversePrimary", "#CFBCFF"),
    secondary=MaterialColor("secondary", "#63597C"),
    on_secondary=MaterialColor("onSecondary", "#FFFFFF"),
    secondary_container=MaterialColor("secondaryContainer", "#E1D4FD"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#645A7D"),
    tertiary=MaterialColor("tertiary", "#765B00"),
    on_tertiary=MaterialColor("onTertiary", "#FFFFFF"),
    tertiary_container=MaterialColor("tertiaryContainer", "#C9A74D"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#503D00"),
    background=MaterialColor("background", "#FDF7FF"),
    on_background=MaterialColor("onBackground", "#1D1B20"),
    surface=MaterialColor("surface", "#FDF7FF"),
    on_surface=MaterialColor("onSurface", "#1D1B20"),
    surface_variant=MaterialColor("surfaceVariant", "#E7E0EE"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#494551"),
    surface_tint=MaterialColor("surfaceTint", "#6750A4"),
    inverse_surface=MaterialColor("inverseSurface", "#322F35"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#F5EFF7"),
    error=MaterialColor("error", "#BA1A1A"),
    on_error=MaterialColor("onError", "#FFFFFF"),
    error_container=MaterialColor("errorContainer", "#FFDAD6"),
    on_error_container=MaterialColor("onErrorContainer", "#93000A"),
    outline=MaterialColor("outline", "#7A7582"),
    outline_variant=MaterialColor("outlineVariant", "#CBC4D2"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#FDF7FF"),
    surface_container=MaterialColor("surfaceContainer", "#F2ECF4"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#ECE6EE"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#E6E0E9"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#F8F2FA"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#FFFFFF"),
    surface_dim=MaterialColor("surfaceDim", "#DED8E0"),
    primary_fixed=MaterialColor("primaryFixed", "#E9DDFF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CFBCFF"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#22005D"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#4F378A"),
    secondary_fixed=MaterialColor("secondaryFixed", "#E9DDFF"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#CDC0E9"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1F1635"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#4B4263"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#FFDF93"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#E7C365"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#241A00"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#594400"),
)


FIDELITY_DARK_COLOR_SCHEME = MaterialColorScheme(
    appearance="dark",
    primary=MaterialColor("primary", "#CFBCFF"),
    on_primary=MaterialColor("onPrimary", "#381E72"),
    primary_container=MaterialColor("primaryContainer", "#6750A4"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#E0D2FF"),
    inverse_primary=MaterialColor("inversePrimary", "#6750A4"),
    secondary=MaterialColor("secondary", "#CDC0E9"),
    on_secondary=MaterialColor("onSecondary", "#342B4B"),
    secondary_container=MaterialColor("secondaryContainer", "#4D4465"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#BFB2DA"),
    tertiary=MaterialColor("tertiary", "#E7C365"),
    on_tertiary=MaterialColor("onTertiary", "#3E2E00"),
    tertiary_container=MaterialColor("tertiaryContainer", "#C9A74D"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#503D00"),
    background=MaterialColor("background", "#141218"),
    on_background=MaterialColor("onBackground", "#E6E0E9"),
    surface=MaterialColor("surface", "#141218"),
    on_surface=MaterialColor("onSurface", "#E6E0E9"),
    surface_variant=MaterialColor("surfaceVariant", "#494551"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#CBC4D2"),
    surface_tint=MaterialColor("surfaceTint", "#CFBCFF"),
    inverse_surface=MaterialColor("inverseSurface", "#E6E0E9"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#322F35"),
    error=MaterialColor("error", "#FFB4AB"),
    on_error=MaterialColor("onError", "#690005"),
    error_container=MaterialColor("errorContainer", "#93000A"),
    on_error_container=MaterialColor("onErrorContainer", "#FFDAD6"),
    outline=MaterialColor("outline", "#948E9C"),
    outline_variant=MaterialColor("outlineVariant", "#494551"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#3B383E"),
    surface_container=MaterialColor("surfaceContainer", "#211F24"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#2B292F"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#36343A"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#1D1B20"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#0F0D13"),
    surface_dim=MaterialColor("surfaceDim", "#141218"),
    primary_fixed=MaterialColor("primaryFixed", "#E9DDFF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CFBCFF"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#22005D"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#4F378A"),
    secondary_fixed=MaterialColor("secondaryFixed", "#E9DDFF"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#CDC0E9"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1F1635"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#4B4263"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#FFDF93"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#E7C365"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#241A00"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#594400"),
)


CONTENT_LIGHT_COLOR_SCHEME = MaterialColorScheme(
    appearance="light",
    primary=MaterialColor("primary", "#4F378A"),
    on_primary=MaterialColor("onPrimary", "#FFFFFF"),
    primary_container=MaterialColor("primaryContainer", "#6750A4"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#E0D2FF"),
    inverse_primary=MaterialColor("inversePrimary", "#CFBCFF"),
    secondary=MaterialColor("secondary", "#63597C"),
    on_secondary=MaterialColor("onSecondary", "#FFFFFF"),
    secondary_container=MaterialColor("secondaryContainer", "#E1D4FD"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#645A7D"),
    tertiary=MaterialColor("tertiary", "#762A5B"),
    on_tertiary=MaterialColor("onTertiary", "#FFFFFF"),
    tertiary_container=MaterialColor("tertiaryContainer", "#924274"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#FFCAE5"),
    background=MaterialColor("background", "#FDF7FF"),
    on_background=MaterialColor("onBackground", "#1D1B20"),
    surface=MaterialColor("surface", "#FDF7FF"),
    on_surface=MaterialColor("onSurface", "#1D1B20"),
    surface_variant=MaterialColor("surfaceVariant", "#E7E0EE"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#494551"),
    surface_tint=MaterialColor("surfaceTint", "#6750A4"),
    inverse_surface=MaterialColor("inverseSurface", "#322F35"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#F5EFF7"),
    error=MaterialColor("error", "#BA1A1A"),
    on_error=MaterialColor("onError", "#FFFFFF"),
    error_container=MaterialColor("errorContainer", "#FFDAD6"),
    on_error_container=MaterialColor("onErrorContainer", "#93000A"),
    outline=MaterialColor("outline", "#7A7582"),
    outline_variant=MaterialColor("outlineVariant", "#CBC4D2"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#FDF7FF"),
    surface_container=MaterialColor("surfaceContainer", "#F2ECF4"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#ECE6EE"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#E6E0E9"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#F8F2FA"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#FFFFFF"),
    surface_dim=MaterialColor("surfaceDim", "#DED8E0"),
    primary_fixed=MaterialColor("primaryFixed", "#E9DDFF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CFBCFF"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#22005D"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#4F378A"),
    secondary_fixed=MaterialColor("secondaryFixed", "#E9DDFF"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#CDC0E9"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1F1635"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#4B4263"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#FFD8EA"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#FFAEDB"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#3C002B"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#752A5B"),
)


CONTENT_DARK_COLOR_SCHEME = MaterialColorScheme(
    appearance="dark",
    primary=MaterialColor("primary", "#CFBCFF"),
    on_primary=MaterialColor("onPrimary", "#381E72"),
    primary_container=MaterialColor("primaryContainer", "#6750A4"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#E0D2FF"),
    inverse_primary=MaterialColor("inversePrimary", "#6750A4"),
    secondary=MaterialColor("secondary", "#CDC0E9"),
    on_secondary=MaterialColor("onSecondary", "#342B4B"),
    secondary_container=MaterialColor("secondaryContainer", "#4D4465"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#BFB2DA"),
    tertiary=MaterialColor("tertiary", "#FFAEDB"),
    on_tertiary=MaterialColor("onTertiary", "#5A1243"),
    tertiary_container=MaterialColor("tertiaryContainer", "#924274"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#FFCAE5"),
    background=MaterialColor("background", "#141218"),
    on_background=MaterialColor("onBackground", "#E6E0E9"),
    surface=MaterialColor("surface", "#141218"),
    on_surface=MaterialColor("onSurface", "#E6E0E9"),
    surface_variant=MaterialColor("surfaceVariant", "#494551"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#CBC4D2"),
    surface_tint=MaterialColor("surfaceTint", "#CFBCFF"),
    inverse_surface=MaterialColor("inverseSurface", "#E6E0E9"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#322F35"),
    error=MaterialColor("error", "#FFB4AB"),
    on_error=MaterialColor("onError", "#690005"),
    error_container=MaterialColor("errorContainer", "#93000A"),
    on_error_container=MaterialColor("onErrorContainer", "#FFDAD6"),
    outline=MaterialColor("outline", "#948E9C"),
    outline_variant=MaterialColor("outlineVariant", "#494551"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#3B383E"),
    surface_container=MaterialColor("surfaceContainer", "#211F24"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#2B292F"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#36343A"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#1D1B20"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#0F0D13"),
    surface_dim=MaterialColor("surfaceDim", "#141218"),
    primary_fixed=MaterialColor("primaryFixed", "#E9DDFF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CFBCFF"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#22005D"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#4F378A"),
    secondary_fixed=MaterialColor("secondaryFixed", "#E9DDFF"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#CDC0E9"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1F1635"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#4B4263"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#FFD8EA"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#FFAEDB"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#3C002B"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#752A5B"),
)


MONOCHROME_LIGHT_COLOR_SCHEME = MaterialColorScheme(
    appearance="light",
    primary=MaterialColor("primary", "#000000"),
    on_primary=MaterialColor("onPrimary", "#E2E2E2"),
    primary_container=MaterialColor("primaryContainer", "#3B3B3B"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#FFFFFF"),
    inverse_primary=MaterialColor("inversePrimary", "#C6C6C6"),
    secondary=MaterialColor("secondary", "#5E5E5E"),
    on_secondary=MaterialColor("onSecondary", "#FFFFFF"),
    secondary_container=MaterialColor("secondaryContainer", "#D4D4D4"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#1B1B1B"),
    tertiary=MaterialColor("tertiary", "#3B3B3B"),
    on_tertiary=MaterialColor("onTertiary", "#E2E2E2"),
    tertiary_container=MaterialColor("tertiaryContainer", "#747474"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#FFFFFF"),
    background=MaterialColor("background", "#F9F9F9"),
    on_background=MaterialColor("onBackground", "#1B1B1B"),
    surface=MaterialColor("surface", "#F9F9F9"),
    on_surface=MaterialColor("onSurface", "#1B1B1B"),
    surface_variant=MaterialColor("surfaceVariant", "#E2E2E2"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#474747"),
    surface_tint=MaterialColor("surfaceTint", "#5E5E5E"),
    inverse_surface=MaterialColor("inverseSurface", "#303030"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#F1F1F1"),
    error=MaterialColor("error", "#BA1A1A"),
    on_error=MaterialColor("onError", "#FFFFFF"),
    error_container=MaterialColor("errorContainer", "#FFDAD6"),
    on_error_container=MaterialColor("onErrorContainer", "#410002"),
    outline=MaterialColor("outline", "#777777"),
    outline_variant=MaterialColor("outlineVariant", "#C6C6C6"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#F9F9F9"),
    surface_container=MaterialColor("surfaceContainer", "#EEEEEE"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#E8E8E8"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#E2E2E2"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#F3F3F3"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#FFFFFF"),
    surface_dim=MaterialColor("surfaceDim", "#DADADA"),
    primary_fixed=MaterialColor("primaryFixed", "#5E5E5E"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#474747"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#FFFFFF"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#E2E2E2"),
    secondary_fixed=MaterialColor("secondaryFixed", "#C6C6C6"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#ABABAB"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1B1B1B"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#3B3B3B"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#5E5E5E"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#474747"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#FFFFFF"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#E2E2E2"),
)


MONOCHROME_DARK_COLOR_SCHEME = MaterialColorScheme(
    appearance="dark",
    primary=MaterialColor("primary", "#FFFFFF"),
    on_primary=MaterialColor("onPrimary", "#1B1B1B"),
    primary_container=MaterialColor("primaryContainer", "#D4D4D4"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#000000"),
    inverse_primary=MaterialColor("inversePrimary", "#5E5E5E"),
    secondary=MaterialColor("secondary", "#C6C6C6"),
    on_secondary=MaterialColor("onSecondary", "#1B1B1B"),
    secondary_container=MaterialColor("secondaryContainer", "#474747"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#E2E2E2"),
    tertiary=MaterialColor("tertiary", "#E2E2E2"),
    on_tertiary=MaterialColor("onTertiary", "#1B1B1B"),
    tertiary_container=MaterialColor("tertiaryContainer", "#919191"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#000000"),
    background=MaterialColor("background", "#131313"),
    on_background=MaterialColor("onBackground", "#E2E2E2"),
    surface=MaterialColor("surface", "#131313"),
    on_surface=MaterialColor("onSurface", "#E2E2E2"),
    surface_variant=MaterialColor("surfaceVariant", "#474747"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#C6C6C6"),
    surface_tint=MaterialColor("surfaceTint", "#C6C6C6"),
    inverse_surface=MaterialColor("inverseSurface", "#E2E2E2"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#303030"),
    error=MaterialColor("error", "#FFB4AB"),
    on_error=MaterialColor("onError", "#690005"),
    error_container=MaterialColor("errorContainer", "#93000A"),
    on_error_container=MaterialColor("onErrorContainer", "#FFDAD6"),
    outline=MaterialColor("outline", "#919191"),
    outline_variant=MaterialColor("outlineVariant", "#474747"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#393939"),
    surface_container=MaterialColor("surfaceContainer", "#1F1F1F"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#2A2A2A"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#353535"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#1B1B1B"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#0E0E0E"),
    surface_dim=MaterialColor("surfaceDim", "#131313"),
    primary_fixed=MaterialColor("primaryFixed", "#5E5E5E"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#474747"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#FFFFFF"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#E2E2E2"),
    secondary_fixed=MaterialColor("secondaryFixed", "#C6C6C6"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#ABABAB"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1B1B1B"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#3B3B3B"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#5E5E5E"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#474747"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#FFFFFF"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#E2E2E2"),
)


NEUTRAL_LIGHT_COLOR_SCHEME = MaterialColorScheme(
    appearance="light",
    primary=MaterialColor("primary", "#615C6B"),
    on_primary=MaterialColor("onPrimary", "#FFFFFF"),
    primary_container=MaterialColor("primaryContainer", "#E7DFF2"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#494453"),
    inverse_primary=MaterialColor("inversePrimary", "#CBC3D5"),
    secondary=MaterialColor("secondary", "#615D66"),
    on_secondary=MaterialColor("onSecondary", "#FFFFFF"),
    secondary_container=MaterialColor("secondaryContainer", "#E7E0EB"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#49454E"),
    tertiary=MaterialColor("tertiary", "#625B71"),
    on_tertiary=MaterialColor("onTertiary", "#FFFFFF"),
    tertiary_container=MaterialColor("tertiaryContainer", "#E8DEF8"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#4A4458"),
    background=MaterialColor("background", "#FDF8FA"),
    on_background=MaterialColor("onBackground", "#1C1B1D"),
    surface=MaterialColor("surface", "#FDF8FA"),
    on_surface=MaterialColor("onSurface", "#1C1B1D"),
    surface_variant=MaterialColor("surfaceVariant", "#E6E1E3"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#484648"),
    surface_tint=MaterialColor("surfaceTint", "#615C6B"),
    inverse_surface=MaterialColor("inverseSurface", "#313032"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#F4EFF1"),
    error=MaterialColor("error", "#BA1A1A"),
    on_error=MaterialColor("onError", "#FFFFFF"),
    error_container=MaterialColor("errorContainer", "#FFDAD6"),
    on_error_container=MaterialColor("onErrorContainer", "#93000A"),
    outline=MaterialColor("outline", "#797678"),
    outline_variant=MaterialColor("outlineVariant", "#C9C5C7"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#FDF8FA"),
    surface_container=MaterialColor("surfaceContainer", "#F1EDEE"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#EBE7E9"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#E6E1E3"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#F7F2F4"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#FFFFFF"),
    surface_dim=MaterialColor("surfaceDim", "#DDD9DB"),
    primary_fixed=MaterialColor("primaryFixed", "#E7DFF2"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CBC3D5"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#1D1A26"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#494453"),
    secondary_fixed=MaterialColor("secondaryFixed", "#E7E0EB"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#CAC4CF"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1D1A22"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#49454E"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#E8DEF8"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#CBC2DB"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#1E192B"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#4A4458"),
)


NEUTRAL_DARK_COLOR_SCHEME = MaterialColorScheme(
    appearance="dark",
    primary=MaterialColor("primary", "#CBC3D5"),
    on_primary=MaterialColor("onPrimary", "#322E3C"),
    primary_container=MaterialColor("primaryContainer", "#494453"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#E7DFF2"),
    inverse_primary=MaterialColor("inversePrimary", "#615C6B"),
    secondary=MaterialColor("secondary", "#CAC4CF"),
    on_secondary=MaterialColor("onSecondary", "#322F38"),
    secondary_container=MaterialColor("secondaryContainer", "#49454E"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#E7E0EB"),
    tertiary=MaterialColor("tertiary", "#CBC2DB"),
    on_tertiary=MaterialColor("onTertiary", "#332D41"),
    tertiary_container=MaterialColor("tertiaryContainer", "#4A4458"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#E8DEF8"),
    background=MaterialColor("background", "#141314"),
    on_background=MaterialColor("onBackground", "#E6E1E3"),
    surface=MaterialColor("surface", "#141314"),
    on_surface=MaterialColor("onSurface", "#E6E1E3"),
    surface_variant=MaterialColor("surfaceVariant", "#484648"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#C9C5C7"),
    surface_tint=MaterialColor("surfaceTint", "#CBC3D5"),
    inverse_surface=MaterialColor("inverseSurface", "#E6E1E3"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#313032"),
    error=MaterialColor("error", "#FFB4AB"),
    on_error=MaterialColor("onError", "#690005"),
    error_container=MaterialColor("errorContainer", "#93000A"),
    on_error_container=MaterialColor("onErrorContainer", "#FFDAD6"),
    outline=MaterialColor("outline", "#939092"),
    outline_variant=MaterialColor("outlineVariant", "#484648"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#3A393A"),
    surface_container=MaterialColor("surfaceContainer", "#201F21"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#2B292B"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#363436"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#1C1B1D"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#0F0E0F"),
    surface_dim=MaterialColor("surfaceDim", "#141314"),
    primary_fixed=MaterialColor("primaryFixed", "#E7DFF2"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CBC3D5"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#1D1A26"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#494453"),
    secondary_fixed=MaterialColor("secondaryFixed", "#E7E0EB"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#CAC4CF"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1D1A22"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#49454E"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#E8DEF8"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#CBC2DB"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#1E192B"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#4A4458"),
)


VIBRANT_LIGHT_COLOR_SCHEME = MaterialColorScheme(
    appearance="light",
    primary=MaterialColor("primary", "#6F19FF"),
    on_primary=MaterialColor("onPrimary", "#FFFFFF"),
    primary_container=MaterialColor("primaryContainer", "#E9DDFF"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#5400CC"),
    inverse_primary=MaterialColor("inversePrimary", "#CFBCFF"),
    secondary=MaterialColor("secondary", "#6B5778"),
    on_secondary=MaterialColor("onSecondary", "#FFFFFF"),
    secondary_container=MaterialColor("secondaryContainer", "#F3DAFF"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#523F5F"),
    tertiary=MaterialColor("tertiary", "#79507A"),
    on_tertiary=MaterialColor("onTertiary", "#FFFFFF"),
    tertiary_container=MaterialColor("tertiaryContainer", "#FFD6FC"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#5F3961"),
    background=MaterialColor("background", "#FDF7FF"),
    on_background=MaterialColor("onBackground", "#1D1A24"),
    surface=MaterialColor("surface", "#FDF7FF"),
    on_surface=MaterialColor("onSurface", "#1D1A24"),
    surface_variant=MaterialColor("surfaceVariant", "#E7DFF2"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#494453"),
    surface_tint=MaterialColor("surfaceTint", "#6F19FF"),
    inverse_surface=MaterialColor("inverseSurface", "#322F3A"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#F5EEFD"),
    error=MaterialColor("error", "#BA1A1A"),
    on_error=MaterialColor("onError", "#FFFFFF"),
    error_container=MaterialColor("errorContainer", "#FFDAD6"),
    on_error_container=MaterialColor("onErrorContainer", "#93000A"),
    outline=MaterialColor("outline", "#7A7484"),
    outline_variant=MaterialColor("outlineVariant", "#CBC3D5"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#FDF7FF"),
    surface_container=MaterialColor("surfaceContainer", "#F2EBFA"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#EDE5F4"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#E7E0EF"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#F8F1FF"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#FFFFFF"),
    surface_dim=MaterialColor("surfaceDim", "#DED7E6"),
    primary_fixed=MaterialColor("primaryFixed", "#E9DDFF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CFBCFF"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#22005D"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#5400CC"),
    secondary_fixed=MaterialColor("secondaryFixed", "#F3DAFF"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#D7BEE4"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#251431"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#523F5F"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#FFD6FC"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#E8B7E7"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#2F0D33"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#5F3961"),
)


VIBRANT_DARK_COLOR_SCHEME = MaterialColorScheme(
    appearance="dark",
    primary=MaterialColor("primary", "#CFBCFF"),
    on_primary=MaterialColor("onPrimary", "#3A0092"),
    primary_container=MaterialColor("primaryContainer", "#5400CC"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#E9DDFF"),
    inverse_primary=MaterialColor("inversePrimary", "#6F19FF"),
    secondary=MaterialColor("secondary", "#D7BEE4"),
    on_secondary=MaterialColor("onSecondary", "#3B2948"),
    secondary_container=MaterialColor("secondaryContainer", "#523F5F"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#F3DAFF"),
    tertiary=MaterialColor("tertiary", "#E8B7E7"),
    on_tertiary=MaterialColor("onTertiary", "#462349"),
    tertiary_container=MaterialColor("tertiaryContainer", "#5F3961"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#FFD6FC"),
    background=MaterialColor("background", "#15121C"),
    on_background=MaterialColor("onBackground", "#E7E0EF"),
    surface=MaterialColor("surface", "#15121C"),
    on_surface=MaterialColor("onSurface", "#E7E0EF"),
    surface_variant=MaterialColor("surfaceVariant", "#494453"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#CBC3D5"),
    surface_tint=MaterialColor("surfaceTint", "#CFBCFF"),
    inverse_surface=MaterialColor("inverseSurface", "#E7E0EF"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#322F3A"),
    error=MaterialColor("error", "#FFB4AB"),
    on_error=MaterialColor("onError", "#690005"),
    error_container=MaterialColor("errorContainer", "#93000A"),
    on_error_container=MaterialColor("onErrorContainer", "#FFDAD6"),
    outline=MaterialColor("outline", "#948E9F"),
    outline_variant=MaterialColor("outlineVariant", "#494453"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#3B3743"),
    surface_container=MaterialColor("surfaceContainer", "#211E28"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#2C2833"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#37333E"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#1D1A24"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#0F0D16"),
    surface_dim=MaterialColor("surfaceDim", "#15121C"),
    primary_fixed=MaterialColor("primaryFixed", "#E9DDFF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CFBCFF"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#22005D"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#5400CC"),
    secondary_fixed=MaterialColor("secondaryFixed", "#F3DAFF"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#D7BEE4"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#251431"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#523F5F"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#FFD6FC"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#E8B7E7"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#2F0D33"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#5F3961"),
)


EXPRESSIVE_LIGHT_COLOR_SCHEME = MaterialColorScheme(
    appearance="light",
    primary=MaterialColor("primary", "#006B5A"),
    on_primary=MaterialColor("onPrimary", "#FFFFFF"),
    primary_container=MaterialColor("primaryContainer", "#95F4DC"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#005143"),
    inverse_primary=MaterialColor("inversePrimary", "#79D7C0"),
    secondary=MaterialColor("secondary", "#79536A"),
    on_secondary=MaterialColor("onSecondary", "#FFFFFF"),
    secondary_container=MaterialColor("secondaryContainer", "#FFD8ED"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#5F3C52"),
    tertiary=MaterialColor("tertiary", "#735280"),
    on_tertiary=MaterialColor("onTertiary", "#FFFFFF"),
    tertiary_container=MaterialColor("tertiaryContainer", "#F7D8FF"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#593B67"),
    background=MaterialColor("background", "#FFF7FD"),
    on_background=MaterialColor("onBackground", "#1F1A21"),
    surface=MaterialColor("surface", "#FFF7FD"),
    on_surface=MaterialColor("onSurface", "#1F1A21"),
    surface_variant=MaterialColor("surfaceVariant", "#ECDEF0"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#4D4351"),
    surface_tint=MaterialColor("surfaceTint", "#006B5A"),
    inverse_surface=MaterialColor("inverseSurface", "#342E37"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#F8EDF9"),
    error=MaterialColor("error", "#BA1A1A"),
    on_error=MaterialColor("onError", "#FFFFFF"),
    error_container=MaterialColor("errorContainer", "#FFDAD6"),
    on_error_container=MaterialColor("onErrorContainer", "#93000A"),
    outline=MaterialColor("outline", "#7E7383"),
    outline_variant=MaterialColor("outlineVariant", "#CFC2D3"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#FFF7FD"),
    surface_container=MaterialColor("surfaceContainer", "#F5EBF6"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#EFE5F0"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#EADFEA"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#FBF0FB"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#FFFFFF"),
    surface_dim=MaterialColor("surfaceDim", "#E1D7E2"),
    primary_fixed=MaterialColor("primaryFixed", "#95F4DC"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#79D7C0"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#00201A"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#005143"),
    secondary_fixed=MaterialColor("secondaryFixed", "#FFD8ED"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#E8B9D4"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#2E1125"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#5F3C52"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#F7D8FF"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#E0B9EE"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#2B0E39"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#593B67"),
)


EXPRESSIVE_DARK_COLOR_SCHEME = MaterialColorScheme(
    appearance="dark",
    primary=MaterialColor("primary", "#79D7C0"),
    on_primary=MaterialColor("onPrimary", "#00382E"),
    primary_container=MaterialColor("primaryContainer", "#005143"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#95F4DC"),
    inverse_primary=MaterialColor("inversePrimary", "#006B5A"),
    secondary=MaterialColor("secondary", "#E8B9D4"),
    on_secondary=MaterialColor("onSecondary", "#46263B"),
    secondary_container=MaterialColor("secondaryContainer", "#5F3C52"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#FFD8ED"),
    tertiary=MaterialColor("tertiary", "#E0B9EE"),
    on_tertiary=MaterialColor("onTertiary", "#41244F"),
    tertiary_container=MaterialColor("tertiaryContainer", "#593B67"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#F7D8FF"),
    background=MaterialColor("background", "#161219"),
    on_background=MaterialColor("onBackground", "#EADFEA"),
    surface=MaterialColor("surface", "#161219"),
    on_surface=MaterialColor("onSurface", "#EADFEA"),
    surface_variant=MaterialColor("surfaceVariant", "#4D4351"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#CFC2D3"),
    surface_tint=MaterialColor("surfaceTint", "#79D7C0"),
    inverse_surface=MaterialColor("inverseSurface", "#EADFEA"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#342E37"),
    error=MaterialColor("error", "#FFB4AB"),
    on_error=MaterialColor("onError", "#690005"),
    error_container=MaterialColor("errorContainer", "#93000A"),
    on_error_container=MaterialColor("onErrorContainer", "#FFDAD6"),
    outline=MaterialColor("outline", "#988D9D"),
    outline_variant=MaterialColor("outlineVariant", "#4D4351"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#3D373F"),
    surface_container=MaterialColor("surfaceContainer", "#231E25"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#2D2830"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#38333B"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#1F1A21"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#110D14"),
    surface_dim=MaterialColor("surfaceDim", "#161219"),
    primary_fixed=MaterialColor("primaryFixed", "#95F4DC"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#79D7C0"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#00201A"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#005143"),
    secondary_fixed=MaterialColor("secondaryFixed", "#FFD8ED"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#E8B9D4"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#2E1125"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#5F3C52"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#F7D8FF"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#E0B9EE"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#2B0E39"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#593B67"),
)


RAINBOW_LIGHT_COLOR_SCHEME = MaterialColorScheme(
    appearance="light",
    primary=MaterialColor("primary", "#6750A4"),
    on_primary=MaterialColor("onPrimary", "#FFFFFF"),
    primary_container=MaterialColor("primaryContainer", "#E9DDFF"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#4F378A"),
    inverse_primary=MaterialColor("inversePrimary", "#CFBCFF"),
    secondary=MaterialColor("secondary", "#625B71"),
    on_secondary=MaterialColor("onSecondary", "#FFFFFF"),
    secondary_container=MaterialColor("secondaryContainer", "#E8DEF8"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#4A4458"),
    tertiary=MaterialColor("tertiary", "#7E5260"),
    on_tertiary=MaterialColor("onTertiary", "#FFFFFF"),
    tertiary_container=MaterialColor("tertiaryContainer", "#FFD9E3"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#633B48"),
    background=MaterialColor("background", "#F9F9F9"),
    on_background=MaterialColor("onBackground", "#1B1B1B"),
    surface=MaterialColor("surface", "#F9F9F9"),
    on_surface=MaterialColor("onSurface", "#1B1B1B"),
    surface_variant=MaterialColor("surfaceVariant", "#E2E2E2"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#474747"),
    surface_tint=MaterialColor("surfaceTint", "#6750A4"),
    inverse_surface=MaterialColor("inverseSurface", "#303030"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#F1F1F1"),
    error=MaterialColor("error", "#BA1A1A"),
    on_error=MaterialColor("onError", "#FFFFFF"),
    error_container=MaterialColor("errorContainer", "#FFDAD6"),
    on_error_container=MaterialColor("onErrorContainer", "#93000A"),
    outline=MaterialColor("outline", "#777777"),
    outline_variant=MaterialColor("outlineVariant", "#C6C6C6"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#F9F9F9"),
    surface_container=MaterialColor("surfaceContainer", "#EEEEEE"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#E8E8E8"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#E2E2E2"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#F3F3F3"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#FFFFFF"),
    surface_dim=MaterialColor("surfaceDim", "#DADADA"),
    primary_fixed=MaterialColor("primaryFixed", "#E9DDFF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CFBCFF"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#22005D"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#4F378A"),
    secondary_fixed=MaterialColor("secondaryFixed", "#E8DEF8"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#CBC2DB"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1E192B"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#4A4458"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#FFD9E3"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#EFB8C8"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#31101D"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#633B48"),
)


RAINBOW_DARK_COLOR_SCHEME = MaterialColorScheme(
    appearance="dark",
    primary=MaterialColor("primary", "#CFBCFF"),
    on_primary=MaterialColor("onPrimary", "#381E72"),
    primary_container=MaterialColor("primaryContainer", "#4F378A"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#E9DDFF"),
    inverse_primary=MaterialColor("inversePrimary", "#6750A4"),
    secondary=MaterialColor("secondary", "#CBC2DB"),
    on_secondary=MaterialColor("onSecondary", "#332D41"),
    secondary_container=MaterialColor("secondaryContainer", "#4A4458"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#E8DEF8"),
    tertiary=MaterialColor("tertiary", "#EFB8C8"),
    on_tertiary=MaterialColor("onTertiary", "#4A2532"),
    tertiary_container=MaterialColor("tertiaryContainer", "#633B48"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#FFD9E3"),
    background=MaterialColor("background", "#131313"),
    on_background=MaterialColor("onBackground", "#E2E2E2"),
    surface=MaterialColor("surface", "#131313"),
    on_surface=MaterialColor("onSurface", "#E2E2E2"),
    surface_variant=MaterialColor("surfaceVariant", "#474747"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#C6C6C6"),
    surface_tint=MaterialColor("surfaceTint", "#CFBCFF"),
    inverse_surface=MaterialColor("inverseSurface", "#E2E2E2"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#303030"),
    error=MaterialColor("error", "#FFB4AB"),
    on_error=MaterialColor("onError", "#690005"),
    error_container=MaterialColor("errorContainer", "#93000A"),
    on_error_container=MaterialColor("onErrorContainer", "#FFDAD6"),
    outline=MaterialColor("outline", "#919191"),
    outline_variant=MaterialColor("outlineVariant", "#474747"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#393939"),
    surface_container=MaterialColor("surfaceContainer", "#1F1F1F"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#2A2A2A"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#353535"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#1B1B1B"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#0E0E0E"),
    surface_dim=MaterialColor("surfaceDim", "#131313"),
    primary_fixed=MaterialColor("primaryFixed", "#E9DDFF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#CFBCFF"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#22005D"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#4F378A"),
    secondary_fixed=MaterialColor("secondaryFixed", "#E8DEF8"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#CBC2DB"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#1E192B"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#4A4458"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#FFD9E3"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#EFB8C8"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#31101D"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#633B48"),
)


FRUIT_SALAD_LIGHT_COLOR_SCHEME = MaterialColorScheme(
    appearance="light",
    primary=MaterialColor("primary", "#00639C"),
    on_primary=MaterialColor("onPrimary", "#FFFFFF"),
    primary_container=MaterialColor("primaryContainer", "#CEE5FF"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#004A77"),
    inverse_primary=MaterialColor("inversePrimary", "#97CBFF"),
    secondary=MaterialColor("secondary", "#30628C"),
    on_secondary=MaterialColor("onSecondary", "#FFFFFF"),
    secondary_container=MaterialColor("secondaryContainer", "#CEE5FF"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#104A73"),
    tertiary=MaterialColor("tertiary", "#65558F"),
    on_tertiary=MaterialColor("onTertiary", "#FFFFFF"),
    tertiary_container=MaterialColor("tertiaryContainer", "#E9DDFF"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#4D3D75"),
    background=MaterialColor("background", "#FDF7FF"),
    on_background=MaterialColor("onBackground", "#1D1A24"),
    surface=MaterialColor("surface", "#FDF7FF"),
    on_surface=MaterialColor("onSurface", "#1D1A24"),
    surface_variant=MaterialColor("surfaceVariant", "#E8DEF8"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#4A4458"),
    surface_tint=MaterialColor("surfaceTint", "#00639C"),
    inverse_surface=MaterialColor("inverseSurface", "#322F3A"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#F5EEFD"),
    error=MaterialColor("error", "#BA1A1A"),
    on_error=MaterialColor("onError", "#FFFFFF"),
    error_container=MaterialColor("errorContainer", "#FFDAD6"),
    on_error_container=MaterialColor("onErrorContainer", "#93000A"),
    outline=MaterialColor("outline", "#7B748A"),
    outline_variant=MaterialColor("outlineVariant", "#CBC2DB"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#FDF7FF"),
    surface_container=MaterialColor("surfaceContainer", "#F2EBFA"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#EDE5F4"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#E7E0EF"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#F8F1FF"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#FFFFFF"),
    surface_dim=MaterialColor("surfaceDim", "#DED7E6"),
    primary_fixed=MaterialColor("primaryFixed", "#CEE5FF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#97CBFF"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#001D33"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#004A77"),
    secondary_fixed=MaterialColor("secondaryFixed", "#CEE5FF"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#9CCBFB"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#001D33"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#104A73"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#E9DDFF"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#CFBDFE"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#201047"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#4D3D75"),
)


FRUIT_SALAD_DARK_COLOR_SCHEME = MaterialColorScheme(
    appearance="dark",
    primary=MaterialColor("primary", "#97CBFF"),
    on_primary=MaterialColor("onPrimary", "#003354"),
    primary_container=MaterialColor("primaryContainer", "#004A77"),
    on_primary_container=MaterialColor("onPrimaryContainer", "#CEE5FF"),
    inverse_primary=MaterialColor("inversePrimary", "#00639C"),
    secondary=MaterialColor("secondary", "#9CCBFB"),
    on_secondary=MaterialColor("onSecondary", "#003354"),
    secondary_container=MaterialColor("secondaryContainer", "#104A73"),
    on_secondary_container=MaterialColor("onSecondaryContainer", "#CEE5FF"),
    tertiary=MaterialColor("tertiary", "#CFBDFE"),
    on_tertiary=MaterialColor("onTertiary", "#36275D"),
    tertiary_container=MaterialColor("tertiaryContainer", "#4D3D75"),
    on_tertiary_container=MaterialColor("onTertiaryContainer", "#E9DDFF"),
    background=MaterialColor("background", "#15121C"),
    on_background=MaterialColor("onBackground", "#E7E0EF"),
    surface=MaterialColor("surface", "#15121C"),
    on_surface=MaterialColor("onSurface", "#E7E0EF"),
    surface_variant=MaterialColor("surfaceVariant", "#4A4458"),
    on_surface_variant=MaterialColor("onSurfaceVariant", "#CBC2DB"),
    surface_tint=MaterialColor("surfaceTint", "#97CBFF"),
    inverse_surface=MaterialColor("inverseSurface", "#E7E0EF"),
    inverse_on_surface=MaterialColor("inverseOnSurface", "#322F3A"),
    error=MaterialColor("error", "#FFB4AB"),
    on_error=MaterialColor("onError", "#690005"),
    error_container=MaterialColor("errorContainer", "#93000A"),
    on_error_container=MaterialColor("onErrorContainer", "#FFDAD6"),
    outline=MaterialColor("outline", "#958DA4"),
    outline_variant=MaterialColor("outlineVariant", "#4A4458"),
    scrim=MaterialColor("scrim", "#000000"),
    surface_bright=MaterialColor("surfaceBright", "#3B3743"),
    surface_container=MaterialColor("surfaceContainer", "#211E28"),
    surface_container_high=MaterialColor("surfaceContainerHigh", "#2C2833"),
    surface_container_highest=MaterialColor("surfaceContainerHighest", "#37333E"),
    surface_container_low=MaterialColor("surfaceContainerLow", "#1D1A24"),
    surface_container_lowest=MaterialColor("surfaceContainerLowest", "#0F0D16"),
    surface_dim=MaterialColor("surfaceDim", "#15121C"),
    primary_fixed=MaterialColor("primaryFixed", "#CEE5FF"),
    primary_fixed_dim=MaterialColor("primaryFixedDim", "#97CBFF"),
    on_primary_fixed=MaterialColor("onPrimaryFixed", "#001D33"),
    on_primary_fixed_variant=MaterialColor("onPrimaryFixedVariant", "#004A77"),
    secondary_fixed=MaterialColor("secondaryFixed", "#CEE5FF"),
    secondary_fixed_dim=MaterialColor("secondaryFixedDim", "#9CCBFB"),
    on_secondary_fixed=MaterialColor("onSecondaryFixed", "#001D33"),
    on_secondary_fixed_variant=MaterialColor("onSecondaryFixedVariant", "#104A73"),
    tertiary_fixed=MaterialColor("tertiaryFixed", "#E9DDFF"),
    tertiary_fixed_dim=MaterialColor("tertiaryFixedDim", "#CFBDFE"),
    on_tertiary_fixed=MaterialColor("onTertiaryFixed", "#201047"),
    on_tertiary_fixed_variant=MaterialColor("onTertiaryFixedVariant", "#4D3D75"),
)


PRESET_SOURCE_COLORS: Mapping[MaterialThemePreset, MaterialColor] = MappingProxyType({
    MaterialThemePreset.TONAL_SPOT: MaterialColor("sourceColor", "#6750A4"),
    MaterialThemePreset.FIDELITY: MaterialColor("sourceColor", "#6750A4"),
    MaterialThemePreset.CONTENT: MaterialColor("sourceColor", "#6750A4"),
    MaterialThemePreset.MONOCHROME: MaterialColor("sourceColor", "#6750A4"),
    MaterialThemePreset.NEUTRAL: MaterialColor("sourceColor", "#6750A4"),
    MaterialThemePreset.VIBRANT: MaterialColor("sourceColor", "#6750A4"),
    MaterialThemePreset.EXPRESSIVE: MaterialColor("sourceColor", "#6750A4"),
    MaterialThemePreset.RAINBOW: MaterialColor("sourceColor", "#6750A4"),
    MaterialThemePreset.FRUIT_SALAD: MaterialColor("sourceColor", "#6750A4"),
})


PRESET_KEY_COLORS: Mapping[MaterialThemePreset, Mapping[str, MaterialColor]] = MappingProxyType({
    MaterialThemePreset.TONAL_SPOT: MappingProxyType({
        "primary": MaterialColor("primary", "#7E6EA9"),
        "secondary": MaterialColor("secondary", "#7B748A"),
        "tertiary": MaterialColor("tertiary", "#996A79"),
        "neutral": MaterialColor("neutral", "#7A767D"),
        "neutralVariant": MaterialColor("neutralVariant", "#7A757F"),
    }),
    MaterialThemePreset.FIDELITY: MappingProxyType({
        "primary": MaterialColor("primary", "#8069BF"),
        "secondary": MaterialColor("secondary", "#7C7296"),
        "tertiary": MaterialColor("tertiary", "#C9A74D"),
        "neutral": MaterialColor("neutral", "#7A767D"),
        "neutralVariant": MaterialColor("neutralVariant", "#7A7582"),
    }),
    MaterialThemePreset.CONTENT: MappingProxyType({
        "primary": MaterialColor("primary", "#8069BF"),
        "secondary": MaterialColor("secondary", "#7C7296"),
        "tertiary": MaterialColor("tertiary", "#924274"),
        "neutral": MaterialColor("neutral", "#7A767D"),
        "neutralVariant": MaterialColor("neutralVariant", "#7A7582"),
    }),
    MaterialThemePreset.MONOCHROME: MappingProxyType({
        "primary": MaterialColor("primary", "#777777"),
        "secondary": MaterialColor("secondary", "#777777"),
        "tertiary": MaterialColor("tertiary", "#777777"),
        "neutral": MaterialColor("neutral", "#777777"),
        "neutralVariant": MaterialColor("neutralVariant", "#777777"),
    }),
    MaterialThemePreset.NEUTRAL: MappingProxyType({
        "primary": MaterialColor("primary", "#7A7484"),
        "secondary": MaterialColor("secondary", "#7A757F"),
        "tertiary": MaterialColor("tertiary", "#7B748A"),
        "neutral": MaterialColor("neutral", "#797678"),
        "neutralVariant": MaterialColor("neutralVariant", "#797678"),
    }),
    MaterialThemePreset.VIBRANT: MappingProxyType({
        "primary": MaterialColor("primary", "#6C0BFF"),
        "secondary": MaterialColor("secondary", "#856F92"),
        "tertiary": MaterialColor("tertiary", "#946994"),
        "neutral": MaterialColor("neutral", "#7A7582"),
        "neutralVariant": MaterialColor("neutralVariant", "#7A7484"),
    }),
    MaterialThemePreset.EXPRESSIVE: MappingProxyType({
        "primary": MaterialColor("primary", "#1B8672"),
        "secondary": MaterialColor("secondary", "#936B83"),
        "tertiary": MaterialColor("tertiary", "#8D6B9B"),
        "neutral": MaterialColor("neutral", "#7C757E"),
        "neutralVariant": MaterialColor("neutralVariant", "#7E7382"),
    }),
    MaterialThemePreset.RAINBOW: MappingProxyType({
        "primary": MaterialColor("primary", "#8069BF"),
        "secondary": MaterialColor("secondary", "#7B748A"),
        "tertiary": MaterialColor("tertiary", "#996A79"),
        "neutral": MaterialColor("neutral", "#777777"),
        "neutralVariant": MaterialColor("neutralVariant", "#777777"),
    }),
    MaterialThemePreset.FRUIT_SALAD: MappingProxyType({
        "primary": MaterialColor("primary", "#247CBB"),
        "secondary": MaterialColor("secondary", "#4B7BA7"),
        "tertiary": MaterialColor("tertiary", "#7E6EA9"),
        "neutral": MaterialColor("neutral", "#7A7582"),
        "neutralVariant": MaterialColor("neutralVariant", "#7B748A"),
    }),
})


PRESET_COLOR_SCHEMES: Mapping[MaterialThemePreset, Mapping[str, MaterialColorScheme]] = MappingProxyType({
    MaterialThemePreset.TONAL_SPOT: MappingProxyType({"light": TONAL_SPOT_LIGHT_COLOR_SCHEME, "dark": TONAL_SPOT_DARK_COLOR_SCHEME}),
    MaterialThemePreset.FIDELITY: MappingProxyType({"light": FIDELITY_LIGHT_COLOR_SCHEME, "dark": FIDELITY_DARK_COLOR_SCHEME}),
    MaterialThemePreset.CONTENT: MappingProxyType({"light": CONTENT_LIGHT_COLOR_SCHEME, "dark": CONTENT_DARK_COLOR_SCHEME}),
    MaterialThemePreset.MONOCHROME: MappingProxyType({"light": MONOCHROME_LIGHT_COLOR_SCHEME, "dark": MONOCHROME_DARK_COLOR_SCHEME}),
    MaterialThemePreset.NEUTRAL: MappingProxyType({"light": NEUTRAL_LIGHT_COLOR_SCHEME, "dark": NEUTRAL_DARK_COLOR_SCHEME}),
    MaterialThemePreset.VIBRANT: MappingProxyType({"light": VIBRANT_LIGHT_COLOR_SCHEME, "dark": VIBRANT_DARK_COLOR_SCHEME}),
    MaterialThemePreset.EXPRESSIVE: MappingProxyType({"light": EXPRESSIVE_LIGHT_COLOR_SCHEME, "dark": EXPRESSIVE_DARK_COLOR_SCHEME}),
    MaterialThemePreset.RAINBOW: MappingProxyType({"light": RAINBOW_LIGHT_COLOR_SCHEME, "dark": RAINBOW_DARK_COLOR_SCHEME}),
    MaterialThemePreset.FRUIT_SALAD: MappingProxyType({"light": FRUIT_SALAD_LIGHT_COLOR_SCHEME, "dark": FRUIT_SALAD_DARK_COLOR_SCHEME}),
})


MATERIAL_SOURCE_COLOR = PRESET_SOURCE_COLORS[MaterialThemePreset.TONAL_SPOT]


@dataclass(frozen=True)
class MaterialTheme:
    color_scheme: MaterialColorScheme
    source_color: Optional[MaterialColor] = MATERIAL_SOURCE_COLOR
    preset: Optional[MaterialThemePreset] = None


LIGHT_COLOR_SCHEME = TONAL_SPOT_LIGHT_COLOR_SCHEME
DARK_COLOR_SCHEME = TONAL_SPOT_DARK_COLOR_SCHEME


def _coerce_preset(preset: Union[MaterialThemePreset, str]) -> MaterialThemePreset:
    if isinstance(preset, MaterialThemePreset):
        return preset
    return MaterialThemePreset(preset)


def preset_color_scheme(
    preset: Union[MaterialThemePreset, str],
    dark: bool = False,
) -> MaterialColorScheme:
    material_preset = _coerce_preset(preset)
    return PRESET_COLOR_SCHEMES[material_preset]["dark" if dark else "light"]


def preset_key_colors(preset: Union[MaterialThemePreset, str]) -> dict[str, MaterialColor]:
    return dict(PRESET_KEY_COLORS[_coerce_preset(preset)])


def baseline_color_scheme(dark: bool = False) -> MaterialColorScheme:
    return preset_color_scheme(MaterialThemePreset.TONAL_SPOT, dark)


def custom_color_scheme(
    overrides: Mapping[str, Optional[str]],
    dark: bool = False,
    preset: Union[MaterialThemePreset, str] = MaterialThemePreset.TONAL_SPOT,
) -> MaterialColorScheme:
    base = preset_color_scheme(preset, dark)
    values = {}

    for role in COLOR_SCHEME_ROLES:
        field = ROLE_FIELDS[role]
        hex_value = overrides.get(role)
        values[field] = MaterialColor(role, hex_value) if hex_value is not None else getattr(base, field)

    return MaterialColorScheme(appearance=base.appearance, **values)


def material_theme_builder_color_scheme(
    appearance: str,
    roles: Mapping[str, str],
) -> MaterialColorScheme:
    missing_roles = [role for role in COLOR_SCHEME_ROLES if role not in roles]

    if missing_roles:
        raise ValueError("missing Material color roles: " + ", ".join(missing_roles))

    values = {
        ROLE_FIELDS[role]: MaterialColor(role, roles[role])
        for role in COLOR_SCHEME_ROLES
    }
    return MaterialColorScheme(appearance=appearance, **values)


def create_theme(
    dark: bool = False,
    color_scheme: Optional[Union[MaterialColorScheme, Mapping[str, Optional[str]]]] = None,
    preset: Union[MaterialThemePreset, str] = MaterialThemePreset.TONAL_SPOT,
) -> MaterialTheme:
    material_preset = _coerce_preset(preset)
    if color_scheme is None:
        material_color_scheme = preset_color_scheme(material_preset, dark)
        source_color = PRESET_SOURCE_COLORS[material_preset]
        theme_preset = material_preset
    elif isinstance(color_scheme, MaterialColorScheme):
        material_color_scheme = color_scheme
        source_color = None
        theme_preset = None
    else:
        material_color_scheme = custom_color_scheme(color_scheme, dark=dark, preset=material_preset)
        source_color = None
        theme_preset = None

    return MaterialTheme(
        color_scheme=material_color_scheme,
        source_color=source_color,
        preset=theme_preset,
    )


def get_theme(preset: Union[MaterialThemePreset, str], dark: bool = False) -> MaterialTheme:
    return create_theme(dark=dark, preset=preset)
