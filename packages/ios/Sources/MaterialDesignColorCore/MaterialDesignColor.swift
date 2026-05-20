// Generated from tokens/ by tools/codegen/generate.rb.
// Do not edit by hand.
public enum MaterialColorRole: String, CaseIterable, Hashable, Sendable {
  case primary
  case onPrimary
  case primaryContainer
  case onPrimaryContainer
  case inversePrimary
  case secondary
  case onSecondary
  case secondaryContainer
  case onSecondaryContainer
  case tertiary
  case onTertiary
  case tertiaryContainer
  case onTertiaryContainer
  case background
  case onBackground
  case surface
  case onSurface
  case surfaceVariant
  case onSurfaceVariant
  case surfaceTint
  case inverseSurface
  case inverseOnSurface
  case error
  case onError
  case errorContainer
  case onErrorContainer
  case outline
  case outlineVariant
  case scrim
  case surfaceBright
  case surfaceContainer
  case surfaceContainerHigh
  case surfaceContainerHighest
  case surfaceContainerLow
  case surfaceContainerLowest
  case surfaceDim
  case primaryFixed
  case primaryFixedDim
  case onPrimaryFixed
  case onPrimaryFixedVariant
  case secondaryFixed
  case secondaryFixedDim
  case onSecondaryFixed
  case onSecondaryFixedVariant
  case tertiaryFixed
  case tertiaryFixedDim
  case onTertiaryFixed
  case onTertiaryFixedVariant
}

public enum MaterialColorSchemeError: Error, Equatable, Sendable {
  case missingRoles([MaterialColorRole])
}

public enum MaterialColorError: Error, Equatable, Sendable {
  case invalidHex(String)
}

public struct MaterialColor: Hashable, Sendable {
  public let name: String
  public let hex: String
  public let red: UInt8
  public let green: UInt8
  public let blue: UInt8
  public let alpha: UInt8

  public init(name: String, hex: String) throws {
    guard let parsed = Self.parseHex(hex) else {
      throw MaterialColorError.invalidHex(hex)
    }

    self.init(name: name, normalizedHex: parsed.normalizedHex, value: parsed.value)
  }

  public init(role: MaterialColorRole, hex: String) throws {
    try self.init(name: role.rawValue, hex: hex)
  }

  fileprivate init(uncheckedName name: String, hex: String) {
    guard let parsed = Self.parseHex(hex) else {
      preconditionFailure("Expected generated #RRGGBB hex color")
    }

    self.init(name: name, normalizedHex: parsed.normalizedHex, value: parsed.value)
  }

  private init(name: String, normalizedHex: String, value: UInt32) {
    self.name = name
    self.hex = normalizedHex
    self.red = UInt8((value >> 16) & 0xFF)
    self.green = UInt8((value >> 8) & 0xFF)
    self.blue = UInt8(value & 0xFF)
    self.alpha = 0xFF
  }

  private static func parseHex(_ hex: String) -> (normalizedHex: String, value: UInt32)? {
    let normalizedHex = hex.uppercased()

    guard normalizedHex.count == 7,
          normalizedHex.first == "#",
          let value = UInt32(normalizedHex.dropFirst(), radix: 16) else {
      return nil
    }

    return (normalizedHex, value)
  }

  public var rgb: (red: UInt8, green: UInt8, blue: UInt8) {
    (red, green, blue)
  }

  public var argb: UInt32 {
    (UInt32(alpha) << 24) | (UInt32(red) << 16) | (UInt32(green) << 8) | UInt32(blue)
  }
}

