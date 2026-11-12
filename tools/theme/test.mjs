import {test} from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {generate, extended, swiftSource} from './generate.mjs';
const read = path => JSON.parse(readFileSync(new URL(path, import.meta.url)));
const luminance = hex => hex.slice(1).match(/../g).map(x => parseInt(x, 16) / 255).map(x => x <= .04045 ? x / 12.92 : ((x + .055) / 1.055) ** 2.4).reduce((sum, x, i) => sum + x * [.2126, .7152, .0722][i], 0);
const contrast = (a,b) => (Math.max(luminance(a), luminance(b)) + .05) / (Math.min(luminance(a), luminance(b)) + .05);
test('MCU snapshots: all 48 roles, both modes, three seeds and all variants', () => {
  for (const [seed, entries] of Object.entries(read('./snapshots.json'))) {
    for (const [variant, expected] of Object.entries(entries)) assert.deepEqual(generate(seed, variant), expected);
  }
});
test('default extended tokens match MCU harmonization and text contrast >= 4.5', () => {
  const tokens = read('../../tokens/material3/extended-color-schemes.json');
  assert.deepEqual(extended(tokens.sourceColor), {light: tokens.light, dark: tokens.dark});
  for (const seed of ['#6750A4', '#0A84FF', '#FF0000']) {
    for (const scheme of Object.values(extended(seed))) {
      for (const name of ['Success', 'Warning']) for (const suffix of ['', 'Container']) {
        assert.ok(contrast(scheme[name[0].toLowerCase()+name.slice(1)+suffix], scheme['on'+name+suffix]) >= 4.5);
      }
    }
  }
});
test('invalid input is rejected before output', () => {
  for (const seed of ['#fff', '0A84FF', '#GGGGGG', undefined]) assert.throws(() => generate(seed));
  for (const variant of ['bad', 'toString', '__proto__']) assert.throws(() => generate('#0A84FF', variant));
});


test('reference preset tokens agree with MCU for the original seed', () => {
  for (const [variant, preset] of Object.entries(read('../../tokens/material3/theme-presets.json'))) {
    const actual = generate(preset.sourceColor, variant);
    assert.deepEqual(actual.light, preset.light);
    assert.deepEqual(actual.dark, preset.dark);
  }
});
test('Swift app fixture remains reproducible', () => {
  assert.equal(swiftSource(generate('#0A84FF')), readFileSync(new URL('../../packages/ios/Tests/MaterialDesignColorMacOSTests/GeneratedMaterialTheme.swift', import.meta.url), 'utf8'));
});
