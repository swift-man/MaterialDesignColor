import XCTest
@testable import MaterialDesignColorCore

final class MaterialDesignColorCoreTests: XCTestCase {
  func testKnownTokenValues() {
    XCTAssertEqual(MaterialPalette.pink400.hex, "#EC407A")
    XCTAssertEqual(MaterialPalette.blue300.rgb.red, 0x64)
    XCTAssertEqual(MaterialPalette.blue300.rgb.green, 0xB5)
    XCTAssertEqual(MaterialPalette.blue300.rgb.blue, 0xF6)
    XCTAssertEqual(MaterialPalette.tealA700.argb, 0xFF00BFA5)
  }

  func testAllTokensAreReachableByName() {
    XCTAssertEqual(MaterialPalette.all.count, 254)
    XCTAssertEqual(MaterialPalette["red50"]?.hex, "#FFEBEE")
    XCTAssertEqual(MaterialPalette.byName["blueGrey900"]?.hex, "#263238")
  }

  func testMaterial3BaselineColorSchemes() {
    XCTAssertEqual(MaterialColorScheme.baselineLight.primary.hex, "#65558F")
    XCTAssertEqual(MaterialColorScheme.baselineLight.onSurface.hex, "#1D1B20")
    XCTAssertEqual(MaterialColorScheme.baselineLight.primaryContainer.hex, "#E9DDFF")
    XCTAssertEqual(MaterialColorScheme.baselineDark.surfaceContainerHighest.hex, "#36343A")
    XCTAssertEqual(MaterialTheme.dark.colorScheme.primary.hex, "#CFBDFE")
  }
}
