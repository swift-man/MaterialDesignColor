// Smoke-tests the published entry point by importing through the package
// name (Node "self-referencing"). This routes through package.json's
// `exports` map and `type` declaration, so a broken exports map, missing
// `type: "module"`, or wrong `main` would fail here — none of which a
// relative `../dist/index.js` import would catch.
import { colors, lightColorScheme, materialSourceColor } from "@swift-man/material-design-color";

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
