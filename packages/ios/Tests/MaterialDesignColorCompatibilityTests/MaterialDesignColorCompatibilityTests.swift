import MaterialDesignColor
import SwiftUI
import XCTest

final class MaterialDesignColorCompatibilityTests: XCTestCase {
  func testLegacyModuleExposesSwiftUIColorExtensions() {
    let color: Color = .pink400
    _ = color
  }

  func testLegacyModuleExposesMaterialTheme() {
    XCTAssertEqual(MaterialTheme.light.colorScheme.primary.hex, "#65558F")
  }
}
