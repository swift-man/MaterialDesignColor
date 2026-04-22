import Testing
@testable import MaterialDesignColorCore

struct MaterialDesignColorCoreTests {
  @Test func knownTokenValues() {
    #expect(MaterialPalette.pink400.hex == "#EC407A")
    #expect(MaterialPalette.blue300.rgb.red == 0x64)
    #expect(MaterialPalette.blue300.rgb.green == 0xB5)
    #expect(MaterialPalette.blue300.rgb.blue == 0xF6)
    #expect(MaterialPalette.tealA700.argb == 0xFF00BFA5)
  }

  @Test func allTokensAreReachableByName() {
    #expect(MaterialPalette.all.count == 254)
    #expect(MaterialPalette["red50"]?.hex == "#FFEBEE")
    #expect(MaterialPalette.byName["blueGrey900"]?.hex == "#263238")
  }

  @Test func material3BaselineColorSchemes() {
    #expect(MaterialColorScheme.baselineLight.primary.hex == "#65558F")
    #expect(MaterialColorScheme.baselineLight.onSurface.hex == "#1D1B20")
    #expect(MaterialColorScheme.baselineLight.primaryContainer.hex == "#E9DDFF")
    #expect(MaterialColorScheme.baselineDark.surfaceContainerHighest.hex == "#36343A")
    #expect(MaterialTheme.dark.colorScheme.primary.hex == "#CFBDFE")
  }
}
