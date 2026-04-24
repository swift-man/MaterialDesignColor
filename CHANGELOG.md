# Changelog

## 2.0.0

### Highlights
- Material Design 3 baseline color schemes (light/dark, 48 roles).
- Multi-language packages: iOS (Swift), React Native (TypeScript), Python.
- Token-driven codegen — `tokens/*.json` is the single source of truth, generated outputs are committed.

### Migrating from v1
The v1 public surface was the SwiftUI `Color.<token>` extensions (`Color.red50`, `Color.pink400`, ...) shipped from a single `MaterialDesignColor` module. v2 keeps that surface intact through the `MaterialDesignColor` umbrella product, so v1 call sites compile unchanged. New code should prefer `MaterialPalette.<token>` (palette enum) and the M3 surface (`MaterialColorScheme.baselineLight/Dark`, `MaterialTheme`).

### Breaking changes (iOS)
- `MaterialColor.init(name:hex:)` is now `internal`. External code should use `MaterialPalette.<name>` or scheme accessors instead of constructing `MaterialColor` directly.
- `MaterialColorScheme.sourceColor` removed. The source color now lives on `MaterialTheme`:
  - `MaterialTheme.sourceColor` (instance)
  - `MaterialTheme.materialSourceColor` (default static)
- `MaterialColorScheme.init(...)` no longer takes a `sourceColor:` argument.
- Minimum platform: iOS 13 / macOS 10.15 / tvOS 13 / watchOS 6 (was iOS 12).
- Swift tools version: 6.0; tests adopt Swift Testing (Xcode 16+).

### New (iOS)
- `MaterialDesignColorCore` — pure-data target (no UI dependency).
- `MaterialDesignColorSwiftUI` — `Color` extensions + `MaterialTheme` environment.
- `MaterialDesignColorUIKit` — `UIColor` extensions, plus `UIColor.materialBaseline(\.role)` for adaptive light/dark colors via `UIColor(dynamicProvider:)`.
- `MaterialDesignColor` — umbrella shim re-exporting SwiftUI surface for source-level back-compat with v1.

### New packages
- `@swift-man/material-design-color` — JavaScript / TypeScript (`packages/js`); framework-agnostic, works in React Native, Expo, web, Node.
- `material-design-color` — Python (`packages/python`).

### Repository layout
- `tokens/` — JSON sources (M2 palette + M3 roles + M3 baseline schemes).
- `tools/codegen/generate.rb` — generator. CI runs `ruby tools/codegen/generate.rb --check` to fail PRs that drift.
