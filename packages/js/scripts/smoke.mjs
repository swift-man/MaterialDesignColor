// Smoke-tests the built ESM artifact by importing dist/ and asserting
// known hex values from each public namespace. Catches packaging regressions
// (ESM/CJS shape, exports map, path resolution) that a type-check alone misses.
import { colors, lightColorScheme, materialSourceColor } from "../dist/index.js";

const checks = [
  ["colors.pink400", colors.pink400, "#EC407A"],
  ["lightColorScheme.primary", lightColorScheme.primary, "#65558F"],
  ["materialSourceColor", materialSourceColor, "#6750A4"],
];

for (const [label, actual, expected] of checks) {
  if (actual !== expected) {
    throw new Error(`${label} mismatch: expected ${expected}, got ${actual}`);
  }
}

console.log("ESM smoke test passed.");