public enum MaterialPalette {
  public static let red50 = MaterialColor(uncheckedName: "red50", hex: "#FFEBEE")
  public static let red100 = MaterialColor(uncheckedName: "red100", hex: "#FFCDD2")
  public static let red200 = MaterialColor(uncheckedName: "red200", hex: "#EF9A9A")
  public static let red300 = MaterialColor(uncheckedName: "red300", hex: "#E57373")
  public static let red400 = MaterialColor(uncheckedName: "red400", hex: "#EF5350")
  public static let red500 = MaterialColor(uncheckedName: "red500", hex: "#F44336")
  public static let red600 = MaterialColor(uncheckedName: "red600", hex: "#E53935")
  public static let red700 = MaterialColor(uncheckedName: "red700", hex: "#D32F2F")
  public static let red800 = MaterialColor(uncheckedName: "red800", hex: "#C62828")
  public static let red900 = MaterialColor(uncheckedName: "red900", hex: "#B71C1C")
  public static let redA100 = MaterialColor(uncheckedName: "redA100", hex: "#FF8A80")
  public static let redA200 = MaterialColor(uncheckedName: "redA200", hex: "#FF5252")
  public static let redA400 = MaterialColor(uncheckedName: "redA400", hex: "#FF1744")
  public static let redA700 = MaterialColor(uncheckedName: "redA700", hex: "#D50000")
  public static let pink50 = MaterialColor(uncheckedName: "pink50", hex: "#FCE4EC")
  public static let pink100 = MaterialColor(uncheckedName: "pink100", hex: "#F8BBD0")
  public static let pink200 = MaterialColor(uncheckedName: "pink200", hex: "#F48FB1")
  public static let pink300 = MaterialColor(uncheckedName: "pink300", hex: "#F06292")
  public static let pink400 = MaterialColor(uncheckedName: "pink400", hex: "#EC407A")
  public static let pink500 = MaterialColor(uncheckedName: "pink500", hex: "#E91E63")
  public static let pink600 = MaterialColor(uncheckedName: "pink600", hex: "#D81B60")
  public static let pink700 = MaterialColor(uncheckedName: "pink700", hex: "#C2185B")
  public static let pink800 = MaterialColor(uncheckedName: "pink800", hex: "#AD1457")
  public static let pink900 = MaterialColor(uncheckedName: "pink900", hex: "#880E4F")
  public static let pinkA100 = MaterialColor(uncheckedName: "pinkA100", hex: "#FF80AB")
  public static let pinkA200 = MaterialColor(uncheckedName: "pinkA200", hex: "#FF4081")
  public static let pinkA400 = MaterialColor(uncheckedName: "pinkA400", hex: "#F50057")
  public static let pinkA700 = MaterialColor(uncheckedName: "pinkA700", hex: "#C51162")
  public static let purple50 = MaterialColor(uncheckedName: "purple50", hex: "#F3E5F5")
  public static let purple100 = MaterialColor(uncheckedName: "purple100", hex: "#E1BEE7")
  public static let purple200 = MaterialColor(uncheckedName: "purple200", hex: "#CE93D8")
  public static let purple300 = MaterialColor(uncheckedName: "purple300", hex: "#BA68C8")
  public static let purple400 = MaterialColor(uncheckedName: "purple400", hex: "#AB47BC")
  public static let purple500 = MaterialColor(uncheckedName: "purple500", hex: "#9C27B0")
  public static let purple600 = MaterialColor(uncheckedName: "purple600", hex: "#8E24AA")
  public static let purple700 = MaterialColor(uncheckedName: "purple700", hex: "#7B1FA2")
  public static let purple800 = MaterialColor(uncheckedName: "purple800", hex: "#6A1B9A")
  public static let purple900 = MaterialColor(uncheckedName: "purple900", hex: "#4A148C")
  public static let purpleA100 = MaterialColor(uncheckedName: "purpleA100", hex: "#EA80FC")
  public static let purpleA200 = MaterialColor(uncheckedName: "purpleA200", hex: "#E040FB")
  public static let purpleA400 = MaterialColor(uncheckedName: "purpleA400", hex: "#D500F9")
  public static let purpleA700 = MaterialColor(uncheckedName: "purpleA700", hex: "#AA00FF")
  public static let deepPurple50 = MaterialColor(uncheckedName: "deepPurple50", hex: "#EDE7F6")
  public static let deepPurple100 = MaterialColor(uncheckedName: "deepPurple100", hex: "#D1C4E9")
  public static let deepPurple200 = MaterialColor(uncheckedName: "deepPurple200", hex: "#B39DDB")
  public static let deepPurple300 = MaterialColor(uncheckedName: "deepPurple300", hex: "#9575CD")
  public static let deepPurple400 = MaterialColor(uncheckedName: "deepPurple400", hex: "#7E57C2")
  public static let deepPurple500 = MaterialColor(uncheckedName: "deepPurple500", hex: "#673AB7")
  public static let deepPurple600 = MaterialColor(uncheckedName: "deepPurple600", hex: "#5E35B1")
  public static let deepPurple700 = MaterialColor(uncheckedName: "deepPurple700", hex: "#512DA8")
  public static let deepPurple800 = MaterialColor(uncheckedName: "deepPurple800", hex: "#4527A0")
  public static let deepPurple900 = MaterialColor(uncheckedName: "deepPurple900", hex: "#311B92")
  public static let deepPurpleA100 = MaterialColor(uncheckedName: "deepPurpleA100", hex: "#B388FF")
  public static let deepPurpleA200 = MaterialColor(uncheckedName: "deepPurpleA200", hex: "#7C4DFF")
  public static let deepPurpleA400 = MaterialColor(uncheckedName: "deepPurpleA400", hex: "#651FFF")
  public static let deepPurpleA700 = MaterialColor(uncheckedName: "deepPurpleA700", hex: "#6200EA")
  public static let indigo50 = MaterialColor(uncheckedName: "indigo50", hex: "#E8EAF6")
  public static let indigo100 = MaterialColor(uncheckedName: "indigo100", hex: "#C5CAE9")
  public static let indigo200 = MaterialColor(uncheckedName: "indigo200", hex: "#9FA8DA")
  public static let indigo300 = MaterialColor(uncheckedName: "indigo300", hex: "#7986CB")
  public static let indigo400 = MaterialColor(uncheckedName: "indigo400", hex: "#5C6BC0")
  public static let indigo500 = MaterialColor(uncheckedName: "indigo500", hex: "#3F51B5")
  public static let indigo600 = MaterialColor(uncheckedName: "indigo600", hex: "#3949AB")
  public static let indigo700 = MaterialColor(uncheckedName: "indigo700", hex: "#303F9F")
  public static let indigo800 = MaterialColor(uncheckedName: "indigo800", hex: "#283593")
  public static let indigo900 = MaterialColor(uncheckedName: "indigo900", hex: "#1A237E")
  public static let indigoA100 = MaterialColor(uncheckedName: "indigoA100", hex: "#8C9EFF")
  public static let indigoA200 = MaterialColor(uncheckedName: "indigoA200", hex: "#536DFE")
  public static let indigoA400 = MaterialColor(uncheckedName: "indigoA400", hex: "#3D5AFE")
  public static let indigoA700 = MaterialColor(uncheckedName: "indigoA700", hex: "#304FFE")
  public static let blue50 = MaterialColor(uncheckedName: "blue50", hex: "#E3F2FD")
  public static let blue100 = MaterialColor(uncheckedName: "blue100", hex: "#BBDEFB")
  public static let blue200 = MaterialColor(uncheckedName: "blue200", hex: "#90CAF9")
  public static let blue300 = MaterialColor(uncheckedName: "blue300", hex: "#64B5F6")
  public static let blue400 = MaterialColor(uncheckedName: "blue400", hex: "#42A5F5")
  public static let blue500 = MaterialColor(uncheckedName: "blue500", hex: "#2196F3")
  public static let blue600 = MaterialColor(uncheckedName: "blue600", hex: "#1E88E5")
  public static let blue700 = MaterialColor(uncheckedName: "blue700", hex: "#1976D2")
  public static let blue800 = MaterialColor(uncheckedName: "blue800", hex: "#1565C0")
  public static let blue900 = MaterialColor(uncheckedName: "blue900", hex: "#0D47A1")
  public static let blueA100 = MaterialColor(uncheckedName: "blueA100", hex: "#82B1FF")
  public static let blueA200 = MaterialColor(uncheckedName: "blueA200", hex: "#448AFF")
  public static let blueA400 = MaterialColor(uncheckedName: "blueA400", hex: "#2979FF")
  public static let blueA700 = MaterialColor(uncheckedName: "blueA700", hex: "#2962FF")
  public static let lightBlue50 = MaterialColor(uncheckedName: "lightBlue50", hex: "#E1F5FE")
  public static let lightBlue100 = MaterialColor(uncheckedName: "lightBlue100", hex: "#B3E5FC")
  public static let lightBlue200 = MaterialColor(uncheckedName: "lightBlue200", hex: "#81D4FA")
  public static let lightBlue300 = MaterialColor(uncheckedName: "lightBlue300", hex: "#4FC3F7")
  public static let lightBlue400 = MaterialColor(uncheckedName: "lightBlue400", hex: "#29B6F6")
  public static let lightBlue500 = MaterialColor(uncheckedName: "lightBlue500", hex: "#03A9F4")
  public static let lightBlue600 = MaterialColor(uncheckedName: "lightBlue600", hex: "#039BE5")
  public static let lightBlue700 = MaterialColor(uncheckedName: "lightBlue700", hex: "#0288D1")
  public static let lightBlue800 = MaterialColor(uncheckedName: "lightBlue800", hex: "#0277BD")
  public static let lightBlue900 = MaterialColor(uncheckedName: "lightBlue900", hex: "#01579B")
  public static let lightBlueA100 = MaterialColor(uncheckedName: "lightBlueA100", hex: "#80D8FF")
  public static let lightBlueA200 = MaterialColor(uncheckedName: "lightBlueA200", hex: "#40C4FF")
  public static let lightBlueA400 = MaterialColor(uncheckedName: "lightBlueA400", hex: "#00B0FF")
  public static let lightBlueA700 = MaterialColor(uncheckedName: "lightBlueA700", hex: "#0091EA")
  public static let cyan50 = MaterialColor(uncheckedName: "cyan50", hex: "#E0F7FA")
  public static let cyan100 = MaterialColor(uncheckedName: "cyan100", hex: "#B2EBF2")
  public static let cyan200 = MaterialColor(uncheckedName: "cyan200", hex: "#80DEEA")
  public static let cyan300 = MaterialColor(uncheckedName: "cyan300", hex: "#4DD0E1")
  public static let cyan400 = MaterialColor(uncheckedName: "cyan400", hex: "#26C6DA")
  public static let cyan500 = MaterialColor(uncheckedName: "cyan500", hex: "#00BCD4")
  public static let cyan600 = MaterialColor(uncheckedName: "cyan600", hex: "#00ACC1")
  public static let cyan700 = MaterialColor(uncheckedName: "cyan700", hex: "#0097A7")
  public static let cyan800 = MaterialColor(uncheckedName: "cyan800", hex: "#00838F")
  public static let cyan900 = MaterialColor(uncheckedName: "cyan900", hex: "#006064")
  public static let cyanA100 = MaterialColor(uncheckedName: "cyanA100", hex: "#84FFFF")
  public static let cyanA200 = MaterialColor(uncheckedName: "cyanA200", hex: "#18FFFF")
  public static let cyanA400 = MaterialColor(uncheckedName: "cyanA400", hex: "#00E5FF")
  public static let cyanA700 = MaterialColor(uncheckedName: "cyanA700", hex: "#00B8D4")
  public static let teal50 = MaterialColor(uncheckedName: "teal50", hex: "#E0F2F1")
  public static let teal100 = MaterialColor(uncheckedName: "teal100", hex: "#B2DFDB")
  public static let teal200 = MaterialColor(uncheckedName: "teal200", hex: "#80CBC4")
  public static let teal300 = MaterialColor(uncheckedName: "teal300", hex: "#4DB6AC")
  public static let teal400 = MaterialColor(uncheckedName: "teal400", hex: "#26A69A")
  public static let teal500 = MaterialColor(uncheckedName: "teal500", hex: "#009688")
  public static let teal600 = MaterialColor(uncheckedName: "teal600", hex: "#00897B")
  public static let teal700 = MaterialColor(uncheckedName: "teal700", hex: "#00796B")
  public static let teal800 = MaterialColor(uncheckedName: "teal800", hex: "#00695C")
  public static let teal900 = MaterialColor(uncheckedName: "teal900", hex: "#004D40")
  public static let tealA100 = MaterialColor(uncheckedName: "tealA100", hex: "#A7FFEB")
  public static let tealA200 = MaterialColor(uncheckedName: "tealA200", hex: "#64FFDA")
  public static let tealA400 = MaterialColor(uncheckedName: "tealA400", hex: "#1DE9B6")
  public static let tealA700 = MaterialColor(uncheckedName: "tealA700", hex: "#00BFA5")
  public static let green50 = MaterialColor(uncheckedName: "green50", hex: "#E8F5E9")
  public static let green100 = MaterialColor(uncheckedName: "green100", hex: "#C8E6C9")
  public static let green200 = MaterialColor(uncheckedName: "green200", hex: "#A5D6A7")
  public static let green300 = MaterialColor(uncheckedName: "green300", hex: "#81C784")
  public static let green400 = MaterialColor(uncheckedName: "green400", hex: "#66BB6A")
  public static let green500 = MaterialColor(uncheckedName: "green500", hex: "#4CAF50")
  public static let green600 = MaterialColor(uncheckedName: "green600", hex: "#43A047")
  public static let green700 = MaterialColor(uncheckedName: "green700", hex: "#388E3C")
  public static let green800 = MaterialColor(uncheckedName: "green800", hex: "#2E7D32")
  public static let green900 = MaterialColor(uncheckedName: "green900", hex: "#1B5E20")
  public static let greenA100 = MaterialColor(uncheckedName: "greenA100", hex: "#B9F6CA")
  public static let greenA200 = MaterialColor(uncheckedName: "greenA200", hex: "#69F0AE")
  public static let greenA400 = MaterialColor(uncheckedName: "greenA400", hex: "#00E676")
  public static let greenA700 = MaterialColor(uncheckedName: "greenA700", hex: "#00C853")
  public static let lightGreen50 = MaterialColor(uncheckedName: "lightGreen50", hex: "#F1F8E9")
  public static let lightGreen100 = MaterialColor(uncheckedName: "lightGreen100", hex: "#DCEDC8")
  public static let lightGreen200 = MaterialColor(uncheckedName: "lightGreen200", hex: "#C5E1A5")
  public static let lightGreen300 = MaterialColor(uncheckedName: "lightGreen300", hex: "#AED581")
  public static let lightGreen400 = MaterialColor(uncheckedName: "lightGreen400", hex: "#9CCC65")
  public static let lightGreen500 = MaterialColor(uncheckedName: "lightGreen500", hex: "#8BC34A")
  public static let lightGreen600 = MaterialColor(uncheckedName: "lightGreen600", hex: "#7CB342")
  public static let lightGreen700 = MaterialColor(uncheckedName: "lightGreen700", hex: "#689F38")
  public static let lightGreen800 = MaterialColor(uncheckedName: "lightGreen800", hex: "#558B2F")
  public static let lightGreen900 = MaterialColor(uncheckedName: "lightGreen900", hex: "#33691E")
  public static let lightGreenA100 = MaterialColor(uncheckedName: "lightGreenA100", hex: "#CCFF90")
  public static let lightGreenA200 = MaterialColor(uncheckedName: "lightGreenA200", hex: "#B2FF59")
  public static let lightGreenA400 = MaterialColor(uncheckedName: "lightGreenA400", hex: "#76FF03")
  public static let lightGreenA700 = MaterialColor(uncheckedName: "lightGreenA700", hex: "#64DD17")
  public static let lime50 = MaterialColor(uncheckedName: "lime50", hex: "#F9FBE7")
  public static let lime100 = MaterialColor(uncheckedName: "lime100", hex: "#F0F4C3")
  public static let lime200 = MaterialColor(uncheckedName: "lime200", hex: "#E6EE9C")
  public static let lime300 = MaterialColor(uncheckedName: "lime300", hex: "#DCE775")
  public static let lime400 = MaterialColor(uncheckedName: "lime400", hex: "#D4E157")
  public static let lime500 = MaterialColor(uncheckedName: "lime500", hex: "#CDDC39")
  public static let lime600 = MaterialColor(uncheckedName: "lime600", hex: "#C0CA33")
  public static let lime700 = MaterialColor(uncheckedName: "lime700", hex: "#AFB42B")
  public static let lime800 = MaterialColor(uncheckedName: "lime800", hex: "#9E9D24")
  public static let lime900 = MaterialColor(uncheckedName: "lime900", hex: "#827717")
  public static let limeA100 = MaterialColor(uncheckedName: "limeA100", hex: "#F4FF81")
  public static let limeA200 = MaterialColor(uncheckedName: "limeA200", hex: "#EEFF41")
  public static let limeA400 = MaterialColor(uncheckedName: "limeA400", hex: "#C6FF00")
  public static let limeA700 = MaterialColor(uncheckedName: "limeA700", hex: "#AEEA00")
  public static let yellow50 = MaterialColor(uncheckedName: "yellow50", hex: "#FFFDE7")
  public static let yellow100 = MaterialColor(uncheckedName: "yellow100", hex: "#FFF9C4")
  public static let yellow200 = MaterialColor(uncheckedName: "yellow200", hex: "#FFF59D")
  public static let yellow300 = MaterialColor(uncheckedName: "yellow300", hex: "#FFF176")
  public static let yellow400 = MaterialColor(uncheckedName: "yellow400", hex: "#FFEE58")
  public static let yellow500 = MaterialColor(uncheckedName: "yellow500", hex: "#FFEB3B")
  public static let yellow600 = MaterialColor(uncheckedName: "yellow600", hex: "#FDD835")
  public static let yellow700 = MaterialColor(uncheckedName: "yellow700", hex: "#FBC02D")
  public static let yellow800 = MaterialColor(uncheckedName: "yellow800", hex: "#F9A825")
  public static let yellow900 = MaterialColor(uncheckedName: "yellow900", hex: "#F57F17")
  public static let yellowA100 = MaterialColor(uncheckedName: "yellowA100", hex: "#FFFF8D")
  public static let yellowA200 = MaterialColor(uncheckedName: "yellowA200", hex: "#FFFF00")
  public static let yellowA400 = MaterialColor(uncheckedName: "yellowA400", hex: "#FFEA00")
  public static let yellowA700 = MaterialColor(uncheckedName: "yellowA700", hex: "#FFD600")
  public static let amber50 = MaterialColor(uncheckedName: "amber50", hex: "#FFF8E1")
  public static let amber100 = MaterialColor(uncheckedName: "amber100", hex: "#FFECB3")
  public static let amber200 = MaterialColor(uncheckedName: "amber200", hex: "#FFE082")
  public static let amber300 = MaterialColor(uncheckedName: "amber300", hex: "#FFD54F")
  public static let amber400 = MaterialColor(uncheckedName: "amber400", hex: "#FFCA28")
  public static let amber500 = MaterialColor(uncheckedName: "amber500", hex: "#FFC107")
  public static let amber600 = MaterialColor(uncheckedName: "amber600", hex: "#FFB300")
  public static let amber700 = MaterialColor(uncheckedName: "amber700", hex: "#FFA000")
  public static let amber800 = MaterialColor(uncheckedName: "amber800", hex: "#FF8F00")
  public static let amber900 = MaterialColor(uncheckedName: "amber900", hex: "#FF6F00")
  public static let amberA100 = MaterialColor(uncheckedName: "amberA100", hex: "#FFE57F")
  public static let amberA200 = MaterialColor(uncheckedName: "amberA200", hex: "#FFD740")
  public static let amberA400 = MaterialColor(uncheckedName: "amberA400", hex: "#FFC400")
  public static let amberA700 = MaterialColor(uncheckedName: "amberA700", hex: "#FFAB00")
  public static let orange50 = MaterialColor(uncheckedName: "orange50", hex: "#FFF3E0")
  public static let orange100 = MaterialColor(uncheckedName: "orange100", hex: "#FFE0B2")
  public static let orange200 = MaterialColor(uncheckedName: "orange200", hex: "#FFCC80")
  public static let orange300 = MaterialColor(uncheckedName: "orange300", hex: "#FFB74D")
  public static let orange400 = MaterialColor(uncheckedName: "orange400", hex: "#FFA726")
  public static let orange500 = MaterialColor(uncheckedName: "orange500", hex: "#FF9800")
  public static let orange600 = MaterialColor(uncheckedName: "orange600", hex: "#FB8C00")
  public static let orange700 = MaterialColor(uncheckedName: "orange700", hex: "#F57C00")
  public static let orange800 = MaterialColor(uncheckedName: "orange800", hex: "#EF6C00")
  public static let orange900 = MaterialColor(uncheckedName: "orange900", hex: "#E65100")
  public static let orangeA100 = MaterialColor(uncheckedName: "orangeA100", hex: "#FFD180")
  public static let orangeA200 = MaterialColor(uncheckedName: "orangeA200", hex: "#FFAB40")
  public static let orangeA400 = MaterialColor(uncheckedName: "orangeA400", hex: "#FF9100")
  public static let orangeA700 = MaterialColor(uncheckedName: "orangeA700", hex: "#FF6D00")
  public static let deepOrange50 = MaterialColor(uncheckedName: "deepOrange50", hex: "#FBE9E7")
  public static let deepOrange100 = MaterialColor(uncheckedName: "deepOrange100", hex: "#FFCCBC")
  public static let deepOrange200 = MaterialColor(uncheckedName: "deepOrange200", hex: "#FFAB91")
  public static let deepOrange300 = MaterialColor(uncheckedName: "deepOrange300", hex: "#FF8A65")
  public static let deepOrange400 = MaterialColor(uncheckedName: "deepOrange400", hex: "#FF7043")
  public static let deepOrange500 = MaterialColor(uncheckedName: "deepOrange500", hex: "#FF5722")
  public static let deepOrange600 = MaterialColor(uncheckedName: "deepOrange600", hex: "#F4511E")
  public static let deepOrange700 = MaterialColor(uncheckedName: "deepOrange700", hex: "#E64A19")
  public static let deepOrange800 = MaterialColor(uncheckedName: "deepOrange800", hex: "#D84315")
  public static let deepOrange900 = MaterialColor(uncheckedName: "deepOrange900", hex: "#BF360C")
  public static let deepOrangeA100 = MaterialColor(uncheckedName: "deepOrangeA100", hex: "#FF9E80")
  public static let deepOrangeA200 = MaterialColor(uncheckedName: "deepOrangeA200", hex: "#FF6E40")
  public static let deepOrangeA400 = MaterialColor(uncheckedName: "deepOrangeA400", hex: "#FF3D00")
  public static let deepOrangeA700 = MaterialColor(uncheckedName: "deepOrangeA700", hex: "#DD2C00")
  public static let brown50 = MaterialColor(uncheckedName: "brown50", hex: "#EFEBE9")
  public static let brown100 = MaterialColor(uncheckedName: "brown100", hex: "#D7CCC8")
  public static let brown200 = MaterialColor(uncheckedName: "brown200", hex: "#BCAAA4")
  public static let brown300 = MaterialColor(uncheckedName: "brown300", hex: "#A1887F")
  public static let brown400 = MaterialColor(uncheckedName: "brown400", hex: "#8D6E63")
  public static let brown500 = MaterialColor(uncheckedName: "brown500", hex: "#795548")
  public static let brown600 = MaterialColor(uncheckedName: "brown600", hex: "#6D4C41")
  public static let brown700 = MaterialColor(uncheckedName: "brown700", hex: "#5D4037")
  public static let brown800 = MaterialColor(uncheckedName: "brown800", hex: "#4E342E")
  public static let brown900 = MaterialColor(uncheckedName: "brown900", hex: "#3E2723")
  public static let grey50 = MaterialColor(uncheckedName: "grey50", hex: "#FAFAFA")
  public static let grey100 = MaterialColor(uncheckedName: "grey100", hex: "#F5F5F5")
  public static let grey200 = MaterialColor(uncheckedName: "grey200", hex: "#EEEEEE")
  public static let grey300 = MaterialColor(uncheckedName: "grey300", hex: "#E0E0E0")
  public static let grey400 = MaterialColor(uncheckedName: "grey400", hex: "#BDBDBD")
  public static let grey500 = MaterialColor(uncheckedName: "grey500", hex: "#9E9E9E")
  public static let grey600 = MaterialColor(uncheckedName: "grey600", hex: "#757575")
  public static let grey700 = MaterialColor(uncheckedName: "grey700", hex: "#616161")
  public static let grey800 = MaterialColor(uncheckedName: "grey800", hex: "#424242")
  public static let grey900 = MaterialColor(uncheckedName: "grey900", hex: "#212121")
  public static let blueGrey50 = MaterialColor(uncheckedName: "blueGrey50", hex: "#ECEFF1")
  public static let blueGrey100 = MaterialColor(uncheckedName: "blueGrey100", hex: "#CFD8DC")
  public static let blueGrey200 = MaterialColor(uncheckedName: "blueGrey200", hex: "#B0BEC5")
  public static let blueGrey300 = MaterialColor(uncheckedName: "blueGrey300", hex: "#90A4AE")
  public static let blueGrey400 = MaterialColor(uncheckedName: "blueGrey400", hex: "#78909C")
  public static let blueGrey500 = MaterialColor(uncheckedName: "blueGrey500", hex: "#607D8B")
  public static let blueGrey600 = MaterialColor(uncheckedName: "blueGrey600", hex: "#546E7A")
  public static let blueGrey700 = MaterialColor(uncheckedName: "blueGrey700", hex: "#455A64")
  public static let blueGrey800 = MaterialColor(uncheckedName: "blueGrey800", hex: "#37474F")
  public static let blueGrey900 = MaterialColor(uncheckedName: "blueGrey900", hex: "#263238")

