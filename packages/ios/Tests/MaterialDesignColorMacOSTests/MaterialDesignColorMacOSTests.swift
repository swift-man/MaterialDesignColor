#if os(macOS)
import XCTest
import SwiftUI
import MaterialDesignColorSwiftUI
import MaterialDesignColorAppKit

@available(macOS 12.0, *)
@MainActor
final class MaterialDesignColorMacOSTests: XCTestCase {
  final class Mode: ObservableObject { @Published var value: ColorScheme = .light }
  struct Probe: NSViewRepresentable {
    @Environment(\.materialTheme) var theme
    let record: (MaterialTheme) -> Void
    func makeNSView(context: Context) -> NSView { NSView() }
    func updateNSView(_ view: NSView, context: Context) { record(theme) }
  }
  struct Root: View {
    @ObservedObject var mode: Mode
    let light: MaterialTheme
    let dark: MaterialTheme
    let record: (MaterialTheme) -> Void
    var body: some View {
      Probe(record: record).materialTheme(light: light, dark: dark).environment(\.colorScheme, mode.value)
    }
  }
  func testAdaptiveThemeUpdatesInHostingView() throws {
    let mode = Mode()
    let pair = MaterialTheme.pair(
      extendedLight: [.warning: MaterialColor(name: "appWarningLight", red: 128, green: 64, blue: 0)],
      extendedDark: [.warning: MaterialColor(name: "appWarningDark", red: 255, green: 192, blue: 128)])
    let light = pair.light
    let dark = pair.dark
    var observed: MaterialTheme?
    let host = NSHostingView(rootView: Root(mode: mode, light: light, dark: dark) { observed = $0 })
    let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 100, height: 100), styleMask: [.borderless], backing: .buffered, defer: false)
    window.contentView = host
    func settle(_ expected: MaterialTheme) {
      let deadline = Date().addingTimeInterval(3)
      while observed != expected && Date() < deadline {
        host.layoutSubtreeIfNeeded()
        RunLoop.main.run(until: Date().addingTimeInterval(0.01))
      }
      XCTAssertEqual(observed, expected)
    }
    settle(light)
    mode.value = .dark
    settle(dark)
    mode.value = .light
    settle(light)
    window.contentView = nil
  }
  func testPresetAndDevCleanerExampleCompile() {
    struct ContentView: View {
      @Environment(\.materialTheme) private var theme
      var body: some View {
        VStack {
          Text("안전").foregroundStyle(theme.colorScheme.success.color)
          Text("주의").foregroundStyle(theme.colorScheme.warning.color)
        }
      }
    }
    _ = NSHostingView(rootView: ContentView().materialTheme(preset: .tonalSpot))
  }
  func testGeneratedBrandTheme() {
    XCTAssertEqual(GeneratedMaterialTheme.light.sourceColor.hex, "#0A84FF")
    XCTAssertEqual(GeneratedMaterialTheme.light.colorScheme.primary.hex, "#405F90")
    XCTAssertNotEqual(GeneratedMaterialTheme.light.colorScheme.success, GeneratedMaterialTheme.dark.colorScheme.success)
  }
  func testDynamicAppKitColorsResolveBothAppearances() throws {
    let pair = MaterialTheme.pair(
      extendedLight: [.warning: MaterialColor(name: "light", red: 128, green: 64, blue: 0)],
      extendedDark: [.warning: MaterialColor(name: "dark", red: 255, green: 192, blue: 128)])
    let dynamic = NSColor.material(light: pair.light, dark: pair.dark, \.warning)
    let baseline = NSColor.materialBaseline(\.warning)
    for (name, theme, template) in [(NSAppearance.Name.aqua, pair.light, MaterialTheme.light),
                                    (.darkAqua, pair.dark, MaterialTheme.dark)] {
      let appearance = try XCTUnwrap(NSAppearance(named: name))
      appearance.performAsCurrentDrawingAppearance {
        let resolved = dynamic.usingColorSpace(.sRGB)!
        let expected = theme.colorScheme.warning.nsColor.usingColorSpace(.sRGB)!
        XCTAssertEqual(resolved.redComponent, expected.redComponent, accuracy: 0.00001)
        XCTAssertEqual(resolved.greenComponent, expected.greenComponent, accuracy: 0.00001)
        XCTAssertEqual(resolved.blueComponent, expected.blueComponent, accuracy: 0.00001)
        XCTAssertEqual(baseline.usingColorSpace(.sRGB), template.colorScheme.warning.nsColor.usingColorSpace(.sRGB))
      }
    }
  }

  func testUnmodifiedSceneDefaultsToLight() {
    XCTAssertEqual(EnvironmentValues().materialTheme, MaterialTheme.light)
  }

  func testAppKitSRGBConversion() throws {
    let material = try MaterialColor(name: "sample", hex: "#0A84FF")
    let color = try XCTUnwrap(material.nsColor.usingColorSpace(.sRGB))
    XCTAssertEqual(color.redComponent, 10.0 / 255, accuracy: 0.00001)
    XCTAssertEqual(color.greenComponent, 132.0 / 255, accuracy: 0.00001)
    XCTAssertEqual(color.blueComponent, 1)
    XCTAssertEqual(color.alphaComponent, 1)
  }
}
#endif
