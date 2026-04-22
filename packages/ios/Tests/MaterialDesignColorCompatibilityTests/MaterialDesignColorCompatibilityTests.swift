import MaterialDesignColor
import SwiftUI
import Testing

struct MaterialDesignColorCompatibilityTests {
  @Test func legacyModuleExposesSwiftUIColorExtensions() {
    let color: Color = .pink400
    _ = color
  }

  @Test func legacyModuleExposesMaterialTheme() {
    #expect(MaterialTheme.light.colorScheme.primary.hex == "#65558F")
  }
}
