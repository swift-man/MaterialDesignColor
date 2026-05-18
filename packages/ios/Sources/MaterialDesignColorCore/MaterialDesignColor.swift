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

public struct MaterialColor: Hashable, Sendable {
  public let name: String
  public let hex: String
  public let red: UInt8
  public let green: UInt8
  public let blue: UInt8
  public let alpha: UInt8

  public init(name: String, hex: String) {
    let normalizedHex = hex.uppercased()
    precondition(normalizedHex.count == 7 && normalizedHex.first == "#", "Expected #RRGGBB hex color")

    guard let value = UInt32(String(normalizedHex.dropFirst()), radix: 16) else {
      preconditionFailure("Expected #RRGGBB hex color")
    }

    self.name = name
    self.hex = normalizedHex
    self.red = UInt8((value >> 16) & 0xFF)
    self.green = UInt8((value >> 8) & 0xFF)
    self.blue = UInt8(value & 0xFF)
    self.alpha = 0xFF
  }

  public init(role: MaterialColorRole, hex: String) {
    self.init(name: role.rawValue, hex: hex)
  }

  public var rgb: (red: UInt8, green: UInt8, blue: UInt8) {
    (red, green, blue)
  }

  public var argb: UInt32 {
    (UInt32(alpha) << 24) | (UInt32(red) << 16) | (UInt32(green) << 8) | UInt32(blue)
  }
}

