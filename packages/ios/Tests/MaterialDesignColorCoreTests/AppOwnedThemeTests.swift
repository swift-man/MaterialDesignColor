import Testing
@testable import MaterialDesignColorCore

struct AppOwnedThemeTests {
  let black = MaterialColor(name: "appBlack", red: 0, green: 0, blue: 0)
  let white = MaterialColor(name: "appWhite", red: 255, green: 255, blue: 255)

  @Test func componentsAndWCAGReferenceValues() throws {
    #expect(black.hex == "#000000")
    #expect(white.argb == 0xFFFFFFFF)
    let color = MaterialColor(role: .primary, red: 10, green: 132, blue: 255)
    #expect(color == (try MaterialColor(role: .primary, hex: "#0A84FF")))
    #expect(color.alpha == 255)
    #expect(black.contrastRatio(with: white) == 21)
    #expect(white.contrastRatio(with: white) == 1)
    let red = MaterialColor(name: "red", red: 255, green: 0, blue: 0)
    #expect(abs(red.contrastRatio(with: white) - 3.9984767707539985) < 0.0000001)
    #expect(red.contrastRatio(with: white) == white.contrastRatio(with: red))
    // Adjacent bytes straddle the sRGB linearization boundary.
    let low = MaterialColor(name: "low", red: 10, green: 10, blue: 10)
    let high = MaterialColor(name: "high", red: 11, green: 11, blue: 11)
    #expect(low.contrastRatio(with: white) > high.contrastRatio(with: white))
  }

  @Test func constructAndOverrideAllExtendedValues() {
    let app = MaterialExtendedColors(success: black, onSuccess: white,
      successContainer: black, onSuccessContainer: white,
      warning: black, onWarning: white, warningContainer: black, onWarningContainer: white)
    #expect(app[.warning] == black)
    let changed = app.overriding([.warning: white])
    #expect(changed[.warning] == white)
    #expect(changed[.success] == black)
    #expect(app[.warning] == black)
    let scheme = MaterialColorScheme.tonalSpotLight.overridingExtended([.warning: black, .onWarning: white])
    #expect(scheme.warning == black)
    #expect(scheme.overriding([.primary: white]).warning == black)
  }

  @Test func typedCustomAndPairPreserveAppValues() {
    let scheme = MaterialColorScheme.custom(base: .fidelity, appearance: .dark, overrides: [.primary: black])
    #expect(scheme.primary == black)
    #expect(scheme.secondary == MaterialColorScheme.fidelityDark.secondary)
    let theme = MaterialTheme.custom(appearance: .light, overrides: [.primary: black], sourceColor: white)
    #expect(theme.sourceColor == white)
    let pair = MaterialTheme.pair(preset: .tonalSpot,
      light: [.primary: black], dark: [.primary: white],
      extendedLight: [.warning: black, .onWarning: white, .success: black, .onSuccess: white],
      extendedDark: [.warning: white, .onWarning: black, .success: white, .onSuccess: black])
    #expect(pair.light.colorScheme.appearance == .light)
    #expect(pair.dark.colorScheme.appearance == .dark)
    #expect(pair.light.colorScheme.warning == black)
    #expect(pair.dark.colorScheme.warning == white)
    #expect(pair.light.themePreset == nil)
    #expect(pair.light.colorScheme.secondary == MaterialTheme.light.colorScheme.secondary)
    #expect(pair.light.colorScheme.contrastIssues().isEmpty)
    #expect(pair.dark.colorScheme.contrastIssues().isEmpty)
    #expect(MaterialTheme.pair().light.colorScheme == MaterialTheme.light.colorScheme)
  }

  @Test func contrastCoversAllSemanticPairsAndReportsFinalValues() {
    let scheme = MaterialColorScheme.tonalSpotLight
    // Each pair returned with a threshold of 21 (none of these templates is pure black/white).
    let pairs = scheme.contrastIssues(minimum: 21)
    #expect(pairs.count == 35)
    let expectedOn = MaterialColorRole.allCases.filter { $0.rawValue.hasPrefix("on") || $0 == .inverseOnSurface }.map(\.rawValue)
    #expect(Set(expectedOn).isSubset(of: Set(pairs.map(\.onRole))))
    #expect(pairs.contains { $0.colorRole == "primaryFixedDim" && $0.onRole == "onPrimaryFixedVariant" })
    #expect(pairs.contains { $0.colorRole == "surfaceContainerHighest" && $0.onRole == "onSurface" })
    let broken = scheme.overriding([.primary: white, .onPrimary: white])
      .overridingExtended([.warning: black, .onWarning: black])
    let issues = broken.contrastIssues()
    #expect(issues.contains { $0.colorRole == "primary" && $0.onRole == "onPrimary" && $0.ratio == 1 })
    #expect(issues.contains { $0.colorRole == "warning" && $0.onRole == "onWarning" && $0.ratio == 1 })
    #expect(broken.contrastIssues(minimum: 1).isEmpty)
  }

  @Test func legacyEmptyDictionaryCallsRemainUnambiguous() throws {
    // Existing hex calls must continue to type-check without annotations.
    #expect(try MaterialExtendedColors.light.overriding([:]) == .light)
    #expect(try MaterialColorScheme.tonalSpotLight.overriding([:]) == .tonalSpotLight)
    #expect(try MaterialColorScheme.tonalSpotLight.overridingExtended([:]) == .tonalSpotLight)
    #expect(try MaterialColorScheme.custom(appearance: .light, overrides: [:]) == .tonalSpotLight)
    #expect(try MaterialTheme.custom(appearance: .light, overrides: [:]).colorScheme == .tonalSpotLight)
    #expect(throws: MaterialColorSchemeError.self) {
      try MaterialColorScheme.custom(appearance: .light, roles: [:])
    }
  }
}
