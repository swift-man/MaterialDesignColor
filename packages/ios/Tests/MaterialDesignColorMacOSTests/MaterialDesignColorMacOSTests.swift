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
    let light = try MaterialTheme.custom(appearance: .light, overrides: [.primary: "#123456"])
    let dark = try MaterialTheme.custom(appearance: .dark, overrides: [.primary: "#ABCDEF"])
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