  public static let all: [MaterialColor] = [
    red50,
    red100,
    red200,
    red300,
    red400,
    red500,
    red600,
    red700,
    red800,
    red900,
    redA100,
    redA200,
    redA400,
    redA700,
    pink50,
    pink100,
    pink200,
    pink300,
    pink400,
    pink500,
    pink600,
    pink700,
    pink800,
    pink900,
    pinkA100,
    pinkA200,
    pinkA400,
    pinkA700,
    purple50,
    purple100,
    purple200,
    purple300,
    purple400,
    purple500,
    purple600,
    purple700,
    purple800,
    purple900,
    purpleA100,
    purpleA200,
    purpleA400,
    purpleA700,
    deepPurple50,
    deepPurple100,
    deepPurple200,
    deepPurple300,
    deepPurple400,
    deepPurple500,
    deepPurple600,
    deepPurple700,
    deepPurple800,
    deepPurple900,
    deepPurpleA100,
    deepPurpleA200,
    deepPurpleA400,
    deepPurpleA700,
    indigo50,
    indigo100,
    indigo200,
    indigo300,
    indigo400,
    indigo500,
    indigo600,
    indigo700,
    indigo800,
    indigo900,
    indigoA100,
    indigoA200,
    indigoA400,
    indigoA700,
    blue50,
    blue100,
    blue200,
    blue300,
    blue400,
    blue500,
    blue600,
    blue700,
    blue800,
    blue900,
    blueA100,
    blueA200,
    blueA400,
    blueA700,
    lightBlue50,
    lightBlue100,
    lightBlue200,
    lightBlue300,
    lightBlue400,
    lightBlue500,
    lightBlue600,
    lightBlue700,
    lightBlue800,
    lightBlue900,
    lightBlueA100,
    lightBlueA200,
    lightBlueA400,
    lightBlueA700,
    cyan50,
    cyan100,
    cyan200,
    cyan300,
    cyan400,
    cyan500,
    cyan600,
    cyan700,
    cyan800,
    cyan900,
    cyanA100,
    cyanA200,
    cyanA400,
    cyanA700,
    teal50,
    teal100,
    teal200,
    teal300,
    teal400,
    teal500,
    teal600,
    teal700,
    teal800,
    teal900,
    tealA100,
    tealA200,
    tealA400,
    tealA700,
    green50,
    green100,
    green200,
    green300,
    green400,
    green500,
    green600,
    green700,
    green800,
    green900,
    greenA100,
    greenA200,
    greenA400,
    greenA700,
    lightGreen50,
    lightGreen100,
    lightGreen200,
    lightGreen300,
    lightGreen400,
    lightGreen500,
    lightGreen600,
    lightGreen700,
    lightGreen800,
    lightGreen900,
    lightGreenA100,
    lightGreenA200,
    lightGreenA400,
    lightGreenA700,
    lime50,
    lime100,
    lime200,
    lime300,
    lime400,
    lime500,
    lime600,
    lime700,
    lime800,
    lime900,
    limeA100,
    limeA200,
    limeA400,
    limeA700,
    yellow50,
    yellow100,
    yellow200,
    yellow300,
    yellow400,
    yellow500,
    yellow600,
    yellow700,
    yellow800,
    yellow900,
    yellowA100,
    yellowA200,
    yellowA400,
    yellowA700,
    amber50,
    amber100,
    amber200,
    amber300,
    amber400,
    amber500,
    amber600,
    amber700,
    amber800,
    amber900,
    amberA100,
    amberA200,
    amberA400,
    amberA700,
    orange50,
    orange100,
    orange200,
    orange300,
    orange400,
    orange500,
    orange600,
    orange700,
    orange800,
    orange900,
    orangeA100,
    orangeA200,
    orangeA400,
    orangeA700,
    deepOrange50,
    deepOrange100,
    deepOrange200,
    deepOrange300,
    deepOrange400,
    deepOrange500,
    deepOrange600,
    deepOrange700,
    deepOrange800,
    deepOrange900,
    deepOrangeA100,
    deepOrangeA200,
    deepOrangeA400,
    deepOrangeA700,
    brown50,
    brown100,
    brown200,
    brown300,
    brown400,
    brown500,
    brown600,
    brown700,
    brown800,
    brown900,
    grey50,
    grey100,
    grey200,
    grey300,
    grey400,
    grey500,
    grey600,
    grey700,
    grey800,
    grey900,
    blueGrey50,
    blueGrey100,
    blueGrey200,
    blueGrey300,
    blueGrey400,
    blueGrey500,
    blueGrey600,
    blueGrey700,
    blueGrey800,
    blueGrey900,
  ]

