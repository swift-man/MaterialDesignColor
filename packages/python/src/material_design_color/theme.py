# Generated from tokens/ by tools/codegen/generate.rb.
# Do not edit by hand.
from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, Optional, Tuple

from .colors import MaterialColor


COLOR_SCHEME_ROLES: Tuple[str, ...] = (
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

ROLE_FIELDS: Dict[str, str] = {
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

    def to_dict(self) -> Dict[str, str]:
        return {role: self.role_color(role).hex for role in COLOR_SCHEME_ROLES}


MATERIAL_SOURCE_COLOR = MaterialColor("sourceColor", "#6750A4")


@dataclass(frozen=True)
class MaterialTheme:
    color_scheme: MaterialColorScheme
    source_color: MaterialColor = MATERIAL_SOURCE_COLOR


LIGHT_COLOR_SCHEME = MaterialColorScheme(
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


DARK_COLOR_SCHEME = MaterialColorScheme(
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


def baseline_color_scheme(dark: bool = False) -> MaterialColorScheme:
    return DARK_COLOR_SCHEME if dark else LIGHT_COLOR_SCHEME


def create_theme(dark: bool = False, color_scheme: Optional[MaterialColorScheme] = None) -> MaterialTheme:
    return MaterialTheme(color_scheme=color_scheme or baseline_color_scheme(dark))
