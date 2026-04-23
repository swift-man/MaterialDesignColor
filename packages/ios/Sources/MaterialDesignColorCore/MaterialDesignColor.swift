// Generated from tokens/ by tools/codegen/generate.rb.
// Do not edit by hand.
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

public struct MaterialColorScheme: Hashable, Sendable {
  public let appearance: MaterialAppearance
  public let sourceColor: MaterialColor
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
    sourceColor: MaterialColor,
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
    self.sourceColor = sourceColor
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

  public static let baselineLight = MaterialColorScheme(
    appearance: .light,
    sourceColor: MaterialColor(name: "sourceColor", hex: "#6750A4"),
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

  public static let baselineDark = MaterialColorScheme(
    appearance: .dark,
    sourceColor: MaterialColor(name: "sourceColor", hex: "#6750A4"),
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

  public static func baseline(_ appearance: MaterialAppearance) -> MaterialColorScheme {
    switch appearance {
    case .light:
      return baselineLight
    case .dark:
      return baselineDark
    }
  }
}

public struct MaterialTheme: Hashable, Sendable {
  public let colorScheme: MaterialColorScheme

  public init(colorScheme: MaterialColorScheme) {
    self.colorScheme = colorScheme
  }

  public static let light = MaterialTheme(colorScheme: .baselineLight)
  public static let dark = MaterialTheme(colorScheme: .baselineDark)

  public static func baseline(_ appearance: MaterialAppearance) -> MaterialTheme {
    return MaterialTheme(colorScheme: .baseline(appearance))
  }
}