  public static let byName: [String: MaterialColor] = Dictionary(
    uniqueKeysWithValues: all.map { ($0.name, $0) }
  )

  public static subscript(name: String) -> MaterialColor? {
    byName[name]
  }
}

public enum MaterialAppearance: String, Hashable, Sendable {
  case light
  case dark
}

public struct MaterialThemeKeyColors: Hashable, Sendable {
  public let primary: MaterialColor
  public let secondary: MaterialColor
  public let tertiary: MaterialColor
  public let neutral: MaterialColor
  public let neutralVariant: MaterialColor

  public init(
    primary: MaterialColor,
    secondary: MaterialColor,
    tertiary: MaterialColor,
    neutral: MaterialColor,
    neutralVariant: MaterialColor
  ) {
    self.primary = primary
    self.secondary = secondary
    self.tertiary = tertiary
    self.neutral = neutral
    self.neutralVariant = neutralVariant
  }
}

public enum MaterialThemePreset: String, CaseIterable, Hashable, Sendable {
  case tonalSpot
  case fidelity
  case content
  case monochrome
  case neutral
  case vibrant
  case expressive
  case rainbow
  case fruitSalad

  public var sourceColor: MaterialColor {
    switch self {
    case .tonalSpot:
      return MaterialColor(uncheckedName: "sourceColor", hex: "#6750A4")
    case .fidelity:
      return MaterialColor(uncheckedName: "sourceColor", hex: "#6750A4")
    case .content:
      return MaterialColor(uncheckedName: "sourceColor", hex: "#6750A4")
    case .monochrome:
      return MaterialColor(uncheckedName: "sourceColor", hex: "#6750A4")
    case .neutral:
      return MaterialColor(uncheckedName: "sourceColor", hex: "#6750A4")
    case .vibrant:
      return MaterialColor(uncheckedName: "sourceColor", hex: "#6750A4")
    case .expressive:
      return MaterialColor(uncheckedName: "sourceColor", hex: "#6750A4")
    case .rainbow:
      return MaterialColor(uncheckedName: "sourceColor", hex: "#6750A4")
    case .fruitSalad:
      return MaterialColor(uncheckedName: "sourceColor", hex: "#6750A4")
    }
  }

  public var keyColors: MaterialThemeKeyColors {
    switch self {
    case .tonalSpot:
      return MaterialThemeKeyColors(
        primary: MaterialColor(uncheckedName: "primary", hex: "#7E6EA9"),
        secondary: MaterialColor(uncheckedName: "secondary", hex: "#7B748A"),
        tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#996A79"),
        neutral: MaterialColor(uncheckedName: "neutral", hex: "#7A767D"),
        neutralVariant: MaterialColor(uncheckedName: "neutralVariant", hex: "#7A757F")
      )
    case .fidelity:
      return MaterialThemeKeyColors(
        primary: MaterialColor(uncheckedName: "primary", hex: "#8069BF"),
        secondary: MaterialColor(uncheckedName: "secondary", hex: "#7C7296"),
        tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#C9A74D"),
        neutral: MaterialColor(uncheckedName: "neutral", hex: "#7A767D"),
        neutralVariant: MaterialColor(uncheckedName: "neutralVariant", hex: "#7A7582")
      )
    case .content:
      return MaterialThemeKeyColors(
        primary: MaterialColor(uncheckedName: "primary", hex: "#8069BF"),
        secondary: MaterialColor(uncheckedName: "secondary", hex: "#7C7296"),
        tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#924274"),
        neutral: MaterialColor(uncheckedName: "neutral", hex: "#7A767D"),
        neutralVariant: MaterialColor(uncheckedName: "neutralVariant", hex: "#7A7582")
      )
    case .monochrome:
      return MaterialThemeKeyColors(
        primary: MaterialColor(uncheckedName: "primary", hex: "#777777"),
        secondary: MaterialColor(uncheckedName: "secondary", hex: "#777777"),
        tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#777777"),
        neutral: MaterialColor(uncheckedName: "neutral", hex: "#777777"),
        neutralVariant: MaterialColor(uncheckedName: "neutralVariant", hex: "#777777")
      )
    case .neutral:
      return MaterialThemeKeyColors(
        primary: MaterialColor(uncheckedName: "primary", hex: "#7A7484"),
        secondary: MaterialColor(uncheckedName: "secondary", hex: "#7A757F"),
        tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#7B748A"),
        neutral: MaterialColor(uncheckedName: "neutral", hex: "#797678"),
        neutralVariant: MaterialColor(uncheckedName: "neutralVariant", hex: "#797678")
      )
    case .vibrant:
      return MaterialThemeKeyColors(
        primary: MaterialColor(uncheckedName: "primary", hex: "#6C0BFF"),
        secondary: MaterialColor(uncheckedName: "secondary", hex: "#856F92"),
        tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#946994"),
        neutral: MaterialColor(uncheckedName: "neutral", hex: "#7A7582"),
        neutralVariant: MaterialColor(uncheckedName: "neutralVariant", hex: "#7A7484")
      )
    case .expressive:
      return MaterialThemeKeyColors(
        primary: MaterialColor(uncheckedName: "primary", hex: "#1B8672"),
        secondary: MaterialColor(uncheckedName: "secondary", hex: "#936B83"),
        tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#8D6B9B"),
        neutral: MaterialColor(uncheckedName: "neutral", hex: "#7C757E"),
        neutralVariant: MaterialColor(uncheckedName: "neutralVariant", hex: "#7E7382")
      )
    case .rainbow:
      return MaterialThemeKeyColors(
        primary: MaterialColor(uncheckedName: "primary", hex: "#8069BF"),
        secondary: MaterialColor(uncheckedName: "secondary", hex: "#7B748A"),
        tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#996A79"),
        neutral: MaterialColor(uncheckedName: "neutral", hex: "#777777"),
        neutralVariant: MaterialColor(uncheckedName: "neutralVariant", hex: "#777777")
      )
    case .fruitSalad:
      return MaterialThemeKeyColors(
        primary: MaterialColor(uncheckedName: "primary", hex: "#247CBB"),
        secondary: MaterialColor(uncheckedName: "secondary", hex: "#4B7BA7"),
        tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#7E6EA9"),
        neutral: MaterialColor(uncheckedName: "neutral", hex: "#7A7582"),
        neutralVariant: MaterialColor(uncheckedName: "neutralVariant", hex: "#7B748A")
      )
    }
  }
}

public struct MaterialColorScheme: Hashable, Sendable {
  public let appearance: MaterialAppearance
  public let primary: MaterialColor
  public let onPrimary: MaterialColor
  public let primaryContainer: MaterialColor
  public let onPrimaryContainer: MaterialColor
  public let inversePrimary: MaterialColor
  public let secondary: MaterialColor
  public let onSecondary: MaterialColor
  public let secondaryContainer: MaterialColor
  public let onSecondaryContainer: MaterialColor
  public let tertiary: MaterialColor
  public let onTertiary: MaterialColor
  public let tertiaryContainer: MaterialColor
  public let onTertiaryContainer: MaterialColor
  public let background: MaterialColor
  public let onBackground: MaterialColor
  public let surface: MaterialColor
  public let onSurface: MaterialColor
  public let surfaceVariant: MaterialColor
  public let onSurfaceVariant: MaterialColor
  public let surfaceTint: MaterialColor
  public let inverseSurface: MaterialColor
  public let inverseOnSurface: MaterialColor
  public let error: MaterialColor
  public let onError: MaterialColor
  public let errorContainer: MaterialColor
  public let onErrorContainer: MaterialColor
  public let outline: MaterialColor
  public let outlineVariant: MaterialColor
  public let scrim: MaterialColor
  public let surfaceBright: MaterialColor
  public let surfaceContainer: MaterialColor
  public let surfaceContainerHigh: MaterialColor
  public let surfaceContainerHighest: MaterialColor
  public let surfaceContainerLow: MaterialColor
  public let surfaceContainerLowest: MaterialColor
  public let surfaceDim: MaterialColor
  public let primaryFixed: MaterialColor
  public let primaryFixedDim: MaterialColor
  public let onPrimaryFixed: MaterialColor
  public let onPrimaryFixedVariant: MaterialColor
  public let secondaryFixed: MaterialColor
  public let secondaryFixedDim: MaterialColor
  public let onSecondaryFixed: MaterialColor
  public let onSecondaryFixedVariant: MaterialColor
  public let tertiaryFixed: MaterialColor
  public let tertiaryFixedDim: MaterialColor
  public let onTertiaryFixed: MaterialColor
  public let onTertiaryFixedVariant: MaterialColor

