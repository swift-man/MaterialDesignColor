import SwiftUI
import MaterialDesignColorCore

private struct AdaptiveMaterialTheme: ViewModifier {
  @Environment(\.colorScheme) private var colorScheme
  let light: MaterialTheme
  let dark: MaterialTheme

  func body(content: Content) -> some View {
    content.environment(\.materialTheme, colorScheme == .dark ? dark : light)
  }
}

public extension View {
  /// Injects the theme matching SwiftUI's color scheme, updating when it changes.
  /// Pass custom themes as a light/dark pair at the root of your view hierarchy.
  ///
  /// ```swift
  /// ContentView().materialTheme(light: .light, dark: .dark)
  /// ```
  func materialTheme(light: MaterialTheme, dark: MaterialTheme) -> some View {
    modifier(AdaptiveMaterialTheme(light: light, dark: dark))
  }

  /// Injects both appearances of a preset and follows the system color scheme.
  ///
  /// ```swift
  /// ContentView().materialTheme(preset: .tonalSpot)
  /// ```
  func materialTheme(preset: MaterialThemePreset) -> some View {
    materialTheme(light: .preset(preset, appearance: .light),
                  dark: .preset(preset, appearance: .dark))
  }
}