public enum MaterialPalette {
  public static let red50 = MaterialColor(name: "red50", hex: "#FFEBEE")
  public static let red100 = MaterialColor(name: "red100", hex: "#FFCDD2")
  public static let red200 = MaterialColor(name: "red200", hex: "#EF9A9A")
  public static let red300 = MaterialColor(name: "red300", hex: "#E57373")
  public static let red400 = MaterialColor(name: "red400", hex: "#EF5350")
  public static let red500 = MaterialColor(name: "red500", hex: "#F44336")
  public static let red600 = MaterialColor(name: "red600", hex: "#E53935")
  public static let red700 = MaterialColor(name: "red700", hex: "#D32F2F")
  public static let red800 = MaterialColor(name: "red800", hex: "#C62828")
  public static let red900 = MaterialColor(name: "red900", hex: "#B71C1C")
  public static let redA100 = MaterialColor(name: "redA100", hex: "#FF8A80")
  public static let redA200 = MaterialColor(name: "redA200", hex: "#FF5252")
  public static let redA400 = MaterialColor(name: "redA400", hex: "#FF1744")
  public static let redA700 = MaterialColor(name: "redA700", hex: "#D50000")
  public static let pink50 = MaterialColor(name: "pink50", hex: "#FCE4EC")
  public static let pink100 = MaterialColor(name: "pink100", hex: "#F8BBD0")
  public static let pink200 = MaterialColor(name: "pink200", hex: "#F48FB1")
  public static let pink300 = MaterialColor(name: "pink300", hex: "#F06292")
  public static let pink400 = MaterialColor(name: "pink400", hex: "#EC407A")
  public static let pink500 = MaterialColor(name: "pink500", hex: "#E91E63")
  public static let pink600 = MaterialColor(name: "pink600", hex: "#D81B60")
  public static let pink700 = MaterialColor(name: "pink700", hex: "#C2185B")
  public static let pink800 = MaterialColor(name: "pink800", hex: "#AD1457")
  public static let pink900 = MaterialColor(name: "pink900", hex: "#880E4F")
  public static let pinkA100 = MaterialColor(name: "pinkA100", hex: "#FF80AB")
  public static let pinkA200 = MaterialColor(name: "pinkA200", hex: "#FF4081")
  public static let pinkA400 = MaterialColor(name: "pinkA400", hex: "#F50057")
  public static let pinkA700 = MaterialColor(name: "pinkA700", hex: "#C51162")
  public static let purple50 = MaterialColor(name: "purple50", hex: "#F3E5F5")
  public static let purple100 = MaterialColor(name: "purple100", hex: "#E1BEE7")
  public static let purple200 = MaterialColor(name: "purple200", hex: "#CE93D8")
  public static let purple300 = MaterialColor(name: "purple300", hex: "#BA68C8")
  public static let purple400 = MaterialColor(name: "purple400", hex: "#AB47BC")
  public static let purple500 = MaterialColor(name: "purple500", hex: "#9C27B0")
  public static let purple600 = MaterialColor(name: "purple600", hex: "#8E24AA")
  public static let purple700 = MaterialColor(name: "purple700", hex: "#7B1FA2")
  public static let purple800 = MaterialColor(name: "purple800", hex: "#6A1B9A")
  public static let purple900 = MaterialColor(name: "purple900", hex: "#4A148C")
  public static let purpleA100 = MaterialColor(name: "purpleA100", hex: "#EA80FC")
  public static let purpleA200 = MaterialColor(name: "purpleA200", hex: "#E040FB")
  public static let purpleA400 = MaterialColor(name: "purpleA400", hex: "#D500F9")
  public static let purpleA700 = MaterialColor(name: "purpleA700", hex: "#AA00FF")
  public static let deepPurple50 = MaterialColor(name: "deepPurple50", hex: "#EDE7F6")
  public static let deepPurple100 = MaterialColor(name: "deepPurple100", hex: "#D1C4E9")
  public static let deepPurple200 = MaterialColor(name: "deepPurple200", hex: "#B39DDB")
  public static let deepPurple300 = MaterialColor(name: "deepPurple300", hex: "#9575CD")
  public static let deepPurple400 = MaterialColor(name: "deepPurple400", hex: "#7E57C2")
  public static let deepPurple500 = MaterialColor(name: "deepPurple500", hex: "#673AB7")
  public static let deepPurple600 = MaterialColor(name: "deepPurple600", hex: "#5E35B1")
  public static let deepPurple700 = MaterialColor(name: "deepPurple700", hex: "#512DA8")
  public static let deepPurple800 = MaterialColor(name: "deepPurple800", hex: "#4527A0")
  public static let deepPurple900 = MaterialColor(name: "deepPurple900", hex: "#311B92")
  public static let deepPurpleA100 = MaterialColor(name: "deepPurpleA100", hex: "#B388FF")
  public static let deepPurpleA200 = MaterialColor(name: "deepPurpleA200", hex: "#7C4DFF")
  public static let deepPurpleA400 = MaterialColor(name: "deepPurpleA400", hex: "#651FFF")
  public static let deepPurpleA700 = MaterialColor(name: "deepPurpleA700", hex: "#6200EA")
  public static let indigo50 = MaterialColor(name: "indigo50", hex: "#E8EAF6")
  public static let indigo100 = MaterialColor(name: "indigo100", hex: "#C5CAE9")
  public static let indigo200 = MaterialColor(name: "indigo200", hex: "#9FA8DA")
  public static let indigo300 = MaterialColor(name: "indigo300", hex: "#7986CB")
  public static let indigo400 = MaterialColor(name: "indigo400", hex: "#5C6BC0")
  public static let indigo500 = MaterialColor(name: "indigo500", hex: "#3F51B5")
  public static let indigo600 = MaterialColor(name: "indigo600", hex: "#3949AB")
  public static let indigo700 = MaterialColor(name: "indigo700", hex: "#303F9F")
  public static let indigo800 = MaterialColor(name: "indigo800", hex: "#283593")
  public static let indigo900 = MaterialColor(name: "indigo900", hex: "#1A237E")
  public static let indigoA100 = MaterialColor(name: "indigoA100", hex: "#8C9EFF")
  public static let indigoA200 = MaterialColor(name: "indigoA200", hex: "#536DFE")
  public static let indigoA400 = MaterialColor(name: "indigoA400", hex: "#3D5AFE")
  public static let indigoA700 = MaterialColor(name: "indigoA700", hex: "#304FFE")
  public static let blue50 = MaterialColor(name: "blue50", hex: "#E3F2FD")
  public static let blue100 = MaterialColor(name: "blue100", hex: "#BBDEFB")
  public static let blue200 = MaterialColor(name: "blue200", hex: "#90CAF9")
  public static let blue300 = MaterialColor(name: "blue300", hex: "#64B5F6")
  public static let blue400 = MaterialColor(name: "blue400", hex: "#42A5F5")
  public static let blue500 = MaterialColor(name: "blue500", hex: "#2196F3")
  public static let blue600 = MaterialColor(name: "blue600", hex: "#1E88E5")
  public static let blue700 = MaterialColor(name: "blue700", hex: "#1976D2")
  public static let blue800 = MaterialColor(name: "blue800", hex: "#1565C0")
  public static let blue900 = MaterialColor(name: "blue900", hex: "#0D47A1")
  public static let blueA100 = MaterialColor(name: "blueA100", hex: "#82B1FF")
  public static let blueA200 = MaterialColor(name: "blueA200", hex: "#448AFF")
  public static let blueA400 = MaterialColor(name: "blueA400", hex: "#2979FF")
  public static let blueA700 = MaterialColor(name: "blueA700", hex: "#2962FF")
  public static let lightBlue50 = MaterialColor(name: "lightBlue50", hex: "#E1F5FE")
  public static let lightBlue100 = MaterialColor(name: "lightBlue100", hex: "#B3E5FC")
  public static let lightBlue200 = MaterialColor(name: "lightBlue200", hex: "#81D4FA")
  public static let lightBlue300 = MaterialColor(name: "lightBlue300", hex: "#4FC3F7")
  public static let lightBlue400 = MaterialColor(name: "lightBlue400", hex: "#29B6F6")
  public static let lightBlue500 = MaterialColor(name: "lightBlue500", hex: "#03A9F4")
  public static let lightBlue600 = MaterialColor(name: "lightBlue600", hex: "#039BE5")
  public static let lightBlue700 = MaterialColor(name: "lightBlue700", hex: "#0288D1")
  public static let lightBlue800 = MaterialColor(name: "lightBlue800", hex: "#0277BD")
  public static let lightBlue900 = MaterialColor(name: "lightBlue900", hex: "#01579B")
  public static let lightBlueA100 = MaterialColor(name: "lightBlueA100", hex: "#80D8FF")
  public static let lightBlueA200 = MaterialColor(name: "lightBlueA200", hex: "#40C4FF")
  public static let lightBlueA400 = MaterialColor(name: "lightBlueA400", hex: "#00B0FF")
  public static let lightBlueA700 = MaterialColor(name: "lightBlueA700", hex: "#0091EA")
  public static let cyan50 = MaterialColor(name: "cyan50", hex: "#E0F7FA")
  public static let cyan100 = MaterialColor(name: "cyan100", hex: "#B2EBF2")
  public static let cyan200 = MaterialColor(name: "cyan200", hex: "#80DEEA")
  public static let cyan300 = MaterialColor(name: "cyan300", hex: "#4DD0E1")
  public static let cyan400 = MaterialColor(name: "cyan400", hex: "#26C6DA")
  public static let cyan500 = MaterialColor(name: "cyan500", hex: "#00BCD4")
  public static let cyan600 = MaterialColor(name: "cyan600", hex: "#00ACC1")
  public static let cyan700 = MaterialColor(name: "cyan700", hex: "#0097A7")
  public static let cyan800 = MaterialColor(name: "cyan800", hex: "#00838F")
  public static let cyan900 = MaterialColor(name: "cyan900", hex: "#006064")
  public static let cyanA100 = MaterialColor(name: "cyanA100", hex: "#84FFFF")
  public static let cyanA200 = MaterialColor(name: "cyanA200", hex: "#18FFFF")
  public static let cyanA400 = MaterialColor(name: "cyanA400", hex: "#00E5FF")
  public static let cyanA700 = MaterialColor(name: "cyanA700", hex: "#00B8D4")
  public static let teal50 = MaterialColor(name: "teal50", hex: "#E0F2F1")
  public static let teal100 = MaterialColor(name: "teal100", hex: "#B2DFDB")
  public static let teal200 = MaterialColor(name: "teal200", hex: "#80CBC4")
  public static let teal300 = MaterialColor(name: "teal300", hex: "#4DB6AC")
  public static let teal400 = MaterialColor(name: "teal400", hex: "#26A69A")
  public static let teal500 = MaterialColor(name: "teal500", hex: "#009688")
  public static let teal600 = MaterialColor(name: "teal600", hex: "#00897B")
  public static let teal700 = MaterialColor(name: "teal700", hex: "#00796B")
  public static let teal800 = MaterialColor(name: "teal800", hex: "#00695C")
  public static let teal900 = MaterialColor(name: "teal900", hex: "#004D40")
  public static let tealA100 = MaterialColor(name: "tealA100", hex: "#A7FFEB")
  public static let tealA200 = MaterialColor(name: "tealA200", hex: "#64FFDA")
  public static let tealA400 = MaterialColor(name: "tealA400", hex: "#1DE9B6")
  public static let tealA700 = MaterialColor(name: "tealA700", hex: "#00BFA5")
  public static let green50 = MaterialColor(name: "green50", hex: "#E8F5E9")
  public static let green100 = MaterialColor(name: "green100", hex: "#C8E6C9")
  public static let green200 = MaterialColor(name: "green200", hex: "#A5D6A7")
  public static let green300 = MaterialColor(name: "green300", hex: "#81C784")
  public static let green400 = MaterialColor(name: "green400", hex: "#66BB6A")
  public static let green500 = MaterialColor(name: "green500", hex: "#4CAF50")
  public static let green600 = MaterialColor(name: "green600", hex: "#43A047")
  public static let green700 = MaterialColor(name: "green700", hex: "#388E3C")
  public static let green800 = MaterialColor(name: "green800", hex: "#2E7D32")
  public static let green900 = MaterialColor(name: "green900", hex: "#1B5E20")
  public static let greenA100 = MaterialColor(name: "greenA100", hex: "#B9F6CA")
  public static let greenA200 = MaterialColor(name: "greenA200", hex: "#69F0AE")
  public static let greenA400 = MaterialColor(name: "greenA400", hex: "#00E676")
  public static let greenA700 = MaterialColor(name: "greenA700", hex: "#00C853")
  public static let lightGreen50 = MaterialColor(name: "lightGreen50", hex: "#F1F8E9")
  public static let lightGreen100 = MaterialColor(name: "lightGreen100", hex: "#DCEDC8")
  public static let lightGreen200 = MaterialColor(name: "lightGreen200", hex: "#C5E1A5")
  public static let lightGreen300 = MaterialColor(name: "lightGreen300", hex: "#AED581")
  public static let lightGreen400 = MaterialColor(name: "lightGreen400", hex: "#9CCC65")
  public static let lightGreen500 = MaterialColor(name: "lightGreen500", hex: "#8BC34A")
  public static let lightGreen600 = MaterialColor(name: "lightGreen600", hex: "#7CB342")
  public static let lightGreen700 = MaterialColor(name: "lightGreen700", hex: "#689F38")
  public static let lightGreen800 = MaterialColor(name: "lightGreen800", hex: "#558B2F")
  public static let lightGreen900 = MaterialColor(name: "lightGreen900", hex: "#33691E")
  public static let lightGreenA100 = MaterialColor(name: "lightGreenA100", hex: "#CCFF90")
  public static let lightGreenA200 = MaterialColor(name: "lightGreenA200", hex: "#B2FF59")
  public static let lightGreenA400 = MaterialColor(name: "lightGreenA400", hex: "#76FF03")
  public static let lightGreenA700 = MaterialColor(name: "lightGreenA700", hex: "#64DD17")
  public static let lime50 = MaterialColor(name: "lime50", hex: "#F9FBE7")
  public static let lime100 = MaterialColor(name: "lime100", hex: "#F0F4C3")
  public static let lime200 = MaterialColor(name: "lime200", hex: "#E6EE9C")
  public static let lime300 = MaterialColor(name: "lime300", hex: "#DCE775")
  public static let lime400 = MaterialColor(name: "lime400", hex: "#D4E157")
  public static let lime500 = MaterialColor(name: "lime500", hex: "#CDDC39")
  public static let lime600 = MaterialColor(name: "lime600", hex: "#C0CA33")
  public static let lime700 = MaterialColor(name: "lime700", hex: "#AFB42B")
  public static let lime800 = MaterialColor(name: "lime800", hex: "#9E9D24")
  public static let lime900 = MaterialColor(name: "lime900", hex: "#827717")
  public static let limeA100 = MaterialColor(name: "limeA100", hex: "#F4FF81")
  public static let limeA200 = MaterialColor(name: "limeA200", hex: "#EEFF41")
  public static let limeA400 = MaterialColor(name: "limeA400", hex: "#C6FF00")
  public static let limeA700 = MaterialColor(name: "limeA700", hex: "#AEEA00")
  public static let yellow50 = MaterialColor(name: "yellow50", hex: "#FFFDE7")
  public static let yellow100 = MaterialColor(name: "yellow100", hex: "#FFF9C4")
  public static let yellow200 = MaterialColor(name: "yellow200", hex: "#FFF59D")
  public static let yellow300 = MaterialColor(name: "yellow300", hex: "#FFF176")
  public static let yellow400 = MaterialColor(name: "yellow400", hex: "#FFEE58")
  public static let yellow500 = MaterialColor(name: "yellow500", hex: "#FFEB3B")
  public static let yellow600 = MaterialColor(name: "yellow600", hex: "#FDD835")
  public static let yellow700 = MaterialColor(name: "yellow700", hex: "#FBC02D")
  public static let yellow800 = MaterialColor(name: "yellow800", hex: "#F9A825")
  public static let yellow900 = MaterialColor(name: "yellow900", hex: "#F57F17")
  public static let yellowA100 = MaterialColor(name: "yellowA100", hex: "#FFFF8D")
  public static let yellowA200 = MaterialColor(name: "yellowA200", hex: "#FFFF00")
  public static let yellowA400 = MaterialColor(name: "yellowA400", hex: "#FFEA00")
  public static let yellowA700 = MaterialColor(name: "yellowA700", hex: "#FFD600")
  public static let amber50 = MaterialColor(name: "amber50", hex: "#FFF8E1")
  public static let amber100 = MaterialColor(name: "amber100", hex: "#FFECB3")
  public static let amber200 = MaterialColor(name: "amber200", hex: "#FFE082")
  public static let amber300 = MaterialColor(name: "amber300", hex: "#FFD54F")
  public static let amber400 = MaterialColor(name: "amber400", hex: "#FFCA28")
  public static let amber500 = MaterialColor(name: "amber500", hex: "#FFC107")
  public static let amber600 = MaterialColor(name: "amber600", hex: "#FFB300")
  public static let amber700 = MaterialColor(name: "amber700", hex: "#FFA000")
  public static let amber800 = MaterialColor(name: "amber800", hex: "#FF8F00")
  public static let amber900 = MaterialColor(name: "amber900", hex: "#FF6F00")
  public static let amberA100 = MaterialColor(name: "amberA100", hex: "#FFE57F")
  public static let amberA200 = MaterialColor(name: "amberA200", hex: "#FFD740")
  public static let amberA400 = MaterialColor(name: "amberA400", hex: "#FFC400")
  public static let amberA700 = MaterialColor(name: "amberA700", hex: "#FFAB00")
  public static let orange50 = MaterialColor(name: "orange50", hex: "#FFF3E0")
  public static let orange100 = MaterialColor(name: "orange100", hex: "#FFE0B2")
  public static let orange200 = MaterialColor(name: "orange200", hex: "#FFCC80")
  public static let orange300 = MaterialColor(name: "orange300", hex: "#FFB74D")
  public static let orange400 = MaterialColor(name: "orange400", hex: "#FFA726")
  public static let orange500 = MaterialColor(name: "orange500", hex: "#FF9800")
  public static let orange600 = MaterialColor(name: "orange600", hex: "#FB8C00")
  public static let orange700 = MaterialColor(name: "orange700", hex: "#F57C00")
  public static let orange800 = MaterialColor(name: "orange800", hex: "#EF6C00")
  public static let orange900 = MaterialColor(name: "orange900", hex: "#E65100")
  public static let orangeA100 = MaterialColor(name: "orangeA100", hex: "#FFD180")
  public static let orangeA200 = MaterialColor(name: "orangeA200", hex: "#FFAB40")
  public static let orangeA400 = MaterialColor(name: "orangeA400", hex: "#FF9100")
  public static let orangeA700 = MaterialColor(name: "orangeA700", hex: "#FF6D00")
  public static let deepOrange50 = MaterialColor(name: "deepOrange50", hex: "#FBE9E7")
  public static let deepOrange100 = MaterialColor(name: "deepOrange100", hex: "#FFCCBC")
  public static let deepOrange200 = MaterialColor(name: "deepOrange200", hex: "#FFAB91")
  public static let deepOrange300 = MaterialColor(name: "deepOrange300", hex: "#FF8A65")
  public static let deepOrange400 = MaterialColor(name: "deepOrange400", hex: "#FF7043")
  public static let deepOrange500 = MaterialColor(name: "deepOrange500", hex: "#FF5722")
  public static let deepOrange600 = MaterialColor(name: "deepOrange600", hex: "#F4511E")
  public static let deepOrange700 = MaterialColor(name: "deepOrange700", hex: "#E64A19")
  public static let deepOrange800 = MaterialColor(name: "deepOrange800", hex: "#D84315")
  public static let deepOrange900 = MaterialColor(name: "deepOrange900", hex: "#BF360C")
  public static let deepOrangeA100 = MaterialColor(name: "deepOrangeA100", hex: "#FF9E80")
  public static let deepOrangeA200 = MaterialColor(name: "deepOrangeA200", hex: "#FF6E40")
  public static let deepOrangeA400 = MaterialColor(name: "deepOrangeA400", hex: "#FF3D00")
  public static let deepOrangeA700 = MaterialColor(name: "deepOrangeA700", hex: "#DD2C00")
  public static let brown50 = MaterialColor(name: "brown50", hex: "#EFEBE9")
  public static let brown100 = MaterialColor(name: "brown100", hex: "#D7CCC8")
  public static let brown200 = MaterialColor(name: "brown200", hex: "#BCAAA4")
  public static let brown300 = MaterialColor(name: "brown300", hex: "#A1887F")
  public static let brown400 = MaterialColor(name: "brown400", hex: "#8D6E63")
  public static let brown500 = MaterialColor(name: "brown500", hex: "#795548")
  public static let brown600 = MaterialColor(name: "brown600", hex: "#6D4C41")
  public static let brown700 = MaterialColor(name: "brown700", hex: "#5D4037")
  public static let brown800 = MaterialColor(name: "brown800", hex: "#4E342E")
  public static let brown900 = MaterialColor(name: "brown900", hex: "#3E2723")
  public static let grey50 = MaterialColor(name: "grey50", hex: "#FAFAFA")
  public static let grey100 = MaterialColor(name: "grey100", hex: "#F5F5F5")
  public static let grey200 = MaterialColor(name: "grey200", hex: "#EEEEEE")
  public static let grey300 = MaterialColor(name: "grey300", hex: "#E0E0E0")
  public static let grey400 = MaterialColor(name: "grey400", hex: "#BDBDBD")
  public static let grey500 = MaterialColor(name: "grey500", hex: "#9E9E9E")
  public static let grey600 = MaterialColor(name: "grey600", hex: "#757575")
  public static let grey700 = MaterialColor(name: "grey700", hex: "#616161")
  public static let grey800 = MaterialColor(name: "grey800", hex: "#424242")
  public static let grey900 = MaterialColor(name: "grey900", hex: "#212121")
  public static let blueGrey50 = MaterialColor(name: "blueGrey50", hex: "#ECEFF1")
  public static let blueGrey100 = MaterialColor(name: "blueGrey100", hex: "#CFD8DC")
  public static let blueGrey200 = MaterialColor(name: "blueGrey200", hex: "#B0BEC5")
  public static let blueGrey300 = MaterialColor(name: "blueGrey300", hex: "#90A4AE")
  public static let blueGrey400 = MaterialColor(name: "blueGrey400", hex: "#78909C")
  public static let blueGrey500 = MaterialColor(name: "blueGrey500", hex: "#607D8B")
  public static let blueGrey600 = MaterialColor(name: "blueGrey600", hex: "#546E7A")
  public static let blueGrey700 = MaterialColor(name: "blueGrey700", hex: "#455A64")
  public static let blueGrey800 = MaterialColor(name: "blueGrey800", hex: "#37474F")
  public static let blueGrey900 = MaterialColor(name: "blueGrey900", hex: "#263238")

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
      return MaterialColor(name: "sourceColor", hex: "#6750A4")
    case .fidelity:
      return MaterialColor(name: "sourceColor", hex: "#6750A4")
    case .content:
      return MaterialColor(name: "sourceColor", hex: "#6750A4")
    case .monochrome:
      return MaterialColor(name: "sourceColor", hex: "#6750A4")
    case .neutral:
      return MaterialColor(name: "sourceColor", hex: "#6750A4")
    case .vibrant:
      return MaterialColor(name: "sourceColor", hex: "#6750A4")
    case .expressive:
      return MaterialColor(name: "sourceColor", hex: "#6750A4")
    case .rainbow:
      return MaterialColor(name: "sourceColor", hex: "#6750A4")
    case .fruitSalad:
      return MaterialColor(name: "sourceColor", hex: "#6750A4")
    }
  }

  public var keyColors: MaterialThemeKeyColors {
    switch self {
    case .tonalSpot:
      return MaterialThemeKeyColors(
        primary: MaterialColor(name: "primary", hex: "#7E6EA9"),
        secondary: MaterialColor(name: "secondary", hex: "#7B748A"),
        tertiary: MaterialColor(name: "tertiary", hex: "#996A79"),
        neutral: MaterialColor(name: "neutral", hex: "#7A767D"),
        neutralVariant: MaterialColor(name: "neutralVariant", hex: "#7A757F")
      )
    case .fidelity:
      return MaterialThemeKeyColors(
        primary: MaterialColor(name: "primary", hex: "#8069BF"),
        secondary: MaterialColor(name: "secondary", hex: "#7C7296"),
        tertiary: MaterialColor(name: "tertiary", hex: "#C9A74D"),
        neutral: MaterialColor(name: "neutral", hex: "#7A767D"),
        neutralVariant: MaterialColor(name: "neutralVariant", hex: "#7A7582")
      )
    case .content:
      return MaterialThemeKeyColors(
        primary: MaterialColor(name: "primary", hex: "#8069BF"),
        secondary: MaterialColor(name: "secondary", hex: "#7C7296"),
        tertiary: MaterialColor(name: "tertiary", hex: "#924274"),
        neutral: MaterialColor(name: "neutral", hex: "#7A767D"),
        neutralVariant: MaterialColor(name: "neutralVariant", hex: "#7A7582")
      )
    case .monochrome:
      return MaterialThemeKeyColors(
        primary: MaterialColor(name: "primary", hex: "#777777"),
        secondary: MaterialColor(name: "secondary", hex: "#777777"),
        tertiary: MaterialColor(name: "tertiary", hex: "#777777"),
        neutral: MaterialColor(name: "neutral", hex: "#777777"),
        neutralVariant: MaterialColor(name: "neutralVariant", hex: "#777777")
      )
    case .neutral:
      return MaterialThemeKeyColors(
        primary: MaterialColor(name: "primary", hex: "#7A7484"),
        secondary: MaterialColor(name: "secondary", hex: "#7A757F"),
        tertiary: MaterialColor(name: "tertiary", hex: "#7B748A"),
        neutral: MaterialColor(name: "neutral", hex: "#797678"),
        neutralVariant: MaterialColor(name: "neutralVariant", hex: "#797678")
      )
    case .vibrant:
      return MaterialThemeKeyColors(
        primary: MaterialColor(name: "primary", hex: "#6C0BFF"),
        secondary: MaterialColor(name: "secondary", hex: "#856F92"),
        tertiary: MaterialColor(name: "tertiary", hex: "#946994"),
        neutral: MaterialColor(name: "neutral", hex: "#7A7582"),
        neutralVariant: MaterialColor(name: "neutralVariant", hex: "#7A7484")
      )
    case .expressive:
      return MaterialThemeKeyColors(
        primary: MaterialColor(name: "primary", hex: "#1B8672"),
        secondary: MaterialColor(name: "secondary", hex: "#936B83"),
        tertiary: MaterialColor(name: "tertiary", hex: "#8D6B9B"),
        neutral: MaterialColor(name: "neutral", hex: "#7C757E"),
        neutralVariant: MaterialColor(name: "neutralVariant", hex: "#7E7382")
      )
    case .rainbow:
      return MaterialThemeKeyColors(
        primary: MaterialColor(name: "primary", hex: "#8069BF"),
        secondary: MaterialColor(name: "secondary", hex: "#7B748A"),
        tertiary: MaterialColor(name: "tertiary", hex: "#996A79"),
        neutral: MaterialColor(name: "neutral", hex: "#777777"),
        neutralVariant: MaterialColor(name: "neutralVariant", hex: "#777777")
      )
    case .fruitSalad:
      return MaterialThemeKeyColors(
        primary: MaterialColor(name: "primary", hex: "#247CBB"),
        secondary: MaterialColor(name: "secondary", hex: "#4B7BA7"),
        tertiary: MaterialColor(name: "tertiary", hex: "#7E6EA9"),
        neutral: MaterialColor(name: "neutral", hex: "#7A7582"),
        neutralVariant: MaterialColor(name: "neutralVariant", hex: "#7B748A")
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

  public func overriding(_ overrides: [MaterialColorRole: String]) -> MaterialColorScheme {
    MaterialColorScheme(
      appearance: appearance,
      primary: overrides[.primary].map { MaterialColor(role: .primary, hex: $0) } ?? primary,
      onPrimary: overrides[.onPrimary].map { MaterialColor(role: .onPrimary, hex: $0) } ?? onPrimary,
      primaryContainer: overrides[.primaryContainer].map { MaterialColor(role: .primaryContainer, hex: $0) } ?? primaryContainer,
      onPrimaryContainer: overrides[.onPrimaryContainer].map { MaterialColor(role: .onPrimaryContainer, hex: $0) } ?? onPrimaryContainer,
      inversePrimary: overrides[.inversePrimary].map { MaterialColor(role: .inversePrimary, hex: $0) } ?? inversePrimary,
      secondary: overrides[.secondary].map { MaterialColor(role: .secondary, hex: $0) } ?? secondary,
      onSecondary: overrides[.onSecondary].map { MaterialColor(role: .onSecondary, hex: $0) } ?? onSecondary,
      secondaryContainer: overrides[.secondaryContainer].map { MaterialColor(role: .secondaryContainer, hex: $0) } ?? secondaryContainer,
      onSecondaryContainer: overrides[.onSecondaryContainer].map { MaterialColor(role: .onSecondaryContainer, hex: $0) } ?? onSecondaryContainer,
      tertiary: overrides[.tertiary].map { MaterialColor(role: .tertiary, hex: $0) } ?? tertiary,
      onTertiary: overrides[.onTertiary].map { MaterialColor(role: .onTertiary, hex: $0) } ?? onTertiary,
      tertiaryContainer: overrides[.tertiaryContainer].map { MaterialColor(role: .tertiaryContainer, hex: $0) } ?? tertiaryContainer,
      onTertiaryContainer: overrides[.onTertiaryContainer].map { MaterialColor(role: .onTertiaryContainer, hex: $0) } ?? onTertiaryContainer,
      background: overrides[.background].map { MaterialColor(role: .background, hex: $0) } ?? background,
      onBackground: overrides[.onBackground].map { MaterialColor(role: .onBackground, hex: $0) } ?? onBackground,
      surface: overrides[.surface].map { MaterialColor(role: .surface, hex: $0) } ?? surface,
      onSurface: overrides[.onSurface].map { MaterialColor(role: .onSurface, hex: $0) } ?? onSurface,
      surfaceVariant: overrides[.surfaceVariant].map { MaterialColor(role: .surfaceVariant, hex: $0) } ?? surfaceVariant,
      onSurfaceVariant: overrides[.onSurfaceVariant].map { MaterialColor(role: .onSurfaceVariant, hex: $0) } ?? onSurfaceVariant,
      surfaceTint: overrides[.surfaceTint].map { MaterialColor(role: .surfaceTint, hex: $0) } ?? surfaceTint,
      inverseSurface: overrides[.inverseSurface].map { MaterialColor(role: .inverseSurface, hex: $0) } ?? inverseSurface,
      inverseOnSurface: overrides[.inverseOnSurface].map { MaterialColor(role: .inverseOnSurface, hex: $0) } ?? inverseOnSurface,
      error: overrides[.error].map { MaterialColor(role: .error, hex: $0) } ?? error,
      onError: overrides[.onError].map { MaterialColor(role: .onError, hex: $0) } ?? onError,
      errorContainer: overrides[.errorContainer].map { MaterialColor(role: .errorContainer, hex: $0) } ?? errorContainer,
      onErrorContainer: overrides[.onErrorContainer].map { MaterialColor(role: .onErrorContainer, hex: $0) } ?? onErrorContainer,
      outline: overrides[.outline].map { MaterialColor(role: .outline, hex: $0) } ?? outline,
      outlineVariant: overrides[.outlineVariant].map { MaterialColor(role: .outlineVariant, hex: $0) } ?? outlineVariant,
      scrim: overrides[.scrim].map { MaterialColor(role: .scrim, hex: $0) } ?? scrim,
      surfaceBright: overrides[.surfaceBright].map { MaterialColor(role: .surfaceBright, hex: $0) } ?? surfaceBright,
      surfaceContainer: overrides[.surfaceContainer].map { MaterialColor(role: .surfaceContainer, hex: $0) } ?? surfaceContainer,
      surfaceContainerHigh: overrides[.surfaceContainerHigh].map { MaterialColor(role: .surfaceContainerHigh, hex: $0) } ?? surfaceContainerHigh,
      surfaceContainerHighest: overrides[.surfaceContainerHighest].map { MaterialColor(role: .surfaceContainerHighest, hex: $0) } ?? surfaceContainerHighest,
      surfaceContainerLow: overrides[.surfaceContainerLow].map { MaterialColor(role: .surfaceContainerLow, hex: $0) } ?? surfaceContainerLow,
      surfaceContainerLowest: overrides[.surfaceContainerLowest].map { MaterialColor(role: .surfaceContainerLowest, hex: $0) } ?? surfaceContainerLowest,
      surfaceDim: overrides[.surfaceDim].map { MaterialColor(role: .surfaceDim, hex: $0) } ?? surfaceDim,
      primaryFixed: overrides[.primaryFixed].map { MaterialColor(role: .primaryFixed, hex: $0) } ?? primaryFixed,
      primaryFixedDim: overrides[.primaryFixedDim].map { MaterialColor(role: .primaryFixedDim, hex: $0) } ?? primaryFixedDim,
      onPrimaryFixed: overrides[.onPrimaryFixed].map { MaterialColor(role: .onPrimaryFixed, hex: $0) } ?? onPrimaryFixed,
      onPrimaryFixedVariant: overrides[.onPrimaryFixedVariant].map { MaterialColor(role: .onPrimaryFixedVariant, hex: $0) } ?? onPrimaryFixedVariant,
      secondaryFixed: overrides[.secondaryFixed].map { MaterialColor(role: .secondaryFixed, hex: $0) } ?? secondaryFixed,
      secondaryFixedDim: overrides[.secondaryFixedDim].map { MaterialColor(role: .secondaryFixedDim, hex: $0) } ?? secondaryFixedDim,
      onSecondaryFixed: overrides[.onSecondaryFixed].map { MaterialColor(role: .onSecondaryFixed, hex: $0) } ?? onSecondaryFixed,
      onSecondaryFixedVariant: overrides[.onSecondaryFixedVariant].map { MaterialColor(role: .onSecondaryFixedVariant, hex: $0) } ?? onSecondaryFixedVariant,
      tertiaryFixed: overrides[.tertiaryFixed].map { MaterialColor(role: .tertiaryFixed, hex: $0) } ?? tertiaryFixed,
      tertiaryFixedDim: overrides[.tertiaryFixedDim].map { MaterialColor(role: .tertiaryFixedDim, hex: $0) } ?? tertiaryFixedDim,
      onTertiaryFixed: overrides[.onTertiaryFixed].map { MaterialColor(role: .onTertiaryFixed, hex: $0) } ?? onTertiaryFixed,
      onTertiaryFixedVariant: overrides[.onTertiaryFixedVariant].map { MaterialColor(role: .onTertiaryFixedVariant, hex: $0) } ?? onTertiaryFixedVariant
    )
  }

  private static func color(_ role: MaterialColorRole, in roles: [MaterialColorRole: String]) -> MaterialColor {
    guard let hex = roles[role] else {
      preconditionFailure("Missing Material color role \(role.rawValue)")
    }

    return MaterialColor(role: role, hex: hex)
  }

  public static func custom(appearance: MaterialAppearance, roles: [MaterialColorRole: String]) throws -> MaterialColorScheme {
    let missingRoles = MaterialColorRole.allCases.filter { roles[$0] == nil }

    guard missingRoles.isEmpty else {
      throw MaterialColorSchemeError.missingRoles(missingRoles)
    }

    return MaterialColorScheme(
      appearance: appearance,
      primary: color(.primary, in: roles),
      onPrimary: color(.onPrimary, in: roles),
      primaryContainer: color(.primaryContainer, in: roles),
      onPrimaryContainer: color(.onPrimaryContainer, in: roles),
      inversePrimary: color(.inversePrimary, in: roles),
      secondary: color(.secondary, in: roles),
      onSecondary: color(.onSecondary, in: roles),
      secondaryContainer: color(.secondaryContainer, in: roles),
      onSecondaryContainer: color(.onSecondaryContainer, in: roles),
      tertiary: color(.tertiary, in: roles),
      onTertiary: color(.onTertiary, in: roles),
      tertiaryContainer: color(.tertiaryContainer, in: roles),
      onTertiaryContainer: color(.onTertiaryContainer, in: roles),
      background: color(.background, in: roles),
      onBackground: color(.onBackground, in: roles),
      surface: color(.surface, in: roles),
      onSurface: color(.onSurface, in: roles),
      surfaceVariant: color(.surfaceVariant, in: roles),
      onSurfaceVariant: color(.onSurfaceVariant, in: roles),
      surfaceTint: color(.surfaceTint, in: roles),
      inverseSurface: color(.inverseSurface, in: roles),
      inverseOnSurface: color(.inverseOnSurface, in: roles),
      error: color(.error, in: roles),
      onError: color(.onError, in: roles),
      errorContainer: color(.errorContainer, in: roles),
      onErrorContainer: color(.onErrorContainer, in: roles),
      outline: color(.outline, in: roles),
      outlineVariant: color(.outlineVariant, in: roles),
      scrim: color(.scrim, in: roles),
      surfaceBright: color(.surfaceBright, in: roles),
      surfaceContainer: color(.surfaceContainer, in: roles),
      surfaceContainerHigh: color(.surfaceContainerHigh, in: roles),
      surfaceContainerHighest: color(.surfaceContainerHighest, in: roles),
      surfaceContainerLow: color(.surfaceContainerLow, in: roles),
      surfaceContainerLowest: color(.surfaceContainerLowest, in: roles),
      surfaceDim: color(.surfaceDim, in: roles),
      primaryFixed: color(.primaryFixed, in: roles),
      primaryFixedDim: color(.primaryFixedDim, in: roles),
      onPrimaryFixed: color(.onPrimaryFixed, in: roles),
      onPrimaryFixedVariant: color(.onPrimaryFixedVariant, in: roles),
      secondaryFixed: color(.secondaryFixed, in: roles),
      secondaryFixedDim: color(.secondaryFixedDim, in: roles),
      onSecondaryFixed: color(.onSecondaryFixed, in: roles),
      onSecondaryFixedVariant: color(.onSecondaryFixedVariant, in: roles),
      tertiaryFixed: color(.tertiaryFixed, in: roles),
      tertiaryFixedDim: color(.tertiaryFixedDim, in: roles),
      onTertiaryFixed: color(.onTertiaryFixed, in: roles),
      onTertiaryFixedVariant: color(.onTertiaryFixedVariant, in: roles)
    )
  }

  public static func custom(
    base: MaterialThemePreset = .tonalSpot,
    appearance: MaterialAppearance,
    overrides: [MaterialColorRole: String]
  ) -> MaterialColorScheme {
    preset(base, appearance: appearance).overriding(overrides)
  }

  public static let tonalSpotLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(name: "primary", hex: "#65558F"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#E9DDFF"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#4D3D75"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#CFBDFE"),
    secondary: MaterialColor(name: "secondary", hex: "#625B71"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#E8DEF8"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#4A4458"),
    tertiary: MaterialColor(name: "tertiary", hex: "#7E5260"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#FFD9E3"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#633B48"),
    background: MaterialColor(name: "background", hex: "#FDF7FF"),
    onBackground: MaterialColor(name: "onBackground", hex: "#1D1B20"),
    surface: MaterialColor(name: "surface", hex: "#FDF7FF"),
    onSurface: MaterialColor(name: "onSurface", hex: "#1D1B20"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#E7E0EB"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#49454E"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#65558F"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#322F35"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#F5EFF7"),
    error: MaterialColor(name: "error", hex: "#BA1A1A"),
    onError: MaterialColor(name: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(name: "outline", hex: "#7A757F"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#CAC4CF"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#FDF7FF"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#F2ECF4"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#ECE6EE"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#E6E0E9"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#F8F2FA"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#DED8E0"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CFBDFE"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#201047"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#4D3D75"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#E8DEF8"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#CBC2DB"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1E192B"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#4A4458"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#FFD9E3"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#EFB8C8"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#31101D"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#633B48")
  )

  public static let tonalSpotDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(name: "primary", hex: "#CFBDFE"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#36275D"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#4D3D75"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#E9DDFF"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#65558F"),
    secondary: MaterialColor(name: "secondary", hex: "#CBC2DB"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#332D41"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#4A4458"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#E8DEF8"),
    tertiary: MaterialColor(name: "tertiary", hex: "#EFB8C8"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#4A2532"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#633B48"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#FFD9E3"),
    background: MaterialColor(name: "background", hex: "#141218"),
    onBackground: MaterialColor(name: "onBackground", hex: "#E6E0E9"),
    surface: MaterialColor(name: "surface", hex: "#141218"),
    onSurface: MaterialColor(name: "onSurface", hex: "#E6E0E9"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#49454E"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#CAC4CF"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#CFBDFE"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#E6E0E9"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#322F35"),
    error: MaterialColor(name: "error", hex: "#FFB4AB"),
    onError: MaterialColor(name: "onError", hex: "#690005"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(name: "outline", hex: "#948F99"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#49454E"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#3B383E"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#211F24"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#2B292F"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#36343A"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#1D1B20"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#0F0D13"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#141218"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CFBDFE"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#201047"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#4D3D75"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#E8DEF8"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#CBC2DB"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1E192B"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#4A4458"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#FFD9E3"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#EFB8C8"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#31101D"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#633B48")
  )

  public static let fidelityLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(name: "primary", hex: "#4F378A"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#6750A4"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#E0D2FF"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#CFBCFF"),
    secondary: MaterialColor(name: "secondary", hex: "#63597C"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#E1D4FD"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#645A7D"),
    tertiary: MaterialColor(name: "tertiary", hex: "#765B00"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#C9A74D"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#503D00"),
    background: MaterialColor(name: "background", hex: "#FDF7FF"),
    onBackground: MaterialColor(name: "onBackground", hex: "#1D1B20"),
    surface: MaterialColor(name: "surface", hex: "#FDF7FF"),
    onSurface: MaterialColor(name: "onSurface", hex: "#1D1B20"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#E7E0EE"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#494551"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#6750A4"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#322F35"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#F5EFF7"),
    error: MaterialColor(name: "error", hex: "#BA1A1A"),
    onError: MaterialColor(name: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(name: "outline", hex: "#7A7582"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#CBC4D2"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#FDF7FF"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#F2ECF4"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#ECE6EE"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#E6E0E9"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#F8F2FA"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#DED8E0"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#E9DDFF"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#CDC0E9"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1F1635"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#4B4263"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#FFDF93"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#E7C365"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#241A00"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#594400")
  )

  public static let fidelityDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(name: "primary", hex: "#CFBCFF"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#381E72"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#6750A4"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#E0D2FF"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#6750A4"),
    secondary: MaterialColor(name: "secondary", hex: "#CDC0E9"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#342B4B"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#4D4465"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#BFB2DA"),
    tertiary: MaterialColor(name: "tertiary", hex: "#E7C365"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#3E2E00"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#C9A74D"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#503D00"),
    background: MaterialColor(name: "background", hex: "#141218"),
    onBackground: MaterialColor(name: "onBackground", hex: "#E6E0E9"),
    surface: MaterialColor(name: "surface", hex: "#141218"),
    onSurface: MaterialColor(name: "onSurface", hex: "#E6E0E9"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#494551"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#CBC4D2"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#CFBCFF"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#E6E0E9"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#322F35"),
    error: MaterialColor(name: "error", hex: "#FFB4AB"),
    onError: MaterialColor(name: "onError", hex: "#690005"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(name: "outline", hex: "#948E9C"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#494551"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#3B383E"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#211F24"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#2B292F"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#36343A"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#1D1B20"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#0F0D13"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#141218"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#E9DDFF"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#CDC0E9"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1F1635"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#4B4263"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#FFDF93"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#E7C365"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#241A00"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#594400")
  )

  public static let contentLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(name: "primary", hex: "#4F378A"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#6750A4"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#E0D2FF"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#CFBCFF"),
    secondary: MaterialColor(name: "secondary", hex: "#63597C"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#E1D4FD"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#645A7D"),
    tertiary: MaterialColor(name: "tertiary", hex: "#762A5B"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#924274"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#FFCAE5"),
    background: MaterialColor(name: "background", hex: "#FDF7FF"),
    onBackground: MaterialColor(name: "onBackground", hex: "#1D1B20"),
    surface: MaterialColor(name: "surface", hex: "#FDF7FF"),
    onSurface: MaterialColor(name: "onSurface", hex: "#1D1B20"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#E7E0EE"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#494551"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#6750A4"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#322F35"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#F5EFF7"),
    error: MaterialColor(name: "error", hex: "#BA1A1A"),
    onError: MaterialColor(name: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(name: "outline", hex: "#7A7582"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#CBC4D2"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#FDF7FF"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#F2ECF4"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#ECE6EE"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#E6E0E9"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#F8F2FA"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#DED8E0"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#E9DDFF"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#CDC0E9"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1F1635"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#4B4263"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#FFD8EA"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#FFAEDB"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#3C002B"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#752A5B")
  )

  public static let contentDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(name: "primary", hex: "#CFBCFF"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#381E72"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#6750A4"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#E0D2FF"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#6750A4"),
    secondary: MaterialColor(name: "secondary", hex: "#CDC0E9"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#342B4B"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#4D4465"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#BFB2DA"),
    tertiary: MaterialColor(name: "tertiary", hex: "#FFAEDB"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#5A1243"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#924274"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#FFCAE5"),
    background: MaterialColor(name: "background", hex: "#141218"),
    onBackground: MaterialColor(name: "onBackground", hex: "#E6E0E9"),
    surface: MaterialColor(name: "surface", hex: "#141218"),
    onSurface: MaterialColor(name: "onSurface", hex: "#E6E0E9"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#494551"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#CBC4D2"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#CFBCFF"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#E6E0E9"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#322F35"),
    error: MaterialColor(name: "error", hex: "#FFB4AB"),
    onError: MaterialColor(name: "onError", hex: "#690005"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(name: "outline", hex: "#948E9C"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#494551"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#3B383E"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#211F24"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#2B292F"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#36343A"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#1D1B20"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#0F0D13"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#141218"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#E9DDFF"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#CDC0E9"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1F1635"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#4B4263"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#FFD8EA"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#FFAEDB"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#3C002B"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#752A5B")
  )

  public static let monochromeLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(name: "primary", hex: "#000000"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#E2E2E2"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#3B3B3B"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#FFFFFF"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#C6C6C6"),
    secondary: MaterialColor(name: "secondary", hex: "#5E5E5E"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#D4D4D4"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#1B1B1B"),
    tertiary: MaterialColor(name: "tertiary", hex: "#3B3B3B"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#E2E2E2"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#747474"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#FFFFFF"),
    background: MaterialColor(name: "background", hex: "#F9F9F9"),
    onBackground: MaterialColor(name: "onBackground", hex: "#1B1B1B"),
    surface: MaterialColor(name: "surface", hex: "#F9F9F9"),
    onSurface: MaterialColor(name: "onSurface", hex: "#1B1B1B"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#E2E2E2"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#474747"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#5E5E5E"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#303030"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#F1F1F1"),
    error: MaterialColor(name: "error", hex: "#BA1A1A"),
    onError: MaterialColor(name: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#410002"),
    outline: MaterialColor(name: "outline", hex: "#777777"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#C6C6C6"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#F9F9F9"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#EEEEEE"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#E8E8E8"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#E2E2E2"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#F3F3F3"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#DADADA"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#5E5E5E"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#474747"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#FFFFFF"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#E2E2E2"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#C6C6C6"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#ABABAB"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1B1B1B"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#3B3B3B"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#5E5E5E"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#474747"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#FFFFFF"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#E2E2E2")
  )

  public static let monochromeDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(name: "primary", hex: "#FFFFFF"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#1B1B1B"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#D4D4D4"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#000000"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#5E5E5E"),
    secondary: MaterialColor(name: "secondary", hex: "#C6C6C6"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#1B1B1B"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#474747"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#E2E2E2"),
    tertiary: MaterialColor(name: "tertiary", hex: "#E2E2E2"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#1B1B1B"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#919191"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#000000"),
    background: MaterialColor(name: "background", hex: "#131313"),
    onBackground: MaterialColor(name: "onBackground", hex: "#E2E2E2"),
    surface: MaterialColor(name: "surface", hex: "#131313"),
    onSurface: MaterialColor(name: "onSurface", hex: "#E2E2E2"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#474747"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#C6C6C6"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#C6C6C6"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#E2E2E2"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#303030"),
    error: MaterialColor(name: "error", hex: "#FFB4AB"),
    onError: MaterialColor(name: "onError", hex: "#690005"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(name: "outline", hex: "#919191"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#474747"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#393939"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#1F1F1F"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#2A2A2A"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#353535"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#1B1B1B"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#0E0E0E"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#131313"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#5E5E5E"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#474747"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#FFFFFF"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#E2E2E2"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#C6C6C6"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#ABABAB"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1B1B1B"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#3B3B3B"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#5E5E5E"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#474747"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#FFFFFF"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#E2E2E2")
  )

  public static let neutralLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(name: "primary", hex: "#615C6B"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#E7DFF2"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#494453"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#CBC3D5"),
    secondary: MaterialColor(name: "secondary", hex: "#615D66"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#E7E0EB"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#49454E"),
    tertiary: MaterialColor(name: "tertiary", hex: "#625B71"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#E8DEF8"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#4A4458"),
    background: MaterialColor(name: "background", hex: "#FDF8FA"),
    onBackground: MaterialColor(name: "onBackground", hex: "#1C1B1D"),
    surface: MaterialColor(name: "surface", hex: "#FDF8FA"),
    onSurface: MaterialColor(name: "onSurface", hex: "#1C1B1D"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#E6E1E3"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#484648"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#615C6B"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#313032"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#F4EFF1"),
    error: MaterialColor(name: "error", hex: "#BA1A1A"),
    onError: MaterialColor(name: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(name: "outline", hex: "#797678"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#C9C5C7"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#FDF8FA"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#F1EDEE"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#EBE7E9"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#E6E1E3"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#F7F2F4"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#DDD9DB"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E7DFF2"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CBC3D5"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#1D1A26"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#494453"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#E7E0EB"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#CAC4CF"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1D1A22"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#49454E"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#E8DEF8"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#CBC2DB"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#1E192B"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#4A4458")
  )

  public static let neutralDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(name: "primary", hex: "#CBC3D5"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#322E3C"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#494453"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#E7DFF2"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#615C6B"),
    secondary: MaterialColor(name: "secondary", hex: "#CAC4CF"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#322F38"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#49454E"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#E7E0EB"),
    tertiary: MaterialColor(name: "tertiary", hex: "#CBC2DB"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#332D41"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#4A4458"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#E8DEF8"),
    background: MaterialColor(name: "background", hex: "#141314"),
    onBackground: MaterialColor(name: "onBackground", hex: "#E6E1E3"),
    surface: MaterialColor(name: "surface", hex: "#141314"),
    onSurface: MaterialColor(name: "onSurface", hex: "#E6E1E3"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#484648"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#C9C5C7"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#CBC3D5"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#E6E1E3"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#313032"),
    error: MaterialColor(name: "error", hex: "#FFB4AB"),
    onError: MaterialColor(name: "onError", hex: "#690005"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(name: "outline", hex: "#939092"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#484648"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#3A393A"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#201F21"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#2B292B"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#363436"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#1C1B1D"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#0F0E0F"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#141314"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E7DFF2"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CBC3D5"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#1D1A26"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#494453"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#E7E0EB"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#CAC4CF"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1D1A22"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#49454E"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#E8DEF8"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#CBC2DB"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#1E192B"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#4A4458")
  )

  public static let vibrantLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(name: "primary", hex: "#6F19FF"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#E9DDFF"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#5400CC"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#CFBCFF"),
    secondary: MaterialColor(name: "secondary", hex: "#6B5778"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#F3DAFF"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#523F5F"),
    tertiary: MaterialColor(name: "tertiary", hex: "#79507A"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#FFD6FC"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#5F3961"),
    background: MaterialColor(name: "background", hex: "#FDF7FF"),
    onBackground: MaterialColor(name: "onBackground", hex: "#1D1A24"),
    surface: MaterialColor(name: "surface", hex: "#FDF7FF"),
    onSurface: MaterialColor(name: "onSurface", hex: "#1D1A24"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#E7DFF2"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#494453"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#6F19FF"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#322F3A"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#F5EEFD"),
    error: MaterialColor(name: "error", hex: "#BA1A1A"),
    onError: MaterialColor(name: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(name: "outline", hex: "#7A7484"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#CBC3D5"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#FDF7FF"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#F2EBFA"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#EDE5F4"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#E7E0EF"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#F8F1FF"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#DED7E6"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#5400CC"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#F3DAFF"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#D7BEE4"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#251431"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#523F5F"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#FFD6FC"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#E8B7E7"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#2F0D33"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#5F3961")
  )

  public static let vibrantDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(name: "primary", hex: "#CFBCFF"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#3A0092"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#5400CC"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#E9DDFF"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#6F19FF"),
    secondary: MaterialColor(name: "secondary", hex: "#D7BEE4"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#3B2948"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#523F5F"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#F3DAFF"),
    tertiary: MaterialColor(name: "tertiary", hex: "#E8B7E7"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#462349"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#5F3961"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#FFD6FC"),
    background: MaterialColor(name: "background", hex: "#15121C"),
    onBackground: MaterialColor(name: "onBackground", hex: "#E7E0EF"),
    surface: MaterialColor(name: "surface", hex: "#15121C"),
    onSurface: MaterialColor(name: "onSurface", hex: "#E7E0EF"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#494453"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#CBC3D5"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#CFBCFF"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#E7E0EF"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#322F3A"),
    error: MaterialColor(name: "error", hex: "#FFB4AB"),
    onError: MaterialColor(name: "onError", hex: "#690005"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(name: "outline", hex: "#948E9F"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#494453"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#3B3743"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#211E28"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#2C2833"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#37333E"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#1D1A24"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#0F0D16"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#15121C"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#5400CC"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#F3DAFF"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#D7BEE4"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#251431"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#523F5F"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#FFD6FC"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#E8B7E7"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#2F0D33"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#5F3961")
  )

  public static let expressiveLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(name: "primary", hex: "#006B5A"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#95F4DC"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#005143"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#79D7C0"),
    secondary: MaterialColor(name: "secondary", hex: "#79536A"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#FFD8ED"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#5F3C52"),
    tertiary: MaterialColor(name: "tertiary", hex: "#735280"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#F7D8FF"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#593B67"),
    background: MaterialColor(name: "background", hex: "#FFF7FD"),
    onBackground: MaterialColor(name: "onBackground", hex: "#1F1A21"),
    surface: MaterialColor(name: "surface", hex: "#FFF7FD"),
    onSurface: MaterialColor(name: "onSurface", hex: "#1F1A21"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#ECDEF0"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#4D4351"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#006B5A"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#342E37"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#F8EDF9"),
    error: MaterialColor(name: "error", hex: "#BA1A1A"),
    onError: MaterialColor(name: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(name: "outline", hex: "#7E7383"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#CFC2D3"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#FFF7FD"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#F5EBF6"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#EFE5F0"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#EADFEA"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#FBF0FB"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#E1D7E2"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#95F4DC"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#79D7C0"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#00201A"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#005143"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#FFD8ED"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#E8B9D4"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#2E1125"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#5F3C52"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#F7D8FF"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#E0B9EE"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#2B0E39"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#593B67")
  )

  public static let expressiveDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(name: "primary", hex: "#79D7C0"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#00382E"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#005143"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#95F4DC"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#006B5A"),
    secondary: MaterialColor(name: "secondary", hex: "#E8B9D4"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#46263B"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#5F3C52"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#FFD8ED"),
    tertiary: MaterialColor(name: "tertiary", hex: "#E0B9EE"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#41244F"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#593B67"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#F7D8FF"),
    background: MaterialColor(name: "background", hex: "#161219"),
    onBackground: MaterialColor(name: "onBackground", hex: "#EADFEA"),
    surface: MaterialColor(name: "surface", hex: "#161219"),
    onSurface: MaterialColor(name: "onSurface", hex: "#EADFEA"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#4D4351"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#CFC2D3"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#79D7C0"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#EADFEA"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#342E37"),
    error: MaterialColor(name: "error", hex: "#FFB4AB"),
    onError: MaterialColor(name: "onError", hex: "#690005"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(name: "outline", hex: "#988D9D"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#4D4351"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#3D373F"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#231E25"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#2D2830"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#38333B"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#1F1A21"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#110D14"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#161219"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#95F4DC"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#79D7C0"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#00201A"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#005143"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#FFD8ED"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#E8B9D4"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#2E1125"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#5F3C52"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#F7D8FF"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#E0B9EE"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#2B0E39"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#593B67")
  )

  public static let rainbowLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(name: "primary", hex: "#6750A4"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#E9DDFF"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#4F378A"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#CFBCFF"),
    secondary: MaterialColor(name: "secondary", hex: "#625B71"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#E8DEF8"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#4A4458"),
    tertiary: MaterialColor(name: "tertiary", hex: "#7E5260"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#FFD9E3"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#633B48"),
    background: MaterialColor(name: "background", hex: "#F9F9F9"),
    onBackground: MaterialColor(name: "onBackground", hex: "#1B1B1B"),
    surface: MaterialColor(name: "surface", hex: "#F9F9F9"),
    onSurface: MaterialColor(name: "onSurface", hex: "#1B1B1B"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#E2E2E2"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#474747"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#6750A4"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#303030"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#F1F1F1"),
    error: MaterialColor(name: "error", hex: "#BA1A1A"),
    onError: MaterialColor(name: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(name: "outline", hex: "#777777"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#C6C6C6"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#F9F9F9"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#EEEEEE"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#E8E8E8"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#E2E2E2"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#F3F3F3"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#DADADA"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#E8DEF8"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#CBC2DB"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1E192B"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#4A4458"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#FFD9E3"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#EFB8C8"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#31101D"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#633B48")
  )

  public static let rainbowDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(name: "primary", hex: "#CFBCFF"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#381E72"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#4F378A"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#E9DDFF"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#6750A4"),
    secondary: MaterialColor(name: "secondary", hex: "#CBC2DB"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#332D41"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#4A4458"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#E8DEF8"),
    tertiary: MaterialColor(name: "tertiary", hex: "#EFB8C8"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#4A2532"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#633B48"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#FFD9E3"),
    background: MaterialColor(name: "background", hex: "#131313"),
    onBackground: MaterialColor(name: "onBackground", hex: "#E2E2E2"),
    surface: MaterialColor(name: "surface", hex: "#131313"),
    onSurface: MaterialColor(name: "onSurface", hex: "#E2E2E2"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#474747"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#C6C6C6"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#CFBCFF"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#E2E2E2"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#303030"),
    error: MaterialColor(name: "error", hex: "#FFB4AB"),
    onError: MaterialColor(name: "onError", hex: "#690005"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(name: "outline", hex: "#919191"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#474747"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#393939"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#1F1F1F"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#2A2A2A"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#353535"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#1B1B1B"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#0E0E0E"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#131313"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#E9DDFF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#CFBCFF"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#22005D"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#4F378A"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#E8DEF8"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#CBC2DB"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#1E192B"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#4A4458"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#FFD9E3"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#EFB8C8"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#31101D"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#633B48")
  )

  public static let fruitSaladLight = MaterialColorScheme(
    appearance: .light,
    primary: MaterialColor(name: "primary", hex: "#00639C"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#FFFFFF"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#CEE5FF"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#004A77"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#97CBFF"),
    secondary: MaterialColor(name: "secondary", hex: "#30628C"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#FFFFFF"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#CEE5FF"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#104A73"),
    tertiary: MaterialColor(name: "tertiary", hex: "#65558F"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#FFFFFF"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#E9DDFF"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#4D3D75"),
    background: MaterialColor(name: "background", hex: "#FDF7FF"),
    onBackground: MaterialColor(name: "onBackground", hex: "#1D1A24"),
    surface: MaterialColor(name: "surface", hex: "#FDF7FF"),
    onSurface: MaterialColor(name: "onSurface", hex: "#1D1A24"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#E8DEF8"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#4A4458"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#00639C"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#322F3A"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#F5EEFD"),
    error: MaterialColor(name: "error", hex: "#BA1A1A"),
    onError: MaterialColor(name: "onError", hex: "#FFFFFF"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#FFDAD6"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#93000A"),
    outline: MaterialColor(name: "outline", hex: "#7B748A"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#CBC2DB"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#FDF7FF"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#F2EBFA"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#EDE5F4"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#E7E0EF"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#F8F1FF"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#FFFFFF"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#DED7E6"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#CEE5FF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#97CBFF"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#001D33"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#004A77"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#CEE5FF"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#9CCBFB"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#001D33"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#104A73"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#E9DDFF"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#CFBDFE"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#201047"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#4D3D75")
  )

  public static let fruitSaladDark = MaterialColorScheme(
    appearance: .dark,
    primary: MaterialColor(name: "primary", hex: "#97CBFF"),
    onPrimary: MaterialColor(name: "onPrimary", hex: "#003354"),
    primaryContainer: MaterialColor(name: "primaryContainer", hex: "#004A77"),
    onPrimaryContainer: MaterialColor(name: "onPrimaryContainer", hex: "#CEE5FF"),
    inversePrimary: MaterialColor(name: "inversePrimary", hex: "#00639C"),
    secondary: MaterialColor(name: "secondary", hex: "#9CCBFB"),
    onSecondary: MaterialColor(name: "onSecondary", hex: "#003354"),
    secondaryContainer: MaterialColor(name: "secondaryContainer", hex: "#104A73"),
    onSecondaryContainer: MaterialColor(name: "onSecondaryContainer", hex: "#CEE5FF"),
    tertiary: MaterialColor(name: "tertiary", hex: "#CFBDFE"),
    onTertiary: MaterialColor(name: "onTertiary", hex: "#36275D"),
    tertiaryContainer: MaterialColor(name: "tertiaryContainer", hex: "#4D3D75"),
    onTertiaryContainer: MaterialColor(name: "onTertiaryContainer", hex: "#E9DDFF"),
    background: MaterialColor(name: "background", hex: "#15121C"),
    onBackground: MaterialColor(name: "onBackground", hex: "#E7E0EF"),
    surface: MaterialColor(name: "surface", hex: "#15121C"),
    onSurface: MaterialColor(name: "onSurface", hex: "#E7E0EF"),
    surfaceVariant: MaterialColor(name: "surfaceVariant", hex: "#4A4458"),
    onSurfaceVariant: MaterialColor(name: "onSurfaceVariant", hex: "#CBC2DB"),
    surfaceTint: MaterialColor(name: "surfaceTint", hex: "#97CBFF"),
    inverseSurface: MaterialColor(name: "inverseSurface", hex: "#E7E0EF"),
    inverseOnSurface: MaterialColor(name: "inverseOnSurface", hex: "#322F3A"),
    error: MaterialColor(name: "error", hex: "#FFB4AB"),
    onError: MaterialColor(name: "onError", hex: "#690005"),
    errorContainer: MaterialColor(name: "errorContainer", hex: "#93000A"),
    onErrorContainer: MaterialColor(name: "onErrorContainer", hex: "#FFDAD6"),
    outline: MaterialColor(name: "outline", hex: "#958DA4"),
    outlineVariant: MaterialColor(name: "outlineVariant", hex: "#4A4458"),
    scrim: MaterialColor(name: "scrim", hex: "#000000"),
    surfaceBright: MaterialColor(name: "surfaceBright", hex: "#3B3743"),
    surfaceContainer: MaterialColor(name: "surfaceContainer", hex: "#211E28"),
    surfaceContainerHigh: MaterialColor(name: "surfaceContainerHigh", hex: "#2C2833"),
    surfaceContainerHighest: MaterialColor(name: "surfaceContainerHighest", hex: "#37333E"),
    surfaceContainerLow: MaterialColor(name: "surfaceContainerLow", hex: "#1D1A24"),
    surfaceContainerLowest: MaterialColor(name: "surfaceContainerLowest", hex: "#0F0D16"),
    surfaceDim: MaterialColor(name: "surfaceDim", hex: "#15121C"),
    primaryFixed: MaterialColor(name: "primaryFixed", hex: "#CEE5FF"),
    primaryFixedDim: MaterialColor(name: "primaryFixedDim", hex: "#97CBFF"),
    onPrimaryFixed: MaterialColor(name: "onPrimaryFixed", hex: "#001D33"),
    onPrimaryFixedVariant: MaterialColor(name: "onPrimaryFixedVariant", hex: "#004A77"),
    secondaryFixed: MaterialColor(name: "secondaryFixed", hex: "#CEE5FF"),
    secondaryFixedDim: MaterialColor(name: "secondaryFixedDim", hex: "#9CCBFB"),
    onSecondaryFixed: MaterialColor(name: "onSecondaryFixed", hex: "#001D33"),
    onSecondaryFixedVariant: MaterialColor(name: "onSecondaryFixedVariant", hex: "#104A73"),
    tertiaryFixed: MaterialColor(name: "tertiaryFixed", hex: "#E9DDFF"),
    tertiaryFixedDim: MaterialColor(name: "tertiaryFixedDim", hex: "#CFBDFE"),
    onTertiaryFixed: MaterialColor(name: "onTertiaryFixed", hex: "#201047"),
    onTertiaryFixedVariant: MaterialColor(name: "onTertiaryFixedVariant", hex: "#4D3D75")
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

  public static let materialSourceColor = MaterialColor(name: "sourceColor", hex: "#6750A4")

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
  ) -> MaterialTheme {
    MaterialTheme(
      colorScheme: .custom(base: base, appearance: appearance, overrides: overrides),
      sourceColor: sourceColor.map { MaterialColor(name: "sourceColor", hex: $0) } ?? base.sourceColor
    )
  }

  public static func custom(
    appearance: MaterialAppearance,
    roles: [MaterialColorRole: String],
    sourceColor: String? = nil
  ) throws -> MaterialTheme {
    MaterialTheme(
      colorScheme: try .custom(appearance: appearance, roles: roles),
      sourceColor: sourceColor.map { MaterialColor(name: "sourceColor", hex: $0) } ?? materialSourceColor
    )
  }

  public static func baseline(_ appearance: MaterialAppearance) -> MaterialTheme {
    preset(.tonalSpot, appearance: appearance)
  }
}