  public init(
    appearance: MaterialAppearance,
    primary: MaterialColor,
    onPrimary: MaterialColor,
    primaryContainer: MaterialColor,
    onPrimaryContainer: MaterialColor,
    inversePrimary: MaterialColor,
    secondary: MaterialColor,
    onSecondary: MaterialColor,
    secondaryContainer: MaterialColor,
    onSecondaryContainer: MaterialColor,
    tertiary: MaterialColor,
    onTertiary: MaterialColor,
    tertiaryContainer: MaterialColor,
    onTertiaryContainer: MaterialColor,
    background: MaterialColor,
    onBackground: MaterialColor,
    surface: MaterialColor,
    onSurface: MaterialColor,
    surfaceVariant: MaterialColor,
    onSurfaceVariant: MaterialColor,
    surfaceTint: MaterialColor,
    inverseSurface: MaterialColor,
    inverseOnSurface: MaterialColor,
    error: MaterialColor,
    onError: MaterialColor,
    errorContainer: MaterialColor,
    onErrorContainer: MaterialColor,
    outline: MaterialColor,
    outlineVariant: MaterialColor,
    scrim: MaterialColor,
    surfaceBright: MaterialColor,
    surfaceContainer: MaterialColor,
    surfaceContainerHigh: MaterialColor,
    surfaceContainerHighest: MaterialColor,
    surfaceContainerLow: MaterialColor,
    surfaceContainerLowest: MaterialColor,
    surfaceDim: MaterialColor,
    primaryFixed: MaterialColor,
    primaryFixedDim: MaterialColor,
    onPrimaryFixed: MaterialColor,
    onPrimaryFixedVariant: MaterialColor,
    secondaryFixed: MaterialColor,
    secondaryFixedDim: MaterialColor,
    onSecondaryFixed: MaterialColor,
    onSecondaryFixedVariant: MaterialColor,
    tertiaryFixed: MaterialColor,
    tertiaryFixedDim: MaterialColor,
    onTertiaryFixed: MaterialColor,
    onTertiaryFixedVariant: MaterialColor
  ) {
    self.appearance = appearance
    self.primary = primary
    self.onPrimary = onPrimary
    self.primaryContainer = primaryContainer
    self.onPrimaryContainer = onPrimaryContainer
    self.inversePrimary = inversePrimary
    self.secondary = secondary
    self.onSecondary = onSecondary
    self.secondaryContainer = secondaryContainer
    self.onSecondaryContainer = onSecondaryContainer
    self.tertiary = tertiary
    self.onTertiary = onTertiary
    self.tertiaryContainer = tertiaryContainer
    self.onTertiaryContainer = onTertiaryContainer
    self.background = background
    self.onBackground = onBackground
    self.surface = surface
    self.onSurface = onSurface
    self.surfaceVariant = surfaceVariant
    self.onSurfaceVariant = onSurfaceVariant
    self.surfaceTint = surfaceTint
    self.inverseSurface = inverseSurface
    self.inverseOnSurface = inverseOnSurface
    self.error = error
    self.onError = onError
    self.errorContainer = errorContainer
    self.onErrorContainer = onErrorContainer
    self.outline = outline
    self.outlineVariant = outlineVariant
    self.scrim = scrim
    self.surfaceBright = surfaceBright
    self.surfaceContainer = surfaceContainer
    self.surfaceContainerHigh = surfaceContainerHigh
    self.surfaceContainerHighest = surfaceContainerHighest
    self.surfaceContainerLow = surfaceContainerLow
    self.surfaceContainerLowest = surfaceContainerLowest
    self.surfaceDim = surfaceDim
    self.primaryFixed = primaryFixed
    self.primaryFixedDim = primaryFixedDim
    self.onPrimaryFixed = onPrimaryFixed
    self.onPrimaryFixedVariant = onPrimaryFixedVariant
    self.secondaryFixed = secondaryFixed
    self.secondaryFixedDim = secondaryFixedDim
    self.onSecondaryFixed = onSecondaryFixed
    self.onSecondaryFixedVariant = onSecondaryFixedVariant
    self.tertiaryFixed = tertiaryFixed
    self.tertiaryFixedDim = tertiaryFixedDim
    self.onTertiaryFixed = onTertiaryFixed
    self.onTertiaryFixedVariant = onTertiaryFixedVariant
  }

  public func color(for role: MaterialColorRole) -> MaterialColor {
    switch role {
    case .primary:
      return primary
    case .onPrimary:
      return onPrimary
    case .primaryContainer:
      return primaryContainer
    case .onPrimaryContainer:
      return onPrimaryContainer
    case .inversePrimary:
      return inversePrimary
    case .secondary:
      return secondary
    case .onSecondary:
      return onSecondary
    case .secondaryContainer:
      return secondaryContainer
    case .onSecondaryContainer:
      return onSecondaryContainer
    case .tertiary:
      return tertiary
    case .onTertiary:
      return onTertiary
    case .tertiaryContainer:
      return tertiaryContainer
    case .onTertiaryContainer:
      return onTertiaryContainer
    case .background:
      return background
    case .onBackground:
      return onBackground
    case .surface:
      return surface
    case .onSurface:
      return onSurface
    case .surfaceVariant:
      return surfaceVariant
    case .onSurfaceVariant:
      return onSurfaceVariant
    case .surfaceTint:
      return surfaceTint
    case .inverseSurface:
      return inverseSurface
    case .inverseOnSurface:
      return inverseOnSurface
    case .error:
      return error
    case .onError:
      return onError
    case .errorContainer:
      return errorContainer
    case .onErrorContainer:
      return onErrorContainer
    case .outline:
      return outline
    case .outlineVariant:
      return outlineVariant
    case .scrim:
      return scrim
    case .surfaceBright:
      return surfaceBright
    case .surfaceContainer:
      return surfaceContainer
    case .surfaceContainerHigh:
      return surfaceContainerHigh
    case .surfaceContainerHighest:
      return surfaceContainerHighest
    case .surfaceContainerLow:
      return surfaceContainerLow
    case .surfaceContainerLowest:
      return surfaceContainerLowest
    case .surfaceDim:
      return surfaceDim
    case .primaryFixed:
      return primaryFixed
    case .primaryFixedDim:
      return primaryFixedDim
    case .onPrimaryFixed:
      return onPrimaryFixed
    case .onPrimaryFixedVariant:
      return onPrimaryFixedVariant
    case .secondaryFixed:
      return secondaryFixed
    case .secondaryFixedDim:
      return secondaryFixedDim
    case .onSecondaryFixed:
      return onSecondaryFixed
    case .onSecondaryFixedVariant:
      return onSecondaryFixedVariant
    case .tertiaryFixed:
      return tertiaryFixed
    case .tertiaryFixedDim:
      return tertiaryFixedDim
    case .onTertiaryFixed:
      return onTertiaryFixed
    case .onTertiaryFixedVariant:
      return onTertiaryFixedVariant
    }
  }

  public subscript(role: MaterialColorRole) -> MaterialColor {
    color(for: role)
  }

  public func overriding(_ overrides: [MaterialColorRole: String]) throws -> MaterialColorScheme {
    MaterialColorScheme(
      appearance: appearance,
      primary: try overrides[.primary].map { try MaterialColor(role: .primary, hex: $0) } ?? primary,
      onPrimary: try overrides[.onPrimary].map { try MaterialColor(role: .onPrimary, hex: $0) } ?? onPrimary,
      primaryContainer: try overrides[.primaryContainer].map { try MaterialColor(role: .primaryContainer, hex: $0) } ?? primaryContainer,
      onPrimaryContainer: try overrides[.onPrimaryContainer].map { try MaterialColor(role: .onPrimaryContainer, hex: $0) } ?? onPrimaryContainer,
      inversePrimary: try overrides[.inversePrimary].map { try MaterialColor(role: .inversePrimary, hex: $0) } ?? inversePrimary,
      secondary: try overrides[.secondary].map { try MaterialColor(role: .secondary, hex: $0) } ?? secondary,
      onSecondary: try overrides[.onSecondary].map { try MaterialColor(role: .onSecondary, hex: $0) } ?? onSecondary,
      secondaryContainer: try overrides[.secondaryContainer].map { try MaterialColor(role: .secondaryContainer, hex: $0) } ?? secondaryContainer,
      onSecondaryContainer: try overrides[.onSecondaryContainer].map { try MaterialColor(role: .onSecondaryContainer, hex: $0) } ?? onSecondaryContainer,
      tertiary: try overrides[.tertiary].map { try MaterialColor(role: .tertiary, hex: $0) } ?? tertiary,
      onTertiary: try overrides[.onTertiary].map { try MaterialColor(role: .onTertiary, hex: $0) } ?? onTertiary,
      tertiaryContainer: try overrides[.tertiaryContainer].map { try MaterialColor(role: .tertiaryContainer, hex: $0) } ?? tertiaryContainer,
      onTertiaryContainer: try overrides[.onTertiaryContainer].map { try MaterialColor(role: .onTertiaryContainer, hex: $0) } ?? onTertiaryContainer,
      background: try overrides[.background].map { try MaterialColor(role: .background, hex: $0) } ?? background,
      onBackground: try overrides[.onBackground].map { try MaterialColor(role: .onBackground, hex: $0) } ?? onBackground,
      surface: try overrides[.surface].map { try MaterialColor(role: .surface, hex: $0) } ?? surface,
      onSurface: try overrides[.onSurface].map { try MaterialColor(role: .onSurface, hex: $0) } ?? onSurface,
      surfaceVariant: try overrides[.surfaceVariant].map { try MaterialColor(role: .surfaceVariant, hex: $0) } ?? surfaceVariant,
      onSurfaceVariant: try overrides[.onSurfaceVariant].map { try MaterialColor(role: .onSurfaceVariant, hex: $0) } ?? onSurfaceVariant,
      surfaceTint: try overrides[.surfaceTint].map { try MaterialColor(role: .surfaceTint, hex: $0) } ?? surfaceTint,
      inverseSurface: try overrides[.inverseSurface].map { try MaterialColor(role: .inverseSurface, hex: $0) } ?? inverseSurface,
      inverseOnSurface: try overrides[.inverseOnSurface].map { try MaterialColor(role: .inverseOnSurface, hex: $0) } ?? inverseOnSurface,
      error: try overrides[.error].map { try MaterialColor(role: .error, hex: $0) } ?? error,
      onError: try overrides[.onError].map { try MaterialColor(role: .onError, hex: $0) } ?? onError,
      errorContainer: try overrides[.errorContainer].map { try MaterialColor(role: .errorContainer, hex: $0) } ?? errorContainer,
      onErrorContainer: try overrides[.onErrorContainer].map { try MaterialColor(role: .onErrorContainer, hex: $0) } ?? onErrorContainer,
      outline: try overrides[.outline].map { try MaterialColor(role: .outline, hex: $0) } ?? outline,
      outlineVariant: try overrides[.outlineVariant].map { try MaterialColor(role: .outlineVariant, hex: $0) } ?? outlineVariant,
      scrim: try overrides[.scrim].map { try MaterialColor(role: .scrim, hex: $0) } ?? scrim,
      surfaceBright: try overrides[.surfaceBright].map { try MaterialColor(role: .surfaceBright, hex: $0) } ?? surfaceBright,
      surfaceContainer: try overrides[.surfaceContainer].map { try MaterialColor(role: .surfaceContainer, hex: $0) } ?? surfaceContainer,
      surfaceContainerHigh: try overrides[.surfaceContainerHigh].map { try MaterialColor(role: .surfaceContainerHigh, hex: $0) } ?? surfaceContainerHigh,
      surfaceContainerHighest: try overrides[.surfaceContainerHighest].map { try MaterialColor(role: .surfaceContainerHighest, hex: $0) } ?? surfaceContainerHighest,
      surfaceContainerLow: try overrides[.surfaceContainerLow].map { try MaterialColor(role: .surfaceContainerLow, hex: $0) } ?? surfaceContainerLow,
      surfaceContainerLowest: try overrides[.surfaceContainerLowest].map { try MaterialColor(role: .surfaceContainerLowest, hex: $0) } ?? surfaceContainerLowest,
      surfaceDim: try overrides[.surfaceDim].map { try MaterialColor(role: .surfaceDim, hex: $0) } ?? surfaceDim,
      primaryFixed: try overrides[.primaryFixed].map { try MaterialColor(role: .primaryFixed, hex: $0) } ?? primaryFixed,
      primaryFixedDim: try overrides[.primaryFixedDim].map { try MaterialColor(role: .primaryFixedDim, hex: $0) } ?? primaryFixedDim,
      onPrimaryFixed: try overrides[.onPrimaryFixed].map { try MaterialColor(role: .onPrimaryFixed, hex: $0) } ?? onPrimaryFixed,
      onPrimaryFixedVariant: try overrides[.onPrimaryFixedVariant].map { try MaterialColor(role: .onPrimaryFixedVariant, hex: $0) } ?? onPrimaryFixedVariant,
      secondaryFixed: try overrides[.secondaryFixed].map { try MaterialColor(role: .secondaryFixed, hex: $0) } ?? secondaryFixed,
      secondaryFixedDim: try overrides[.secondaryFixedDim].map { try MaterialColor(role: .secondaryFixedDim, hex: $0) } ?? secondaryFixedDim,
      onSecondaryFixed: try overrides[.onSecondaryFixed].map { try MaterialColor(role: .onSecondaryFixed, hex: $0) } ?? onSecondaryFixed,
      onSecondaryFixedVariant: try overrides[.onSecondaryFixedVariant].map { try MaterialColor(role: .onSecondaryFixedVariant, hex: $0) } ?? onSecondaryFixedVariant,
      tertiaryFixed: try overrides[.tertiaryFixed].map { try MaterialColor(role: .tertiaryFixed, hex: $0) } ?? tertiaryFixed,
      tertiaryFixedDim: try overrides[.tertiaryFixedDim].map { try MaterialColor(role: .tertiaryFixedDim, hex: $0) } ?? tertiaryFixedDim,
      onTertiaryFixed: try overrides[.onTertiaryFixed].map { try MaterialColor(role: .onTertiaryFixed, hex: $0) } ?? onTertiaryFixed,
      onTertiaryFixedVariant: try overrides[.onTertiaryFixedVariant].map { try MaterialColor(role: .onTertiaryFixedVariant, hex: $0) } ?? onTertiaryFixedVariant
    )
  }

