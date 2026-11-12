# Changelog

## Unreleased

## 2.2.0

- 기본 48개 M3 롤을 유지하고 harmonized success/warning 확장 롤 8개를 Swift, JS, Python에 추가했습니다.
- SwiftUI 루트에서 시스템 모드에 따라 preset 또는 custom light/dark 테마를 자동 주입합니다.
- macOS AppKit 제품과 sRGB NSColor 변환, 동적 baseline 색상을 추가했습니다.
- MCU 0.4.0 기반 seed/variant 빌드 시 생성 도구와 전체 스킴 스냅샷, 대비 검증을 추가했습니다.
- macOS SwiftUI 환경 전파 및 AppKit 검증을 CI에 추가했습니다.

## 2.1.0

### New
- Added official Material 3 preset color schemes: `tonalSpot`, `fidelity`, `content`, `monochrome`, `neutral`, `vibrant`, `expressive`, `rainbow`, and `fruitSalad`.
- Added preset selection APIs for Swift, JavaScript / TypeScript, and Python while keeping the existing baseline API as the `tonalSpot` alias.
- Added Material Theme Builder role-color injection APIs for Swift, JavaScript / TypeScript, and Python.
- Added preset key colors generated from Material Color Utilities 0.4.0.
- Added DocC generation and GitHub Actions deployment to `swift-man/docs`.
- Added a README API Documentation section linking to the `MaterialDesignColorCore` DocC site.
- Added repository agent guidance for SOLID design and PR review bot triage.

## 2.0.0

### Highlights
- Material Design 3 baseline color schemes (light/dark, 48 roles).
- Multi-language packages: iOS (Swift), React Native (TypeScript), Python.
- Token-driven codegen — `tokens/*.json` is the single source of truth, generated outputs are committed.

### Migrating from v1
The v1 public surface was the SwiftUI `Color.<token>` extensions (`Color.red50`, `Color.pink400`, ...) shipped from a single `MaterialDesignColor` module. v2 keeps that surface intact through the `MaterialDesignColor` umbrella product, so v1 call sites compile unchanged. New code should prefer `MaterialPalette.<token>` (palette enum) and the M3 surface (`MaterialColorScheme.baselineLight/Dark`, `MaterialTheme`).

### Breaking changes (iOS)
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
