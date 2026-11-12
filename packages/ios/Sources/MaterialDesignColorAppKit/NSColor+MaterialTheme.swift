// Generated from tokens/ by tools/codegen/generate.rb.
// Do not edit by hand.
#if canImport(AppKit)
import AppKit
import MaterialDesignColorCore

public extension NSColor {
  /// Resolves a role from final app-owned light/dark themes for the native appearance.
  /// Both standard and extended roles are supported via a scheme key path.
  /// Example: `NSColor.material(light: pair.light, dark: pair.dark, \.warning)`.
  static func material(light: MaterialTheme, dark: MaterialTheme,
                       _ role: KeyPath<MaterialColorScheme, MaterialColor>) -> NSColor {
    NSColor(name: nil) { appearance in
      let isDark = appearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua
      return (isDark ? dark : light).colorScheme[keyPath: role].nsColor
    }
  }
}
#endif
