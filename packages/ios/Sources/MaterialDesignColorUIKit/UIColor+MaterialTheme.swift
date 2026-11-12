// Generated from tokens/ by tools/codegen/generate.rb.
// Do not edit by hand.
#if canImport(UIKit)
import UIKit
import MaterialDesignColorCore

public extension UIColor {
  /// Resolves a role from final app-owned light/dark themes for the native appearance.
  /// Both standard and extended roles are supported via a scheme key path.
  /// Example: `UIColor.material(light: pair.light, dark: pair.dark, \.warning)`.
  static func material(light: MaterialTheme, dark: MaterialTheme,
                       _ role: KeyPath<MaterialColorScheme, MaterialColor>) -> UIColor {
    UIColor { trait in
      let isDark = trait.userInterfaceStyle == .dark
      return (isDark ? dark : light).colorScheme[keyPath: role].uiColor
    }
  }
}
#endif
