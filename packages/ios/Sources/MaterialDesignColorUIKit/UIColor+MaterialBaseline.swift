#if canImport(UIKit)
import MaterialDesignColorCore
import UIKit

public extension UIColor {
  /// Returns a `UIColor` that resolves between the M3 baseline light and dark
  /// schemes based on the trait collection's `userInterfaceStyle`.
  ///
  /// ```swift
  /// view.backgroundColor = .materialBaseline(\.primary)
  /// ```
  ///
  /// For a non-baseline `MaterialColorScheme` pair, build the dynamic color
  /// directly with `UIColor(dynamicProvider:)` and the `MaterialColor`-based
  /// `UIColor(materialColor:)` initializer.
  @available(iOS 13.0, tvOS 13.0, *)
  static func materialBaseline(_ role: KeyPath<MaterialColorScheme, MaterialColor>) -> UIColor {
    UIColor { trait in
      let scheme: MaterialColorScheme = trait.userInterfaceStyle == .dark
        ? .baselineDark
        : .baselineLight
      return UIColor(materialColor: scheme[keyPath: role])
    }
  }
}
#endif
