import Testing
import MaterialDesignColorCore

struct ContrastFollowupTests {
  @Test func publicInitializersPreserveAppValues() {
    let light = MaterialTheme.custom(appearance: .light,
      overrides: [.primary: MaterialColor(name: "brand", red: 12, green: 34, blue: 56)])
    let dark = MaterialTheme.preset(.fidelity, appearance: .dark)
    let pair = MaterialThemePair(light: light, dark: dark)
    #expect(pair.light == light)
    #expect(pair.dark == dark)
    // Positional presentation is independent of metadata; no silent rewriting.
    #expect(MaterialThemePair(light: dark, dark: light).light == dark)
    let white = MaterialColor(name: "white", red: 255, green: 255, blue: 255)
    let scheme = light.colorScheme.overriding([.primary: white, .onPrimary: white])
    #expect(scheme.contrastIssues().contains(
      MaterialContrastIssue(colorRole: "primary", onRole: "onPrimary", ratio: 1)))
  }

  @Test func externalThresholdValidation() throws {
    let scheme = MaterialTheme.light.colorScheme
    for minimum in [1.0, 4.5, 21.0] {
      #expect(try scheme.validatedContrastIssues(minimum: minimum) == scheme.contrastIssues(minimum: minimum))
    }
    #expect(try scheme.validatedContrastIssues() == scheme.contrastIssues())
    for minimum in [Double.nan, .infinity, -.infinity, 0.99, 21.01] {
      do {
        _ = try scheme.validatedContrastIssues(minimum: minimum)
        Issue.record("Invalid minimum accepted")
      } catch MaterialContrastError.invalidMinimum(let actual) {
        #expect(actual == minimum || (actual.isNaN && minimum.isNaN))
      }
    }
  }
}
