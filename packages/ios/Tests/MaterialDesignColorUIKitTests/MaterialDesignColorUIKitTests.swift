#if canImport(UIKit)
import XCTest
import MaterialDesignColorUIKit
import UIKit

@MainActor
final class MaterialDesignColorUIKitTests: XCTestCase {
  func testDynamicAppThemesAndBaseline() {
    let pair = MaterialTheme.pair(
      extendedLight: [.warning: MaterialColor(name: "light", red: 128, green: 64, blue: 0)],
      extendedDark: [.warning: MaterialColor(name: "dark", red: 255, green: 192, blue: 128)])
    let color = UIColor.material(light: pair.light, dark: pair.dark, \.warning)
    for (style, theme, template) in [(UIUserInterfaceStyle.light, pair.light, MaterialTheme.light),
                                     (.dark, pair.dark, MaterialTheme.dark)] {
      let traits = UITraitCollection(userInterfaceStyle: style)
      XCTAssertEqual(color.resolvedColor(with: traits), theme.colorScheme.warning.uiColor)
      XCTAssertEqual(UIColor.materialBaseline(\.warning).resolvedColor(with: traits), template.colorScheme.warning.uiColor)
    }
  }
}
#endif
