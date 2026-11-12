import assert from "node:assert/strict";
// Smoke-tests the published entry point by importing through the package
// name (Node "self-referencing"). This routes through package.json's
// `exports` map and `type` declaration, so a broken exports map, missing
// `type: "module"`, or wrong `main` would fail here — none of which a
// relative `../dist/index.js` import would catch.
import {
  colors,
  createMaterialTheme,
  darkColorScheme,
  getMaterialTheme,
  getMaterialThemeColorScheme,
  getMaterialThemeKeyColors,
  lightColorScheme,
  materialColorSchemeRoles,
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

attemptFrozenMutation(() => {
  materialColorSchemeRoles[0] = "surface";
});

attemptFrozenMutation(() => {
  materialThemePresets.push("bogus");
});

attemptFrozenMutation(() => {
  lightColorScheme.primary = "#666666";
});

attemptFrozenMutation(() => {
  darkColorScheme.primary = "#777777";
});

let invalidHexRejected = false;
try {
  createMaterialTheme({ colorScheme: { primary: "not-a-hex" } });
} catch (error) {
  if (!(error instanceof RangeError) || !String(error.message).includes("#RRGGBB")) {
    throw error;
  }

  invalidHexRejected = true;
}

if (!invalidHexRejected) {
  throw new Error("createMaterialTheme accepted an invalid hex override");
}

const checks = [
  ["colors.pink400", colors.pink400, "#EC407A"],
  ["lightColorScheme.primary", lightColorScheme.primary, "#65558F"],
  ["darkColorScheme.primary", darkColorScheme.primary, "#CFBDFE"],
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
  ["materialColorSchemeRoles freeze isolation", createMaterialTheme({ colorScheme: { primary: "#000000" } }).colorScheme.primary, "#000000"],
  ["materialThemePresets freeze isolation", String(materialThemePresets.length), "9"],
  ["lightColorScheme freeze isolation", lightColorScheme.primary, "#65558F"],
  ["darkColorScheme freeze isolation", darkColorScheme.primary, "#CFBDFE"],
];

for (const [label, actual, expected] of checks) {
  if (actual !== expected) {
    throw new Error(`${label} mismatch: expected ${expected}, got ${actual}`);
  }
}



// Extended status colors do not change the standard role contract.
const extended = await import('@swift-man/material-design-color');
assert.equal(extended.materialColorSchemeRoles.length, 48);
assert.equal(extended.materialExtendedColorRoles.length, 8);
for (const preset of extended.materialThemePresets) {
  for (const dark of [false, true]) {
    const theme = extended.createMaterialTheme({preset, dark});
    assert.equal(theme.colorScheme.success, extended.materialThemePresetSchemes[preset][dark ? 'dark' : 'light'].success);
    assert.match(theme.colorScheme.onWarningContainer, /^#[0-9A-F]{6}$/);
  }
}
assert.equal(extended.createMaterialTheme({colorScheme: {success: '#123456'}}).colorScheme.success, '#123456');
assert.throws(() => extended.createMaterialTheme({colorScheme: {warning: '#bad'}}), RangeError);
assert.notEqual(extended.lightColorScheme.success, '#123456');

assert.equal(extended.getSchemeColor(extended.lightColorScheme, 'warning'), extended.lightColorScheme.warning);
assert.equal(extended.getSchemeColor(extended.createMaterialTheme({colorScheme: {success: '#123456'}}).colorScheme, 'success'), '#123456');
assert.equal(extended.getSchemeColor({}, 'warning'), undefined);
assert.equal(extended.getSchemeColor({}, 'primary'), undefined);

// Public WCAG API: independent reference values and invalid external inputs.
const { contrastRatio, contrastIssues } = await import('@swift-man/material-design-color');
assert.equal(contrastRatio('#000000', '#FFFFFF'), 21);
assert.equal(contrastRatio('#abcdef', '#ABCDEF'), 1);
assert.ok(Math.abs(contrastRatio('#FF0000', '#FFFFFF') - 3.9984767707539985) < 1e-10);
assert.equal(contrastRatio('#123456', '#abcdef'), contrastRatio('#abcdef', '#123456'));
for (const invalid of ['', '#fff', '#GG0000', '#FFFFFF\n', null, 123]) {
  assert.throws(() => contrastRatio(invalid, '#FFFFFF'), TypeError);
  assert.throws(() => contrastRatio('#FFFFFF', invalid), TypeError);
}
for (const minimum of [NaN, Infinity, -Infinity, 0.99, 21.01, '4.5']) {
  assert.throws(() => contrastIssues(lightColorScheme, minimum), RangeError);
}
const finalScheme = createMaterialTheme({ colorScheme: { primary: '#FFFFFF', onPrimary: '#FFFFFF', warning: '#000000', onWarning: '#000000' } }).colorScheme;
const diagnostics = contrastIssues(finalScheme);
assert.ok(diagnostics.some(x => x.colorRole === 'primary' && x.onRole === 'onPrimary' && x.ratio === 1));
assert.ok(diagnostics.some(x => x.colorRole === 'warning' && x.onRole === 'onWarning' && x.ratio === 1));
assert.ok(Object.isFrozen(diagnostics) && diagnostics.every(Object.isFrozen));
assert.equal(contrastIssues(finalScheme, 1).length, 0);
assert.equal(contrastIssues(lightColorScheme, 21).length, 35);
const legacy = Object.fromEntries(materialColorSchemeRoles.map(role => [role, lightColorScheme[role]]));
assert.equal(contrastIssues(legacy, 21).length, 31);
assert.throws(() => contrastIssues({ ...legacy, warning: '#000000' }), TypeError);
assert.ok(contrastIssues(lightColorScheme, 21).some(x => x.colorRole === 'primaryFixedDim' && x.onRole === 'onPrimaryFixedVariant'));
assert.ok(contrastIssues(lightColorScheme, 21).some(x => x.colorRole === 'surfaceContainerHighest' && x.onRole === 'onSurface'));

console.log("ESM smoke test passed.");
