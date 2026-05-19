// Smoke-tests the published entry point by importing through the package
// name (Node "self-referencing"). This routes through package.json's
// `exports` map and `type` declaration, so a broken exports map, missing
// `type: "module"`, or wrong `main` would fail here — none of which a
// relative `../dist/index.js` import would catch.
import {
  colors,
  createMaterialTheme,
  getMaterialTheme,
  getMaterialThemeColorScheme,
  getMaterialThemeKeyColors,
  lightColorScheme,
  materialSourceColor,
  materialThemePresetKeyColors,
  materialThemePresetSchemes,
  materialThemePresetSourceColors,
  materialThemePresets,
} from "@swift-man/material-design-color";

function attemptFrozenMutation(mutate) {
  try {
    mutate();
  } catch (error) {
    if (!(error instanceof TypeError)) {
      throw error;
    }
  }
}

const copiedColorScheme = getMaterialThemeColorScheme("tonalSpot");
copiedColorScheme.primary = "#000000";

const copiedKeyColors = getMaterialThemeKeyColors("vibrant");
copiedKeyColors.primary = "#111111";

const copiedTheme = createMaterialTheme();
copiedTheme.colorScheme.primary = "#222222";

attemptFrozenMutation(() => {
  materialThemePresetSchemes.tonalSpot.light.primary = "#333333";
});

attemptFrozenMutation(() => {
  materialThemePresetKeyColors.vibrant.primary = "#444444";
});

attemptFrozenMutation(() => {
  materialThemePresetSourceColors.tonalSpot = "#555555";
});

const checks = [
  ["colors.pink400", colors.pink400, "#EC407A"],
  ["lightColorScheme.primary", lightColorScheme.primary, "#65558F"],
  ["materialSourceColor", materialSourceColor, "#6750A4"],
  ["materialThemePresets.length", String(materialThemePresets.length), "9"],
  ["getMaterialTheme(expressive).primary", getMaterialTheme("expressive").colorScheme.primary, "#006B5A"],
  ["getMaterialTheme(fruitSalad,dark).primary", getMaterialTheme("fruitSalad", { dark: true }).colorScheme.primary, "#97CBFF"],
  ["getMaterialThemeKeyColors(vibrant).primary", getMaterialThemeKeyColors("vibrant").primary, "#6C0BFF"],
  ["createMaterialTheme(undefined override).primary", createMaterialTheme({ colorScheme: { primary: undefined } }).colorScheme.primary, "#65558F"],
  ["createMaterialTheme(custom builder).surface", createMaterialTheme({ colorScheme: { surface: "#FFFBFE", onSurface: "#1C1B1F" } }).colorScheme.surface, "#FFFBFE"],
  ["getMaterialThemeColorScheme mutation isolation", getMaterialThemeColorScheme("tonalSpot").primary, "#65558F"],
  ["getMaterialThemeKeyColors mutation isolation", getMaterialThemeKeyColors("vibrant").primary, "#6C0BFF"],
  ["createMaterialTheme mutation isolation", createMaterialTheme().colorScheme.primary, "#65558F"],
  ["materialThemePresetSchemes freeze isolation", getMaterialThemeColorScheme("tonalSpot").primary, "#65558F"],
  ["materialThemePresetKeyColors freeze isolation", getMaterialThemeKeyColors("vibrant").primary, "#6C0BFF"],
  ["materialThemePresetSourceColors freeze isolation", createMaterialTheme().sourceColor, "#6750A4"],
];

for (const [label, actual, expected] of checks) {
  if (actual !== expected) {
    throw new Error(`${label} mismatch: expected ${expected}, got ${actual}`);
  }
}

console.log("ESM smoke test passed.");
