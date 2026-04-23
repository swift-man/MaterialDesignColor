# Changelog

## 2.0.0

### Highlights
- Material Design 3 baseline color schemes (light/dark, 47 roles).
- Multi-language packages: iOS (Swift), React Native (TypeScript), Python.
- Token-driven codegen — `tokens/*.json` is the single source of truth, generated outputs are committed.

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
- `MaterialDesignColorUIKit` — `UIColor` extensions.
- `MaterialDesignColor` — umbrella shim re-exporting SwiftUI surface for source-level back-compat with v1.

### New packages
- `@swift-man/material-design-color` — React Native / Expo (`packages/react-native`).
- `material-design-color` — Python (`packages/python`).

### Repository layout
- `tokens/` — JSON sources (M2 palette + M3 roles + M3 baseline schemes).
- `tools/codegen/generate.rb` — generator. CI runs `ruby tools/codegen/generate.rb --check` to fail PRs that drift.
