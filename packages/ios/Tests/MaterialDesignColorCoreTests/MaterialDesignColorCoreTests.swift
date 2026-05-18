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

  @Test func material3OfficialPresetColorSchemes() {
    #expect(MaterialThemePreset.allCases.count == 9)
    #expect(MaterialColorScheme.preset(.tonalSpot, appearance: .light) == MaterialColorScheme.baselineLight)
    #expect(MaterialColorScheme.preset(.rainbow, appearance: .light).primary.hex == "#6750A4")
    #expect(MaterialColorScheme.preset(.fruitSalad, appearance: .dark).primary.hex == "#97CBFF")
    #expect(MaterialTheme.preset(.expressive, appearance: .light).colorScheme.primary.hex == "#006B5A")
    #expect(MaterialTheme.preset(.vibrant, appearance: .light).themePreset == .vibrant)
    #expect(MaterialThemePreset.vibrant.keyColors.primary.hex == "#6C0BFF")
  }

  @Test func materialThemeBuilderCustomColorSchemes() throws {
    let theme = MaterialTheme.custom(
      appearance: .light,
      overrides: [
        .primary: "#6750A4",
        .onPrimary: "#FFFFFF",
        .primaryContainer: "#EADDFF",
        .onPrimaryContainer: "#21005D",
        .surface: "#FFFBFE",
        .onSurface: "#1C1B1F"
      ]
    )

    #expect(theme.colorScheme.primary.hex == "#6750A4")
    #expect(theme.colorScheme[.onPrimary].hex == "#FFFFFF")
    #expect(theme.colorScheme.primaryContainer.hex == "#EADDFF")
    #expect(theme.colorScheme.secondary.hex == MaterialColorScheme.baselineLight.secondary.hex)
    #expect(theme.themePreset == nil)

    let roles = Dictionary(
      uniqueKeysWithValues: MaterialColorRole.allCases.map { role in
        (role, MaterialColorScheme.baselineLight[role].hex)
      }
    )
    let scheme = try MaterialColorScheme.custom(appearance: .light, roles: roles)

    #expect(scheme.primary.hex == MaterialColorScheme.baselineLight.primary.hex)
    #expect(scheme.surface.hex == MaterialColorScheme.baselineLight.surface.hex)
  }

  @Test func material3SourceColor() {
    #expect(MaterialTheme.materialSourceColor.hex == "#6750A4")
    #expect(MaterialTheme.light.sourceColor.hex == "#6750A4")
    #expect(MaterialTheme.dark.sourceColor.hex == "#6750A4")
  }
}