  private static func color(_ role: MaterialColorRole, in roles: [MaterialColorRole: String]) throws -> MaterialColor {
    guard let hex = roles[role] else {
      throw MaterialColorSchemeError.missingRoles([role])
    }

    return try MaterialColor(role: role, hex: hex)
  }

  public static func custom(appearance: MaterialAppearance, roles: [MaterialColorRole: String]) throws -> MaterialColorScheme {
    let missingRoles = MaterialColorRole.allCases.filter { roles[$0] == nil }

    guard missingRoles.isEmpty else {
      throw MaterialColorSchemeError.missingRoles(missingRoles)
    }

    return MaterialColorScheme(
      appearance: appearance,
      primary: try color(.primary, in: roles),
      onPrimary: try color(.onPrimary, in: roles),
      primaryContainer: try color(.primaryContainer, in: roles),
      onPrimaryContainer: try color(.onPrimaryContainer, in: roles),
      inversePrimary: try color(.inversePrimary, in: roles),
      secondary: try color(.secondary, in: roles),
      onSecondary: try color(.onSecondary, in: roles),
      secondaryContainer: try color(.secondaryContainer, in: roles),
      onSecondaryContainer: try color(.onSecondaryContainer, in: roles),
      tertiary: try color(.tertiary, in: roles),
      onTertiary: try color(.onTertiary, in: roles),
      tertiaryContainer: try color(.tertiaryContainer, in: roles),
      onTertiaryContainer: try color(.onTertiaryContainer, in: roles),
      background: try color(.background, in: roles),
      onBackground: try color(.onBackground, in: roles),
      surface: try color(.surface, in: roles),
      onSurface: try color(.onSurface, in: roles),
      surfaceVariant: try color(.surfaceVariant, in: roles),
      onSurfaceVariant: try color(.onSurfaceVariant, in: roles),
      surfaceTint: try color(.surfaceTint, in: roles),
      inverseSurface: try color(.inverseSurface, in: roles),
      inverseOnSurface: try color(.inverseOnSurface, in: roles),
      error: try color(.error, in: roles),
      onError: try color(.onError, in: roles),
      errorContainer: try color(.errorContainer, in: roles),
      onErrorContainer: try color(.onErrorContainer, in: roles),
      outline: try color(.outline, in: roles),
      outlineVariant: try color(.outlineVariant, in: roles),
      scrim: try color(.scrim, in: roles),
      surfaceBright: try color(.surfaceBright, in: roles),
      surfaceContainer: try color(.surfaceContainer, in: roles),
      surfaceContainerHigh: try color(.surfaceContainerHigh, in: roles),
      surfaceContainerHighest: try color(.surfaceContainerHighest, in: roles),
      surfaceContainerLow: try color(.surfaceContainerLow, in: roles),
      surfaceContainerLowest: try color(.surfaceContainerLowest, in: roles),
      surfaceDim: try color(.surfaceDim, in: roles),
      primaryFixed: try color(.primaryFixed, in: roles),
      primaryFixedDim: try color(.primaryFixedDim, in: roles),
      onPrimaryFixed: try color(.onPrimaryFixed, in: roles),
      onPrimaryFixedVariant: try color(.onPrimaryFixedVariant, in: roles),
      secondaryFixed: try color(.secondaryFixed, in: roles),
      secondaryFixedDim: try color(.secondaryFixedDim, in: roles),
      onSecondaryFixed: try color(.onSecondaryFixed, in: roles),
      onSecondaryFixedVariant: try color(.onSecondaryFixedVariant, in: roles),
      tertiaryFixed: try color(.tertiaryFixed, in: roles),
      tertiaryFixedDim: try color(.tertiaryFixedDim, in: roles),
      onTertiaryFixed: try color(.onTertiaryFixed, in: roles),
      onTertiaryFixedVariant: try color(.onTertiaryFixedVariant, in: roles)
    )
  }

  public static func custom(
    base: MaterialThemePreset = .tonalSpot,
    appearance: MaterialAppearance,
    overrides: [MaterialColorRole: String]
  ) throws -> MaterialColorScheme {
    try preset(base, appearance: appearance).overriding(overrides)
  }

