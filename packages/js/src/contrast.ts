// Generated from tokens/ by tools/codegen/generate.rb.
// Do not edit by hand.
import type { MaterialColorScheme, MaterialExtendedColors } from "./colorScheme.js";

/** Immutable diagnostic for an actual semantic fill/content pair. Role names are camelCase. */
export interface MaterialContrastIssue {
  readonly colorRole: string;
  readonly onRole: string;
  readonly ratio: number;
}

/** WCAG 2.x ratio of opaque #RRGGBB sRGB colors. Composite translucent UI first.
 * @throws TypeError for malformed hex inputs.
 */
export function contrastRatio(color: string, other: string): number {
  function luminance(hex: string): number {
    if (typeof hex !== "string" || hex.length !== 7 || !/^#[0-9a-fA-F]{6}$/.test(hex)) {
      throw new TypeError("expected #RRGGBB hex color");
    }
    const components = [1, 3, 5].map(offset => {
      const c = parseInt(hex.slice(offset, offset + 2), 16) / 255;
      return c <= 0.04045 ? c / 12.92 : ((c + 0.055) / 1.055) ** 2.4;
    });
    return 0.2126 * components[0]! + 0.7152 * components[1]! + 0.0722 * components[2]!;
  }
  const a = luminance(color), b = luminance(other);
  return (Math.max(a, b) + 0.05) / (Math.min(a, b) + 0.05);
}

const pairs = [["primary","onPrimary"],["primaryContainer","onPrimaryContainer"],["secondary","onSecondary"],["secondaryContainer","onSecondaryContainer"],["tertiary","onTertiary"],["tertiaryContainer","onTertiaryContainer"],["error","onError"],["errorContainer","onErrorContainer"],["background","onBackground"],["surface","onSurface"],["surfaceVariant","onSurfaceVariant"],["inverseSurface","inverseOnSurface"],["surfaceBright","onSurface"],["surfaceContainer","onSurface"],["surfaceContainerHigh","onSurface"],["surfaceContainerHighest","onSurface"],["surfaceContainerLow","onSurface"],["surfaceContainerLowest","onSurface"],["surfaceDim","onSurface"],["primaryFixed","onPrimaryFixed"],["primaryFixed","onPrimaryFixedVariant"],["primaryFixedDim","onPrimaryFixed"],["primaryFixedDim","onPrimaryFixedVariant"],["secondaryFixed","onSecondaryFixed"],["secondaryFixed","onSecondaryFixedVariant"],["secondaryFixedDim","onSecondaryFixed"],["secondaryFixedDim","onSecondaryFixedVariant"],["tertiaryFixed","onTertiaryFixed"],["tertiaryFixed","onTertiaryFixedVariant"],["tertiaryFixedDim","onTertiaryFixed"],["tertiaryFixedDim","onTertiaryFixedVariant"],["success","onSuccess"],["successContainer","onSuccessContainer"],["warning","onWarning"],["warningContainer","onWarningContainer"]] as const;

/** Checks standard and present extended semantic pairs; does not infer arbitrary UI adjacency.
 * Legacy 48-role schemes omit custom pairs. If either member of a custom pair is present,
 * both must be valid hex colors. Presence uses the `in` operator, including inherited keys;
 * explicit undefined values are invalid, even when both members are undefined.
 * Unlike createMaterialTheme overrides, this validates a final scheme, not an override map.
 * Returns frozen diagnostics without mutating the scheme.
 * @throws RangeError unless minimum is finite and in 1...21; TypeError for invalid pair colors.
 */
export function contrastIssues(
  scheme: MaterialColorScheme & Partial<MaterialExtendedColors>, minimum = 4.5,
): readonly MaterialContrastIssue[] {
  if (!Number.isFinite(minimum) || minimum < 1 || minimum > 21) {
    throw new RangeError("minimum must be finite and in 1...21");
  }
  const issues: MaterialContrastIssue[] = [];
  for (const [colorRole, onRole] of pairs) {
    if (["success","onSuccess","successContainer","onSuccessContainer","warning","onWarning","warningContainer","onWarningContainer"].includes(colorRole) &&
        !(colorRole in scheme) && !(onRole in scheme)) continue;
    const ratio = contrastRatio(scheme[colorRole]!, scheme[onRole]!);
    if (ratio < minimum) issues.push(Object.freeze({ colorRole, onRole, ratio }));
  }
  return Object.freeze(issues);
}
