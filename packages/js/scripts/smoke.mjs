// Smoke-tests the published entry point by importing through the package
// name (Node "self-referencing"). This routes through package.json's
// `exports` map and `type` declaration, so a broken exports map, missing
// `type: "module"`, or wrong `main` would fail here — none of which a
// relative `../dist/index.js` import would catch.
import {
  colors,
  createMaterialTheme,
  getMaterialTheme,
  getMaterialThemeKeyColors,
  lightColorScheme,
  materialSourceColor,
  materialThemePresets,
} from "@swift-man/material-design-color";

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
];

for (const [label, actual, expected] of checks) {
  if (actual !== expected) {
    throw new Error(`${label} mismatch: expected ${expected}, got ${actual}`);
  }
}

console.log("ESM smoke test passed.");