  public static let tonalSpotLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(uncheckedName: "primary", hex: "#65558F"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#E9DDFF"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#4D3D75"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#CFBDFE"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#625B71"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#E8DEF8"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#4A4458"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#7E5260"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#FFD9E3"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#633B48"),
    background: MaterialColor(uncheckedName: "background", hex: "#FDF7FF"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#1D1B20"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#FDF7FF"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#1D1B20"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#E7E0EB"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#49454E"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#65558F"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#322F35"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#F5EFF7"),
    error: MaterialColor(uncheckedName: "error", hex: "#BA1A1A"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#7A757F"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#CAC4CF"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#FDF7FF"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#F2ECF4"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#ECE6EE"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#E6E0E9"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#F8F2FA"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#DED8E0"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CFBDFE"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#201047"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#4D3D75"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#E8DEF8"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#CBC2DB"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1E192B"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#4A4458"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#FFD9E3"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#EFB8C8"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#31101D"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#633B48")
  )

  public static let tonalSpotDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(uncheckedName: "primary", hex: "#CFBDFE"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#36275D"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#4D3D75"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#E9DDFF"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#65558F"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#CBC2DB"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#332D41"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#4A4458"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#E8DEF8"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#EFB8C8"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#4A2532"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#633B48"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#FFD9E3"),
    background: MaterialColor(uncheckedName: "background", hex: "#141218"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#E6E0E9"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#141218"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#E6E0E9"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#49454E"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#CAC4CF"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#CFBDFE"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#E6E0E9"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#322F35"),
    error: MaterialColor(uncheckedName: "error", hex: "#FFB4AB"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#690005"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#948F99"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#49454E"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#3B383E"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#211F24"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#2B292F"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#36343A"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#1D1B20"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#0F0D13"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#141218"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CFBDFE"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#201047"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#4D3D75"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#E8DEF8"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#CBC2DB"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1E192B"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#4A4458"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#FFD9E3"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#EFB8C8"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#31101D"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#633B48")
  )

  public static let fidelityLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(uncheckedName: "primary", hex: "#4F378A"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#6750A4"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#E0D2FF"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#CFBCFF"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#63597C"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#E1D4FD"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#645A7D"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#765B00"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#C9A74D"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#503D00"),
    background: MaterialColor(uncheckedName: "background", hex: "#FDF7FF"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#1D1B20"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#FDF7FF"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#1D1B20"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#E7E0EE"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#494551"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#6750A4"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#322F35"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#F5EFF7"),
    error: MaterialColor(uncheckedName: "error", hex: "#BA1A1A"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#7A7582"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#CBC4D2"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#FDF7FF"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#F2ECF4"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#ECE6EE"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#E6E0E9"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#F8F2FA"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#DED8E0"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#E9DDFF"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#CDC0E9"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1F1635"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#4B4263"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#FFDF93"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#E7C365"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#241A00"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#594400")
  )

  public static let fidelityDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(uncheckedName: "primary", hex: "#CFBCFF"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#381E72"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#6750A4"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#E0D2FF"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#6750A4"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#CDC0E9"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#342B4B"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#4D4465"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#BFB2DA"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#E7C365"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#3E2E00"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#C9A74D"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#503D00"),
    background: MaterialColor(uncheckedName: "background", hex: "#141218"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#E6E0E9"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#141218"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#E6E0E9"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#494551"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#CBC4D2"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#CFBCFF"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#E6E0E9"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#322F35"),
    error: MaterialColor(uncheckedName: "error", hex: "#FFB4AB"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#690005"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#948E9C"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#494551"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#3B383E"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#211F24"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#2B292F"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#36343A"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#1D1B20"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#0F0D13"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#141218"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#E9DDFF"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#CDC0E9"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1F1635"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#4B4263"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#FFDF93"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#E7C365"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#241A00"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#594400")
  )

  public static let contentLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(uncheckedName: "primary", hex: "#4F378A"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#6750A4"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#E0D2FF"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#CFBCFF"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#63597C"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#E1D4FD"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#645A7D"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#762A5B"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#924274"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#FFCAE5"),
    background: MaterialColor(uncheckedName: "background", hex: "#FDF7FF"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#1D1B20"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#FDF7FF"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#1D1B20"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#E7E0EE"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#494551"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#6750A4"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#322F35"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#F5EFF7"),
    error: MaterialColor(uncheckedName: "error", hex: "#BA1A1A"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#7A7582"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#CBC4D2"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#FDF7FF"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#F2ECF4"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#ECE6EE"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#E6E0E9"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#F8F2FA"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#DED8E0"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#E9DDFF"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#CDC0E9"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1F1635"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#4B4263"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#FFD8EA"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#FFAEDB"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#3C002B"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#752A5B")
  )

  public static let contentDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(uncheckedName: "primary", hex: "#CFBCFF"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#381E72"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#6750A4"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#E0D2FF"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#6750A4"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#CDC0E9"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#342B4B"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#4D4465"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#BFB2DA"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#FFAEDB"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#5A1243"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#924274"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#FFCAE5"),
    background: MaterialColor(uncheckedName: "background", hex: "#141218"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#E6E0E9"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#141218"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#E6E0E9"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#494551"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#CBC4D2"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#CFBCFF"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#E6E0E9"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#322F35"),
    error: MaterialColor(uncheckedName: "error", hex: "#FFB4AB"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#690005"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#948E9C"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#494551"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#3B383E"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#211F24"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#2B292F"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#36343A"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#1D1B20"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#0F0D13"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#141218"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#E9DDFF"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#CDC0E9"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1F1635"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#4B4263"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#FFD8EA"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#FFAEDB"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#3C002B"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#752A5B")
  )

  public static let monochromeLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(uncheckedName: "primary", hex: "#000000"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#E2E2E2"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#3B3B3B"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#FFFFFF"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#C6C6C6"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#5E5E5E"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#D4D4D4"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#1B1B1B"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#3B3B3B"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#E2E2E2"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#747474"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#FFFFFF"),
    background: MaterialColor(uncheckedName: "background", hex: "#F9F9F9"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#1B1B1B"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#F9F9F9"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#1B1B1B"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#E2E2E2"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#474747"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#5E5E5E"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#303030"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#F1F1F1"),
    error: MaterialColor(uncheckedName: "error", hex: "#BA1A1A"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#410002"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#777777"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#C6C6C6"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#F9F9F9"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#EEEEEE"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#E8E8E8"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#E2E2E2"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#F3F3F3"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#DADADA"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#5E5E5E"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#474747"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#FFFFFF"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#E2E2E2"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#C6C6C6"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#ABABAB"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1B1B1B"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#3B3B3B"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#5E5E5E"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#474747"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#FFFFFF"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#E2E2E2")
  )

  public static let monochromeDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(uncheckedName: "primary", hex: "#FFFFFF"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#1B1B1B"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#D4D4D4"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#000000"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#5E5E5E"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#C6C6C6"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#1B1B1B"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#474747"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#E2E2E2"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#E2E2E2"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#1B1B1B"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#919191"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#000000"),
    background: MaterialColor(uncheckedName: "background", hex: "#131313"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#E2E2E2"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#131313"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#E2E2E2"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#474747"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#C6C6C6"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#C6C6C6"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#E2E2E2"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#303030"),
    error: MaterialColor(uncheckedName: "error", hex: "#FFB4AB"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#690005"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#919191"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#474747"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#393939"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#1F1F1F"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#2A2A2A"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#353535"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#1B1B1B"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#0E0E0E"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#131313"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#5E5E5E"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#474747"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#FFFFFF"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#E2E2E2"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#C6C6C6"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#ABABAB"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1B1B1B"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#3B3B3B"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#5E5E5E"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#474747"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#FFFFFF"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#E2E2E2")
  )

  public static let neutralLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(uncheckedName: "primary", hex: "#615C6B"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#E7DFF2"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#494453"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#CBC3D5"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#615D66"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#E7E0EB"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#49454E"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#625B71"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#E8DEF8"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#4A4458"),
    background: MaterialColor(uncheckedName: "background", hex: "#FDF8FA"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#1C1B1D"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#FDF8FA"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#1C1B1D"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#E6E1E3"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#484648"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#615C6B"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#313032"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#F4EFF1"),
    error: MaterialColor(uncheckedName: "error", hex: "#BA1A1A"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#797678"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#C9C5C7"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#FDF8FA"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#F1EDEE"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#EBE7E9"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#E6E1E3"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#F7F2F4"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#DDD9DB"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E7DFF2"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CBC3D5"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#1D1A26"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#494453"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#E7E0EB"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#CAC4CF"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1D1A22"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#49454E"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#E8DEF8"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#CBC2DB"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#1E192B"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#4A4458")
  )

  public static let neutralDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(uncheckedName: "primary", hex: "#CBC3D5"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#322E3C"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#494453"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#E7DFF2"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#615C6B"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#CAC4CF"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#322F38"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#49454E"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#E7E0EB"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#CBC2DB"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#332D41"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#4A4458"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#E8DEF8"),
    background: MaterialColor(uncheckedName: "background", hex: "#141314"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#E6E1E3"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#141314"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#E6E1E3"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#484648"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#C9C5C7"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#CBC3D5"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#E6E1E3"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#313032"),
    error: MaterialColor(uncheckedName: "error", hex: "#FFB4AB"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#690005"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#939092"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#484648"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#3A393A"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#201F21"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#2B292B"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#363436"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#1C1B1D"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#0F0E0F"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#141314"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E7DFF2"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CBC3D5"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#1D1A26"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#494453"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#E7E0EB"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#CAC4CF"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1D1A22"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#49454E"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#E8DEF8"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#CBC2DB"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#1E192B"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#4A4458")
  )

  public static let vibrantLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(uncheckedName: "primary", hex: "#6F19FF"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#E9DDFF"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#5400CC"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#CFBCFF"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#6B5778"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#F3DAFF"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#523F5F"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#79507A"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#FFD6FC"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#5F3961"),
    background: MaterialColor(uncheckedName: "background", hex: "#FDF7FF"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#1D1A24"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#FDF7FF"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#1D1A24"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#E7DFF2"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#494453"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#6F19FF"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#322F3A"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#F5EEFD"),
    error: MaterialColor(uncheckedName: "error", hex: "#BA1A1A"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#7A7484"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#CBC3D5"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#FDF7FF"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#F2EBFA"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#EDE5F4"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#E7E0EF"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#F8F1FF"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#DED7E6"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#5400CC"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#F3DAFF"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#D7BEE4"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#251431"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#523F5F"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#FFD6FC"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#E8B7E7"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#2F0D33"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#5F3961")
  )

  public static let vibrantDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(uncheckedName: "primary", hex: "#CFBCFF"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#3A0092"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#5400CC"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#E9DDFF"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#6F19FF"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#D7BEE4"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#3B2948"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#523F5F"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#F3DAFF"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#E8B7E7"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#462349"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#5F3961"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#FFD6FC"),
    background: MaterialColor(uncheckedName: "background", hex: "#15121C"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#E7E0EF"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#15121C"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#E7E0EF"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#494453"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#CBC3D5"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#CFBCFF"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#E7E0EF"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#322F3A"),
    error: MaterialColor(uncheckedName: "error", hex: "#FFB4AB"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#690005"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#948E9F"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#494453"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#3B3743"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#211E28"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#2C2833"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#37333E"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#1D1A24"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#0F0D16"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#15121C"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#5400CC"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#F3DAFF"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#D7BEE4"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#251431"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#523F5F"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#FFD6FC"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#E8B7E7"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#2F0D33"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#5F3961")
  )

  public static let expressiveLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(uncheckedName: "primary", hex: "#006B5A"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#95F4DC"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#005143"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#79D7C0"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#79536A"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#FFD8ED"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#5F3C52"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#735280"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#F7D8FF"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#593B67"),
    background: MaterialColor(uncheckedName: "background", hex: "#FFF7FD"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#1F1A21"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#FFF7FD"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#1F1A21"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#ECDEF0"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#4D4351"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#006B5A"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#342E37"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#F8EDF9"),
    error: MaterialColor(uncheckedName: "error", hex: "#BA1A1A"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#7E7383"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#CFC2D3"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#FFF7FD"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#F5EBF6"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#EFE5F0"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#EADFEA"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#FBF0FB"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#E1D7E2"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#95F4DC"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#79D7C0"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#00201A"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#005143"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#FFD8ED"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#E8B9D4"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#2E1125"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#5F3C52"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#F7D8FF"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#E0B9EE"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#2B0E39"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#593B67")
  )

  public static let expressiveDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(uncheckedName: "primary", hex: "#79D7C0"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#00382E"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#005143"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#95F4DC"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#006B5A"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#E8B9D4"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#46263B"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#5F3C52"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#FFD8ED"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#E0B9EE"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#41244F"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#593B67"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#F7D8FF"),
    background: MaterialColor(uncheckedName: "background", hex: "#161219"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#EADFEA"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#161219"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#EADFEA"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#4D4351"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#CFC2D3"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#79D7C0"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#EADFEA"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#342E37"),
    error: MaterialColor(uncheckedName: "error", hex: "#FFB4AB"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#690005"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#988D9D"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#4D4351"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#3D373F"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#231E25"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#2D2830"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#38333B"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#1F1A21"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#110D14"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#161219"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#95F4DC"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#79D7C0"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#00201A"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#005143"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#FFD8ED"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#E8B9D4"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#2E1125"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#5F3C52"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#F7D8FF"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#E0B9EE"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#2B0E39"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#593B67")
  )

  public static let rainbowLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(uncheckedName: "primary", hex: "#6750A4"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#E9DDFF"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#4F378A"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#CFBCFF"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#625B71"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#E8DEF8"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#4A4458"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#7E5260"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#FFD9E3"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#633B48"),
    background: MaterialColor(uncheckedName: "background", hex: "#F9F9F9"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#1B1B1B"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#F9F9F9"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#1B1B1B"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#E2E2E2"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#474747"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#6750A4"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#303030"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#F1F1F1"),
    error: MaterialColor(uncheckedName: "error", hex: "#BA1A1A"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#777777"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#C6C6C6"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#F9F9F9"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#EEEEEE"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#E8E8E8"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#E2E2E2"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#F3F3F3"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#DADADA"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#E8DEF8"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#CBC2DB"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1E192B"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#4A4458"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#FFD9E3"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#EFB8C8"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#31101D"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#633B48")
  )

  public static let rainbowDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(uncheckedName: "primary", hex: "#CFBCFF"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#381E72"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#4F378A"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#E9DDFF"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#6750A4"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#CBC2DB"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#332D41"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#4A4458"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#E8DEF8"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#EFB8C8"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#4A2532"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#633B48"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#FFD9E3"),
    background: MaterialColor(uncheckedName: "background", hex: "#131313"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#E2E2E2"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#131313"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#E2E2E2"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#474747"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#C6C6C6"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#CFBCFF"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#E2E2E2"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#303030"),
    error: MaterialColor(uncheckedName: "error", hex: "#FFB4AB"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#690005"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#919191"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#474747"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#393939"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#1F1F1F"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#2A2A2A"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#353535"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#1B1B1B"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#0E0E0E"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#131313"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#E8DEF8"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#CBC2DB"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#1E192B"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#4A4458"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#FFD9E3"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#EFB8C8"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#31101D"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#633B48")
  )

  public static let fruitSaladLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(uncheckedName: "primary", hex: "#00639C"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#CEE5FF"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#004A77"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#97CBFF"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#30628C"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#CEE5FF"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#104A73"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#65558F"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#E9DDFF"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#4D3D75"),
    background: MaterialColor(uncheckedName: "background", hex: "#FDF7FF"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#1D1A24"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#FDF7FF"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#1D1A24"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#E8DEF8"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#4A4458"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#00639C"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#322F3A"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#F5EEFD"),
    error: MaterialColor(uncheckedName: "error", hex: "#BA1A1A"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#7B748A"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#CBC2DB"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#FDF7FF"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#F2EBFA"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#EDE5F4"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#E7E0EF"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#F8F1FF"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#DED7E6"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#CEE5FF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#97CBFF"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#001D33"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#004A77"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#CEE5FF"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#9CCBFB"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#001D33"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#104A73"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#E9DDFF"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#CFBDFE"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#201047"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#4D3D75")
  )

  public static let fruitSaladDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(uncheckedName: "primary", hex: "#97CBFF"),
    onPrimary: MaterialColor(uncheckedName: "onPrimary", hex: "#003354"),
    primaryContainer: MaterialColor(uncheckedName: "primaryContainer", hex: "#004A77"),
    onPrimaryContainer: MaterialColor(uncheckedName: "onPrimaryContainer", hex: "#CEE5FF"),
    inversePrimary: MaterialColor(uncheckedName: "inversePrimary", hex: "#00639C"),
    secondary: MaterialColor(uncheckedName: "secondary", hex: "#9CCBFB"),
    onSecondary: MaterialColor(uncheckedName: "onSecondary", hex: "#003354"),
    secondaryContainer: MaterialColor(uncheckedName: "secondaryContainer", hex: "#104A73"),
    onSecondaryContainer: MaterialColor(uncheckedName: "onSecondaryContainer", hex: "#CEE5FF"),
    tertiary: MaterialColor(uncheckedName: "tertiary", hex: "#CFBDFE"),
    onTertiary: MaterialColor(uncheckedName: "onTertiary", hex: "#36275D"),
    tertiaryContainer: MaterialColor(uncheckedName: "tertiaryContainer", hex: "#4D3D75"),
    onTertiaryContainer: MaterialColor(uncheckedName: "onTertiaryContainer", hex: "#E9DDFF"),
    background: MaterialColor(uncheckedName: "background", hex: "#15121C"),
    onBackground: MaterialColor(uncheckedName: "onBackground", hex: "#E7E0EF"),
    surface: MaterialColor(uncheckedName: "surface", hex: "#15121C"),
    onSurface: MaterialColor(uncheckedName: "onSurface", hex: "#E7E0EF"),
    surfaceVariant: MaterialColor(uncheckedName: "surfaceVariant", hex: "#4A4458"),
    onSurfaceVariant: MaterialColor(uncheckedName: "onSurfaceVariant", hex: "#CBC2DB"),
    surfaceTint: MaterialColor(uncheckedName: "surfaceTint", hex: "#97CBFF"),
    inverseSurface: MaterialColor(uncheckedName: "inverseSurface", hex: "#E7E0EF"),
    inverseOnSurface: MaterialColor(uncheckedName: "inverseOnSurface", hex: "#322F3A"),
    error: MaterialColor(uncheckedName: "error", hex: "#FFB4AB"),
    onError: MaterialColor(uncheckedName: "onError", hex: "#690005"),
    errorContainer: MaterialColor(uncheckedName: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(uncheckedName: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(uncheckedName: "outline", hex: "#958DA4"),
    outlineVariant: MaterialColor(uncheckedName: "outlineVariant", hex: "#4A4458"),
    scrim: MaterialColor(uncheckedName: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(uncheckedName: "surfaceBright", hex: "#3B3743"),
    surfaceContainer: MaterialColor(uncheckedName: "surfaceContainer", hex: "#211E28"),
    surfaceContainerHigh: MaterialColor(uncheckedName: "surfaceContainerHigh", hex: "#2C2833"),
    surfaceContainerHighest: MaterialColor(uncheckedName: "surfaceContainerHighest", hex: "#37333E"),
    surfaceContainerLow: MaterialColor(uncheckedName: "surfaceContainerLow", hex: "#1D1A24"),
    surfaceContainerLowest: MaterialColor(uncheckedName: "surfaceContainerLowest", hex: "#0F0D16"),
    surfaceDim: MaterialColor(uncheckedName: "surfaceDim", hex: "#15121C"),
    primaryFixed: MaterialColor(uncheckedName: "primaryFixed", hex: "#CEE5FF"),
    primaryFixedDim: MaterialColor(uncheckedName: "primaryFixedDim", hex: "#97CBFF"),
    onPrimaryFixed: MaterialColor(uncheckedName: "onPrimaryFixed", hex: "#001D33"),
    onPrimaryFixedVariant: MaterialColor(uncheckedName: "onPrimaryFixedVariant", hex: "#004A77"),
    secondaryFixed: MaterialColor(uncheckedName: "secondaryFixed", hex: "#CEE5FF"),
    secondaryFixedDim: MaterialColor(uncheckedName: "secondaryFixedDim", hex: "#9CCBFB"),
    onSecondaryFixed: MaterialColor(uncheckedName: "onSecondaryFixed", hex: "#001D33"),
    onSecondaryFixedVariant: MaterialColor(uncheckedName: "onSecondaryFixedVariant", hex: "#104A73"),
    tertiaryFixed: MaterialColor(uncheckedName: "tertiaryFixed", hex: "#E9DDFF"),
    tertiaryFixedDim: MaterialColor(uncheckedName: "tertiaryFixedDim", hex: "#CFBDFE"),
    onTertiaryFixed: MaterialColor(uncheckedName: "onTertiaryFixed", hex: "#201047"),
    onTertiaryFixedVariant: MaterialColor(uncheckedName: "onTertiaryFixedVariant", hex: "#4D3D75")
  )

  public static let baselineLight = tonalSpotLight
  public static let baselineDark = tonalSpotDark

  public static func preset(_ preset: MaterialThemePreset, appearance: MaterialAppearance) -> MaterialColorScheme {
    switch (preset, appearance) {
    case (.tonalSpot, .light):
      return tonalSpotLight
    case (.tonalSpot, .dark):
      return tonalSpotDark
    case (.fidelity, .light):
      return fidelityLight
    case (.fidelity, .dark):
      return fidelityDark
    case (.content, .light):
      return contentLight
    case (.content, .dark):
      return contentDark
    case (.monochrome, .light):
      return monochromeLight
    case (.monochrome, .dark):
      return monochromeDark
    case (.neutral, .light):
      return neutralLight
    case (.neutral, .dark):
      return neutralDark
    case (.vibrant, .light):
      return vibrantLight
    case (.vibrant, .dark):
      return vibrantDark
    case (.expressive, .light):
      return expressiveLight
    case (.expressive, .dark):
      return expressiveDark
    case (.rainbow, .light):
      return rainbowLight
    case (.rainbow, .dark):
      return rainbowDark
    case (.fruitSalad, .light):
      return fruitSaladLight
    case (.fruitSalad, .dark):
      return fruitSaladDark
    }
  }

  public static func baseline(_ appearance: MaterialAppearance) -> MaterialColorScheme {
    preset(.tonalSpot, appearance: appearance)
  }
}

public struct MaterialTheme: Hashable, Sendable {
  public let sourceColor: MaterialColor
  public let colorScheme: MaterialColorScheme
  public let themePreset: MaterialThemePreset?

  public init(
    colorScheme: MaterialColorScheme,
    sourceColor: MaterialColor = MaterialTheme.materialSourceColor,
    themePreset: MaterialThemePreset? = nil
  ) {
    self.sourceColor = sourceColor
    self.colorScheme = colorScheme
    self.themePreset = themePreset
  }

  public static let materialSourceColor = MaterialColor(uncheckedName: "sourceColor", hex: "#6750A4")

  public static let light = MaterialTheme.preset(.tonalSpot, appearance: .light)
  public static let dark = MaterialTheme.preset(.tonalSpot, appearance: .dark)

  public static func preset(_ preset: MaterialThemePreset, appearance: MaterialAppearance) -> MaterialTheme {
    MaterialTheme(
      colorScheme: .preset(preset, appearance: appearance),
      sourceColor: preset.sourceColor,
      themePreset: preset
    )
  }

  public static func custom(
    base: MaterialThemePreset = .tonalSpot,
    appearance: MaterialAppearance,
    overrides: [MaterialColorRole: String],
    sourceColor: String? = nil
  ) throws -> MaterialTheme {
    let resolvedSourceColor = try sourceColor.map { try MaterialColor(name: "sourceColor", hex: $0) } ?? base.sourceColor

    return MaterialTheme(
      colorScheme: try .custom(base: base, appearance: appearance, overrides: overrides),
      sourceColor: resolvedSourceColor
    )
  }

  public static func custom(
    appearance: MaterialAppearance,
    roles: [MaterialColorRole: String],
    sourceColor: String? = nil
  ) throws -> MaterialTheme {
    let resolvedSourceColor = try sourceColor.map { try MaterialColor(name: "sourceColor", hex: $0) } ?? materialSourceColor

    return MaterialTheme(
      colorScheme: try .custom(appearance: appearance, roles: roles),
      sourceColor: resolvedSourceColor
    )
  }

  public static func baseline(_ appearance: MaterialAppearance) -> MaterialTheme {
    preset(.tonalSpot, appearance: appearance)
  }
}
