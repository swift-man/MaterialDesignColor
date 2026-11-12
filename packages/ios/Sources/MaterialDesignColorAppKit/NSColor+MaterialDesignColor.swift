#if canImport(AppKit)
@_exported import MaterialDesignColorCore
import AppKit

public extension NSColor {
  /// Converts a Material color to an sRGB AppKit color.
  ///
  /// ```swift
  /// let color = NSColor(materialColor: MaterialTheme.light.colorScheme.success)
  /// ```
  convenience init(materialColor: MaterialColor) {
    self.init(srgbRed: CGFloat(materialColor.red) / 255,
              green: CGFloat(materialColor.green) / 255,
              blue: CGFloat(materialColor.blue) / 255,
              alpha: CGFloat(materialColor.alpha) / 255)
  }

  /// Resolves a baseline role dynamically for the current AppKit appearance.
  /// Use `NSColor.materialBaseline(\.success)` for a dynamic status color.
  static func materialBaseline(_ role: KeyPath<MaterialColorScheme, MaterialColor>) -> NSColor {
    NSColor(name: nil) { appearance in
      let dark = appearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua
      return NSColor(materialColor: (dark ? MaterialColorScheme.baselineDark : .baselineLight)[keyPath: role])
    }
  }
}

public extension MaterialColor {
  /// This color as an sRGB `NSColor`, e.g. `theme.colorScheme.success.nsColor`.
  var nsColor: NSColor { NSColor(materialColor: self) }
}
#endif
