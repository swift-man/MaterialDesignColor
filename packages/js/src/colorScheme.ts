// Generated from tokens/ by tools/codegen/generate.rb.
// Do not edit by hand.
export const materialColorSchemeRoles = [
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
] as const;

export const materialSourceColor = "#6750A4";

export const lightColorScheme = {
  primary: "#65558F",
  onPrimary: "#FFFFFF",
  primaryContainer: "#E9DDFF",
  onPrimaryContainer: "#4D3D75",
  inversePrimary: "#CFBDFE",
  secondary: "#625B71",
  onSecondary: "#FFFFFF",
  secondaryContainer: "#E8DEF8",
  onSecondaryContainer: "#4A4458",
  tertiary: "#7E5260",
  onTertiary: "#FFFFFF",
  tertiaryContainer: "#FFD9E3",
  onTertiaryContainer: "#633B48",
  background: "#FDF7FF",
  onBackground: "#1D1B20",
  surface: "#FDF7FF",
  onSurface: "#1D1B20",
  surfaceVariant: "#E7E0EB",
  onSurfaceVariant: "#49454E",
  surfaceTint: "#65558F",
  inverseSurface: "#322F35",
  inverseOnSurface: "#F5EFF7",
  error: "#BA1A1A",
  onError: "#FFFFFF",
  errorContainer: "#FFDAD6",
  onErrorContainer: "#93000A",
  outline: "#7A757F",
  outlineVariant: "#CAC4CF",
  scrim: "#000000",
  surfaceBright: "#FDF7FF",
  surfaceContainer: "#F2ECF4",
  surfaceContainerHigh: "#ECE6EE",
  surfaceContainerHighest: "#E6E0E9",
  surfaceContainerLow: "#F8F2FA",
  surfaceContainerLowest: "#FFFFFF",
  surfaceDim: "#DED8E0",
  primaryFixed: "#E9DDFF",
  primaryFixedDim: "#CFBDFE",
  onPrimaryFixed: "#201047",
  onPrimaryFixedVariant: "#4D3D75",
  secondaryFixed: "#E8DEF8",
  secondaryFixedDim: "#CBC2DB",
  onSecondaryFixed: "#1E192B",
  onSecondaryFixedVariant: "#4A4458",
  tertiaryFixed: "#FFD9E3",
  tertiaryFixedDim: "#EFB8C8",
  onTertiaryFixed: "#31101D",
  onTertiaryFixedVariant: "#633B48",
} as const;

export const darkColorScheme = {
  primary: "#CFBDFE",
  onPrimary: "#36275D",
  primaryContainer: "#4D3D75",
  onPrimaryContainer: "#E9DDFF",
  inversePrimary: "#65558F",
  secondary: "#CBC2DB",
  onSecondary: "#332D41",
  secondaryContainer: "#4A4458",
  onSecondaryContainer: "#E8DEF8",
  tertiary: "#EFB8C8",
  onTertiary: "#4A2532",
  tertiaryContainer: "#633B48",
  onTertiaryContainer: "#FFD9E3",
  background: "#141218",
  onBackground: "#E6E0E9",
  surface: "#141218",
  onSurface: "#E6E0E9",
  surfaceVariant: "#49454E",
  onSurfaceVariant: "#CAC4CF",
  surfaceTint: "#CFBDFE",
  inverseSurface: "#E6E0E9",
  inverseOnSurface: "#322F35",
  error: "#FFB4AB",
  onError: "#690005",
  errorContainer: "#93000A",
  onErrorContainer: "#FFDAD6",
  outline: "#948F99",
  outlineVariant: "#49454E",
  scrim: "#000000",
  surfaceBright: "#3B383E",
  surfaceContainer: "#211F24",
  surfaceContainerHigh: "#2B292F",
  surfaceContainerHighest: "#36343A",
  surfaceContainerLow: "#1D1B20",
  surfaceContainerLowest: "#0F0D13",
  surfaceDim: "#141218",
  primaryFixed: "#E9DDFF",
  primaryFixedDim: "#CFBDFE",
  onPrimaryFixed: "#201047",
  onPrimaryFixedVariant: "#4D3D75",
  secondaryFixed: "#E8DEF8",
  secondaryFixedDim: "#CBC2DB",
  onSecondaryFixed: "#1E192B",
  onSecondaryFixedVariant: "#4A4458",
  tertiaryFixed: "#FFD9E3",
  tertiaryFixedDim: "#EFB8C8",
  onTertiaryFixed: "#31101D",
  onTertiaryFixedVariant: "#633B48",
} as const;

export type MaterialColorRole = (typeof materialColorSchemeRoles)[number];
export type MaterialColorScheme = {
  readonly [Role in MaterialColorRole]: string;
};

export type MaterialColorSchemeInput = Partial<Record<MaterialColorRole, string>>;

export interface MaterialTheme {
  readonly dark: boolean;
  readonly sourceColor: string;
  readonly colorScheme: MaterialColorScheme;
}

export interface MaterialThemeOptions {
  readonly dark?: boolean;
  readonly colorScheme?: MaterialColorSchemeInput;
}

export function createMaterialTheme(options: MaterialThemeOptions = {}): MaterialTheme {
  const dark = options.dark ?? false;
  const base = dark ? darkColorScheme : lightColorScheme;

  return {
    dark,
    sourceColor: materialSourceColor,
    colorScheme: {
      ...base,
      ...options.colorScheme,
    },
  };
}

export function getSchemeColor(
  colorScheme: MaterialColorScheme,
  role: MaterialColorRole,
): string {
  return colorScheme[role];
}
