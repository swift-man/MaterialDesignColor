# Generated from tokens/ by tools/codegen/generate.rb.
# Do not edit by hand.
from __future__ import annotations

from dataclasses import dataclass
from typing import Dict, Tuple


@dataclass(frozen=True)
class MaterialColor:
    name: str
    hex: str

    @property
    def rgb(self) -> Tuple[int, int, int]:
        value = self.hex.lstrip("#")
        return (
            int(value[0:2], 16),
            int(value[2:4], 16),
            int(value[4:6], 16),
        )


class _Colors:
    red50 = "#FFEBEE"
    red100 = "#FFCDD2"
    red200 = "#EF9A9A"
    red300 = "#E57373"
    red400 = "#EF5350"
    red500 = "#F44336"
    red600 = "#E53935"
    red700 = "#D32F2F"
    red800 = "#C62828"
    red900 = "#B71C1C"
    redA100 = "#FF8A80"
    redA200 = "#FF5252"
    redA400 = "#FF1744"
    redA700 = "#D50000"
    pink50 = "#FCE4EC"
    pink100 = "#F8BBD0"
    pink200 = "#F48FB1"
    pink300 = "#F06292"
    pink400 = "#EC407A"
    pink500 = "#E91E63"
    pink600 = "#D81B60"
    pink700 = "#C2185B"
    pink800 = "#AD1457"
    pink900 = "#880E4F"
    pinkA100 = "#FF80AB"
    pinkA200 = "#FF4081"
    pinkA400 = "#F50057"
    pinkA700 = "#C51162"
    purple50 = "#F3E5F5"
    purple100 = "#E1BEE7"
    purple200 = "#CE93D8"
    purple300 = "#BA68C8"
    purple400 = "#AB47BC"
    purple500 = "#9C27B0"
    purple600 = "#8E24AA"
    purple700 = "#7B1FA2"
    purple800 = "#6A1B9A"
    purple900 = "#4A148C"
    purpleA100 = "#EA80FC"
    purpleA200 = "#E040FB"
    purpleA400 = "#D500F9"
    purpleA700 = "#AA00FF"
    deepPurple50 = "#EDE7F6"
    deepPurple100 = "#D1C4E9"
    deepPurple200 = "#B39DDB"
    deepPurple300 = "#9575CD"
    deepPurple400 = "#7E57C2"
    deepPurple500 = "#673AB7"
    deepPurple600 = "#5E35B1"
    deepPurple700 = "#512DA8"
    deepPurple800 = "#4527A0"
    deepPurple900 = "#311B92"
    deepPurpleA100 = "#B388FF"
    deepPurpleA200 = "#7C4DFF"
    deepPurpleA400 = "#651FFF"
    deepPurpleA700 = "#6200EA"
    indigo50 = "#E8EAF6"
    indigo100 = "#C5CAE9"
    indigo200 = "#9FA8DA"
    indigo300 = "#7986CB"
    indigo400 = "#5C6BC0"
    indigo500 = "#3F51B5"
    indigo600 = "#3949AB"
    indigo700 = "#303F9F"
    indigo800 = "#283593"
    indigo900 = "#1A237E"
    indigoA100 = "#8C9EFF"
    indigoA200 = "#536DFE"
    indigoA400 = "#3D5AFE"
    indigoA700 = "#304FFE"
    blue50 = "#E3F2FD"
    blue100 = "#BBDEFB"
    blue200 = "#90CAF9"
    blue300 = "#64B5F6"
    blue400 = "#42A5F5"
    blue500 = "#2196F3"
    blue600 = "#1E88E5"
    blue700 = "#1976D2"
    blue800 = "#1565C0"
    blue900 = "#0D47A1"
    blueA100 = "#82B1FF"
    blueA200 = "#448AFF"
    blueA400 = "#2979FF"
    blueA700 = "#2962FF"
    lightBlue50 = "#E1F5FE"
    lightBlue100 = "#B3E5FC"
    lightBlue200 = "#81D4FA"
    lightBlue300 = "#4FC3F7"
    lightBlue400 = "#29B6F6"
    lightBlue500 = "#03A9F4"
    lightBlue600 = "#039BE5"
    lightBlue700 = "#0288D1"
    lightBlue800 = "#0277BD"
    lightBlue900 = "#01579B"
    lightBlueA100 = "#80D8FF"
    lightBlueA200 = "#40C4FF"
    lightBlueA400 = "#00B0FF"
    lightBlueA700 = "#0091EA"
    cyan50 = "#E0F7FA"
    cyan100 = "#B2EBF2"
    cyan200 = "#80DEEA"
    cyan300 = "#4DD0E1"
    cyan400 = "#26C6DA"
    cyan500 = "#00BCD4"
    cyan600 = "#00ACC1"
    cyan700 = "#0097A7"
    cyan800 = "#00838F"
    cyan900 = "#006064"
    cyanA100 = "#84FFFF"
    cyanA200 = "#18FFFF"
    cyanA400 = "#00E5FF"
    cyanA700 = "#00B8D4"
    teal50 = "#E0F2F1"
    teal100 = "#B2DFDB"
    teal200 = "#80CBC4"
    teal300 = "#4DB6AC"
    teal400 = "#26A69A"
    teal500 = "#009688"
    teal600 = "#00897B"
    teal700 = "#00796B"
    teal800 = "#00695C"
    teal900 = "#004D40"
    tealA100 = "#A7FFEB"
    tealA200 = "#64FFDA"
    tealA400 = "#1DE9B6"
    tealA700 = "#00BFA5"
    green50 = "#E8F5E9"
    green100 = "#C8E6C9"
    green200 = "#A5D6A7"
    green300 = "#81C784"
    green400 = "#66BB6A"
    green500 = "#4CAF50"
    green600 = "#43A047"
    green700 = "#388E3C"
    green800 = "#2E7D32"
    green900 = "#1B5E20"
    greenA100 = "#B9F6CA"
    greenA200 = "#69F0AE"
    greenA400 = "#00E676"
    greenA700 = "#00C853"
    lightGreen50 = "#F1F8E9"
    lightGreen100 = "#DCEDC8"
    lightGreen200 = "#C5E1A5"
    lightGreen300 = "#AED581"
    lightGreen400 = "#9CCC65"
    lightGreen500 = "#8BC34A"
    lightGreen600 = "#7CB342"
    lightGreen700 = "#689F38"
    lightGreen800 = "#558B2F"
    lightGreen900 = "#33691E"
    lightGreenA100 = "#CCFF90"
    lightGreenA200 = "#B2FF59"
    lightGreenA400 = "#76FF03"
    lightGreenA700 = "#64DD17"
    lime50 = "#F9FBE7"
    lime100 = "#F0F4C3"
    lime200 = "#E6EE9C"
    lime300 = "#DCE775"
    lime400 = "#D4E157"
    lime500 = "#CDDC39"
    lime600 = "#C0CA33"
    lime700 = "#AFB42B"
    lime800 = "#9E9D24"
    lime900 = "#827717"
    limeA100 = "#F4FF81"
    limeA200 = "#EEFF41"
    limeA400 = "#C6FF00"
    limeA700 = "#AEEA00"
    yellow50 = "#FFFDE7"
    yellow100 = "#FFF9C4"
    yellow200 = "#FFF59D"
    yellow300 = "#FFF176"
    yellow400 = "#FFEE58"
    yellow500 = "#FFEB3B"
    yellow600 = "#FDD835"
    yellow700 = "#FBC02D"
    yellow800 = "#F9A825"
    yellow900 = "#F57F17"
    yellowA100 = "#FFFF8D"
    yellowA200 = "#FFFF00"
    yellowA400 = "#FFEA00"
    yellowA700 = "#FFD600"
    amber50 = "#FFF8E1"
    amber100 = "#FFECB3"
    amber200 = "#FFE082"
    amber300 = "#FFD54F"
    amber400 = "#FFCA28"
    amber500 = "#FFC107"
    amber600 = "#FFB300"
    amber700 = "#FFA000"
    amber800 = "#FF8F00"
    amber900 = "#FF6F00"
    amberA100 = "#FFE57F"
    amberA200 = "#FFD740"
    amberA400 = "#FFC400"
    amberA700 = "#FFAB00"
    orange50 = "#FFF3E0"
    orange100 = "#FFE0B2"
    orange200 = "#FFCC80"
    orange300 = "#FFB74D"
    orange400 = "#FFA726"
    orange500 = "#FF9800"
    orange600 = "#FB8C00"
    orange700 = "#F57C00"
    orange800 = "#EF6C00"
    orange900 = "#E65100"
    orangeA100 = "#FFD180"
    orangeA200 = "#FFAB40"
    orangeA400 = "#FF9100"
    orangeA700 = "#FF6D00"
    deepOrange50 = "#FBE9E7"
    deepOrange100 = "#FFCCBC"
    deepOrange200 = "#FFAB91"
    deepOrange300 = "#FF8A65"
    deepOrange400 = "#FF7043"
    deepOrange500 = "#FF5722"
    deepOrange600 = "#F4511E"
    deepOrange700 = "#E64A19"
    deepOrange800 = "#D84315"
    deepOrange900 = "#BF360C"
    deepOrangeA100 = "#FF9E80"
    deepOrangeA200 = "#FF6E40"
    deepOrangeA400 = "#FF3D00"
    deepOrangeA700 = "#DD2C00"
    brown50 = "#EFEBE9"
    brown100 = "#D7CCC8"
    brown200 = "#BCAAA4"
    brown300 = "#A1887F"
    brown400 = "#8D6E63"
    brown500 = "#795548"
    brown600 = "#6D4C41"
    brown700 = "#5D4037"
    brown800 = "#4E342E"
    brown900 = "#3E2723"
    grey50 = "#FAFAFA"
    grey100 = "#F5F5F5"
    grey200 = "#EEEEEE"
    grey300 = "#E0E0E0"
    grey400 = "#BDBDBD"
    grey500 = "#9E9E9E"
    grey600 = "#757575"
    grey700 = "#616161"
    grey800 = "#424242"
    grey900 = "#212121"
    blueGrey50 = "#ECEFF1"
    blueGrey100 = "#CFD8DC"
    blueGrey200 = "#B0BEC5"
    blueGrey300 = "#90A4AE"
    blueGrey400 = "#78909C"
    blueGrey500 = "#607D8B"
    blueGrey600 = "#546E7A"
    blueGrey700 = "#455A64"
    blueGrey800 = "#37474F"
    blueGrey900 = "#263238"


colors = _Colors()


class MaterialColors:
    RED_50 = MaterialColor("red50", "#FFEBEE")
    RED_100 = MaterialColor("red100", "#FFCDD2")
    RED_200 = MaterialColor("red200", "#EF9A9A")
    RED_300 = MaterialColor("red300", "#E57373")
    RED_400 = MaterialColor("red400", "#EF5350")
    RED_500 = MaterialColor("red500", "#F44336")
    RED_600 = MaterialColor("red600", "#E53935")
    RED_700 = MaterialColor("red700", "#D32F2F")
    RED_800 = MaterialColor("red800", "#C62828")
    RED_900 = MaterialColor("red900", "#B71C1C")
    RED_A_100 = MaterialColor("redA100", "#FF8A80")
    RED_A_200 = MaterialColor("redA200", "#FF5252")
    RED_A_400 = MaterialColor("redA400", "#FF1744")
    RED_A_700 = MaterialColor("redA700", "#D50000")
    PINK_50 = MaterialColor("pink50", "#FCE4EC")
    PINK_100 = MaterialColor("pink100", "#F8BBD0")
    PINK_200 = MaterialColor("pink200", "#F48FB1")
    PINK_300 = MaterialColor("pink300", "#F06292")
    PINK_400 = MaterialColor("pink400", "#EC407A")
    PINK_500 = MaterialColor("pink500", "#E91E63")
    PINK_600 = MaterialColor("pink600", "#D81B60")
    PINK_700 = MaterialColor("pink700", "#C2185B")
    PINK_800 = MaterialColor("pink800", "#AD1457")
    PINK_900 = MaterialColor("pink900", "#880E4F")
    PINK_A_100 = MaterialColor("pinkA100", "#FF80AB")
    PINK_A_200 = MaterialColor("pinkA200", "#FF4081")
    PINK_A_400 = MaterialColor("pinkA400", "#F50057")
    PINK_A_700 = MaterialColor("pinkA700", "#C51162")
    PURPLE_50 = MaterialColor("purple50", "#F3E5F5")
    PURPLE_100 = MaterialColor("purple100", "#E1BEE7")
    PURPLE_200 = MaterialColor("purple200", "#CE93D8")
    PURPLE_300 = MaterialColor("purple300", "#BA68C8")
    PURPLE_400 = MaterialColor("purple400", "#AB47BC")
    PURPLE_500 = MaterialColor("purple500", "#9C27B0")
    PURPLE_600 = MaterialColor("purple600", "#8E24AA")
    PURPLE_700 = MaterialColor("purple700", "#7B1FA2")
    PURPLE_800 = MaterialColor("purple800", "#6A1B9A")
    PURPLE_900 = MaterialColor("purple900", "#4A148C")
    PURPLE_A_100 = MaterialColor("purpleA100", "#EA80FC")
    PURPLE_A_200 = MaterialColor("purpleA200", "#E040FB")
    PURPLE_A_400 = MaterialColor("purpleA400", "#D500F9")
    PURPLE_A_700 = MaterialColor("purpleA700", "#AA00FF")
    DEEP_PURPLE_50 = MaterialColor("deepPurple50", "#EDE7F6")
    DEEP_PURPLE_100 = MaterialColor("deepPurple100", "#D1C4E9")
    DEEP_PURPLE_200 = MaterialColor("deepPurple200", "#B39DDB")
    DEEP_PURPLE_300 = MaterialColor("deepPurple300", "#9575CD")
    DEEP_PURPLE_400 = MaterialColor("deepPurple400", "#7E57C2")
    DEEP_PURPLE_500 = MaterialColor("deepPurple500", "#673AB7")
    DEEP_PURPLE_600 = MaterialColor("deepPurple600", "#5E35B1")
    DEEP_PURPLE_700 = MaterialColor("deepPurple700", "#512DA8")
    DEEP_PURPLE_800 = MaterialColor("deepPurple800", "#4527A0")
    DEEP_PURPLE_900 = MaterialColor("deepPurple900", "#311B92")
    DEEP_PURPLE_A_100 = MaterialColor("deepPurpleA100", "#B388FF")
    DEEP_PURPLE_A_200 = MaterialColor("deepPurpleA200", "#7C4DFF")
    DEEP_PURPLE_A_400 = MaterialColor("deepPurpleA400", "#651FFF")
    DEEP_PURPLE_A_700 = MaterialColor("deepPurpleA700", "#6200EA")
    INDIGO_50 = MaterialColor("indigo50", "#E8EAF6")
    INDIGO_100 = MaterialColor("indigo100", "#C5CAE9")
    INDIGO_200 = MaterialColor("indigo200", "#9FA8DA")
    INDIGO_300 = MaterialColor("indigo300", "#7986CB")
    INDIGO_400 = MaterialColor("indigo400", "#5C6BC0")
    INDIGO_500 = MaterialColor("indigo500", "#3F51B5")
    INDIGO_600 = MaterialColor("indigo600", "#3949AB")
    INDIGO_700 = MaterialColor("indigo700", "#303F9F")
    INDIGO_800 = MaterialColor("indigo800", "#283593")
    INDIGO_900 = MaterialColor("indigo900", "#1A237E")
    INDIGO_A_100 = MaterialColor("indigoA100", "#8C9EFF")
    INDIGO_A_200 = MaterialColor("indigoA200", "#536DFE")
    INDIGO_A_400 = MaterialColor("indigoA400", "#3D5AFE")
    INDIGO_A_700 = MaterialColor("indigoA700", "#304FFE")
    BLUE_50 = MaterialColor("blue50", "#E3F2FD")
    BLUE_100 = MaterialColor("blue100", "#BBDEFB")
    BLUE_200 = MaterialColor("blue200", "#90CAF9")
    BLUE_300 = MaterialColor("blue300", "#64B5F6")
    BLUE_400 = MaterialColor("blue400", "#42A5F5")
    BLUE_500 = MaterialColor("blue500", "#2196F3")
    BLUE_600 = MaterialColor("blue600", "#1E88E5")
    BLUE_700 = MaterialColor("blue700", "#1976D2")
    BLUE_800 = MaterialColor("blue800", "#1565C0")
    BLUE_900 = MaterialColor("blue900", "#0D47A1")
    BLUE_A_100 = MaterialColor("blueA100", "#82B1FF")
    BLUE_A_200 = MaterialColor("blueA200", "#448AFF")
    BLUE_A_400 = MaterialColor("blueA400", "#2979FF")
    BLUE_A_700 = MaterialColor("blueA700", "#2962FF")
    LIGHT_BLUE_50 = MaterialColor("lightBlue50", "#E1F5FE")
    LIGHT_BLUE_100 = MaterialColor("lightBlue100", "#B3E5FC")
    LIGHT_BLUE_200 = MaterialColor("lightBlue200", "#81D4FA")
    LIGHT_BLUE_300 = MaterialColor("lightBlue300", "#4FC3F7")
    LIGHT_BLUE_400 = MaterialColor("lightBlue400", "#29B6F6")
    LIGHT_BLUE_500 = MaterialColor("lightBlue500", "#03A9F4")
    LIGHT_BLUE_600 = MaterialColor("lightBlue600", "#039BE5")
    LIGHT_BLUE_700 = MaterialColor("lightBlue700", "#0288D1")
    LIGHT_BLUE_800 = MaterialColor("lightBlue800", "#0277BD")
    LIGHT_BLUE_900 = MaterialColor("lightBlue900", "#01579B")
    LIGHT_BLUE_A_100 = MaterialColor("lightBlueA100", "#80D8FF")
    LIGHT_BLUE_A_200 = MaterialColor("lightBlueA200", "#40C4FF")
    LIGHT_BLUE_A_400 = MaterialColor("lightBlueA400", "#00B0FF")
    LIGHT_BLUE_A_700 = MaterialColor("lightBlueA700", "#0091EA")
    CYAN_50 = MaterialColor("cyan50", "#E0F7FA")
    CYAN_100 = MaterialColor("cyan100", "#B2EBF2")
    CYAN_200 = MaterialColor("cyan200", "#80DEEA")
    CYAN_300 = MaterialColor("cyan300", "#4DD0E1")
    CYAN_400 = MaterialColor("cyan400", "#26C6DA")
    CYAN_500 = MaterialColor("cyan500", "#00BCD4")
    CYAN_600 = MaterialColor("cyan600", "#00ACC1")
    CYAN_700 = MaterialColor("cyan700", "#0097A7")
    CYAN_800 = MaterialColor("cyan800", "#00838F")
    CYAN_900 = MaterialColor("cyan900", "#006064")
    CYAN_A_100 = MaterialColor("cyanA100", "#84FFFF")
    CYAN_A_200 = MaterialColor("cyanA200", "#18FFFF")
    CYAN_A_400 = MaterialColor("cyanA400", "#00E5FF")
    CYAN_A_700 = MaterialColor("cyanA700", "#00B8D4")
    TEAL_50 = MaterialColor("teal50", "#E0F2F1")
    TEAL_100 = MaterialColor("teal100", "#B2DFDB")
    TEAL_200 = MaterialColor("teal200", "#80CBC4")
    TEAL_300 = MaterialColor("teal300", "#4DB6AC")
    TEAL_400 = MaterialColor("teal400", "#26A69A")
    TEAL_500 = MaterialColor("teal500", "#009688")
    TEAL_600 = MaterialColor("teal600", "#00897B")
    TEAL_700 = MaterialColor("teal700", "#00796B")
    TEAL_800 = MaterialColor("teal800", "#00695C")
    TEAL_900 = MaterialColor("teal900", "#004D40")
    TEAL_A_100 = MaterialColor("tealA100", "#A7FFEB")
    TEAL_A_200 = MaterialColor("tealA200", "#64FFDA")
    TEAL_A_400 = MaterialColor("tealA400", "#1DE9B6")
    TEAL_A_700 = MaterialColor("tealA700", "#00BFA5")
    GREEN_50 = MaterialColor("green50", "#E8F5E9")
    GREEN_100 = MaterialColor("green100", "#C8E6C9")
    GREEN_200 = MaterialColor("green200", "#A5D6A7")
    GREEN_300 = MaterialColor("green300", "#81C784")
    GREEN_400 = MaterialColor("green400", "#66BB6A")
    GREEN_500 = MaterialColor("green500", "#4CAF50")
    GREEN_600 = MaterialColor("green600", "#43A047")
    GREEN_700 = MaterialColor("green700", "#388E3C")
    GREEN_800 = MaterialColor("green800", "#2E7D32")
    GREEN_900 = MaterialColor("green900", "#1B5E20")
    GREEN_A_100 = MaterialColor("greenA100", "#B9F6CA")
    GREEN_A_200 = MaterialColor("greenA200", "#69F0AE")
    GREEN_A_400 = MaterialColor("greenA400", "#00E676")
    GREEN_A_700 = MaterialColor("greenA700", "#00C853")
    LIGHT_GREEN_50 = MaterialColor("lightGreen50", "#F1F8E9")
    LIGHT_GREEN_100 = MaterialColor("lightGreen100", "#DCEDC8")
    LIGHT_GREEN_200 = MaterialColor("lightGreen200", "#C5E1A5")
    LIGHT_GREEN_300 = MaterialColor("lightGreen300", "#AED581")
    LIGHT_GREEN_400 = MaterialColor("lightGreen400", "#9CCC65")
    LIGHT_GREEN_500 = MaterialColor("lightGreen500", "#8BC34A")
    LIGHT_GREEN_600 = MaterialColor("lightGreen600", "#7CB342")
    LIGHT_GREEN_700 = MaterialColor("lightGreen700", "#689F38")
    LIGHT_GREEN_800 = MaterialColor("lightGreen800", "#558B2F")
    LIGHT_GREEN_900 = MaterialColor("lightGreen900", "#33691E")
    LIGHT_GREEN_A_100 = MaterialColor("lightGreenA100", "#CCFF90")
    LIGHT_GREEN_A_200 = MaterialColor("lightGreenA200", "#B2FF59")
    LIGHT_GREEN_A_400 = MaterialColor("lightGreenA400", "#76FF03")
    LIGHT_GREEN_A_700 = MaterialColor("lightGreenA700", "#64DD17")
    LIME_50 = MaterialColor("lime50", "#F9FBE7")
    LIME_100 = MaterialColor("lime100", "#F0F4C3")
    LIME_200 = MaterialColor("lime200", "#E6EE9C")
    LIME_300 = MaterialColor("lime300", "#DCE775")
    LIME_400 = MaterialColor("lime400", "#D4E157")
    LIME_500 = MaterialColor("lime500", "#CDDC39")
    LIME_600 = MaterialColor("lime600", "#C0CA33")
    LIME_700 = MaterialColor("lime700", "#AFB42B")
    LIME_800 = MaterialColor("lime800", "#9E9D24")
    LIME_900 = MaterialColor("lime900", "#827717")
    LIME_A_100 = MaterialColor("limeA100", "#F4FF81")
    LIME_A_200 = MaterialColor("limeA200", "#EEFF41")
    LIME_A_400 = MaterialColor("limeA400", "#C6FF00")
    LIME_A_700 = MaterialColor("limeA700", "#AEEA00")
    YELLOW_50 = MaterialColor("yellow50", "#FFFDE7")
    YELLOW_100 = MaterialColor("yellow100", "#FFF9C4")
    YELLOW_200 = MaterialColor("yellow200", "#FFF59D")
    YELLOW_300 = MaterialColor("yellow300", "#FFF176")
    YELLOW_400 = MaterialColor("yellow400", "#FFEE58")
    YELLOW_500 = MaterialColor("yellow500", "#FFEB3B")
    YELLOW_600 = MaterialColor("yellow600", "#FDD835")
    YELLOW_700 = MaterialColor("yellow700", "#FBC02D")
    YELLOW_800 = MaterialColor("yellow800", "#F9A825")
    YELLOW_900 = MaterialColor("yellow900", "#F57F17")
    YELLOW_A_100 = MaterialColor("yellowA100", "#FFFF8D")
    YELLOW_A_200 = MaterialColor("yellowA200", "#FFFF00")
    YELLOW_A_400 = MaterialColor("yellowA400", "#FFEA00")
    YELLOW_A_700 = MaterialColor("yellowA700", "#FFD600")
    AMBER_50 = MaterialColor("amber50", "#FFF8E1")
    AMBER_100 = MaterialColor("amber100", "#FFECB3")
    AMBER_200 = MaterialColor("amber200", "#FFE082")
    AMBER_300 = MaterialColor("amber300", "#FFD54F")
    AMBER_400 = MaterialColor("amber400", "#FFCA28")
    AMBER_500 = MaterialColor("amber500", "#FFC107")
    AMBER_600 = MaterialColor("amber600", "#FFB300")
    AMBER_700 = MaterialColor("amber700", "#FFA000")
    AMBER_800 = MaterialColor("amber800", "#FF8F00")
    AMBER_900 = MaterialColor("amber900", "#FF6F00")
    AMBER_A_100 = MaterialColor("amberA100", "#FFE57F")
    AMBER_A_200 = MaterialColor("amberA200", "#FFD740")
    AMBER_A_400 = MaterialColor("amberA400", "#FFC400")
    AMBER_A_700 = MaterialColor("amberA700", "#FFAB00")
    ORANGE_50 = MaterialColor("orange50", "#FFF3E0")
    ORANGE_100 = MaterialColor("orange100", "#FFE0B2")
    ORANGE_200 = MaterialColor("orange200", "#FFCC80")
    ORANGE_300 = MaterialColor("orange300", "#FFB74D")
    ORANGE_400 = MaterialColor("orange400", "#FFA726")
    ORANGE_500 = MaterialColor("orange500", "#FF9800")
    ORANGE_600 = MaterialColor("orange600", "#FB8C00")
    ORANGE_700 = MaterialColor("orange700", "#F57C00")
    ORANGE_800 = MaterialColor("orange800", "#EF6C00")
    ORANGE_900 = MaterialColor("orange900", "#E65100")
    ORANGE_A_100 = MaterialColor("orangeA100", "#FFD180")
    ORANGE_A_200 = MaterialColor("orangeA200", "#FFAB40")
    ORANGE_A_400 = MaterialColor("orangeA400", "#FF9100")
    ORANGE_A_700 = MaterialColor("orangeA700", "#FF6D00")
    DEEP_ORANGE_50 = MaterialColor("deepOrange50", "#FBE9E7")
    DEEP_ORANGE_100 = MaterialColor("deepOrange100", "#FFCCBC")
    DEEP_ORANGE_200 = MaterialColor("deepOrange200", "#FFAB91")
    DEEP_ORANGE_300 = MaterialColor("deepOrange300", "#FF8A65")
    DEEP_ORANGE_400 = MaterialColor("deepOrange400", "#FF7043")
    DEEP_ORANGE_500 = MaterialColor("deepOrange500", "#FF5722")
    DEEP_ORANGE_600 = MaterialColor("deepOrange600", "#F4511E")
    DEEP_ORANGE_700 = MaterialColor("deepOrange700", "#E64A19")
    DEEP_ORANGE_800 = MaterialColor("deepOrange800", "#D84315")
    DEEP_ORANGE_900 = MaterialColor("deepOrange900", "#BF360C")
    DEEP_ORANGE_A_100 = MaterialColor("deepOrangeA100", "#FF9E80")
    DEEP_ORANGE_A_200 = MaterialColor("deepOrangeA200", "#FF6E40")
    DEEP_ORANGE_A_400 = MaterialColor("deepOrangeA400", "#FF3D00")
    DEEP_ORANGE_A_700 = MaterialColor("deepOrangeA700", "#DD2C00")
    BROWN_50 = MaterialColor("brown50", "#EFEBE9")
    BROWN_100 = MaterialColor("brown100", "#D7CCC8")
    BROWN_200 = MaterialColor("brown200", "#BCAAA4")
    BROWN_300 = MaterialColor("brown300", "#A1887F")
    BROWN_400 = MaterialColor("brown400", "#8D6E63")
    BROWN_500 = MaterialColor("brown500", "#795548")
    BROWN_600 = MaterialColor("brown600", "#6D4C41")
    BROWN_700 = MaterialColor("brown700", "#5D4037")
    BROWN_800 = MaterialColor("brown800", "#4E342E")
    BROWN_900 = MaterialColor("brown900", "#3E2723")
    GREY_50 = MaterialColor("grey50", "#FAFAFA")
    GREY_100 = MaterialColor("grey100", "#F5F5F5")
    GREY_200 = MaterialColor("grey200", "#EEEEEE")
    GREY_300 = MaterialColor("grey300", "#E0E0E0")
    GREY_400 = MaterialColor("grey400", "#BDBDBD")
    GREY_500 = MaterialColor("grey500", "#9E9E9E")
    GREY_600 = MaterialColor("grey600", "#757575")
    GREY_700 = MaterialColor("grey700", "#616161")
    GREY_800 = MaterialColor("grey800", "#424242")
    GREY_900 = MaterialColor("grey900", "#212121")
    BLUE_GREY_50 = MaterialColor("blueGrey50", "#ECEFF1")
    BLUE_GREY_100 = MaterialColor("blueGrey100", "#CFD8DC")
    BLUE_GREY_200 = MaterialColor("blueGrey200", "#B0BEC5")
    BLUE_GREY_300 = MaterialColor("blueGrey300", "#90A4AE")
    BLUE_GREY_400 = MaterialColor("blueGrey400", "#78909C")
    BLUE_GREY_500 = MaterialColor("blueGrey500", "#607D8B")
    BLUE_GREY_600 = MaterialColor("blueGrey600", "#546E7A")
    BLUE_GREY_700 = MaterialColor("blueGrey700", "#455A64")
    BLUE_GREY_800 = MaterialColor("blueGrey800", "#37474F")
    BLUE_GREY_900 = MaterialColor("blueGrey900", "#263238")


ALL = (
    MaterialColors.RED_50,
    MaterialColors.RED_100,
    MaterialColors.RED_200,
    MaterialColors.RED_300,
    MaterialColors.RED_400,
    MaterialColors.RED_500,
    MaterialColors.RED_600,
    MaterialColors.RED_700,
    MaterialColors.RED_800,
    MaterialColors.RED_900,
    MaterialColors.RED_A_100,
    MaterialColors.RED_A_200,
    MaterialColors.RED_A_400,
    MaterialColors.RED_A_700,
    MaterialColors.PINK_50,
    MaterialColors.PINK_100,
    MaterialColors.PINK_200,
    MaterialColors.PINK_300,
    MaterialColors.PINK_400,
    MaterialColors.PINK_500,
    MaterialColors.PINK_600,
    MaterialColors.PINK_700,
    MaterialColors.PINK_800,
    MaterialColors.PINK_900,
    MaterialColors.PINK_A_100,
    MaterialColors.PINK_A_200,
    MaterialColors.PINK_A_400,
    MaterialColors.PINK_A_700,
    MaterialColors.PURPLE_50,
    MaterialColors.PURPLE_100,
    MaterialColors.PURPLE_200,
    MaterialColors.PURPLE_300,
    MaterialColors.PURPLE_400,
    MaterialColors.PURPLE_500,
    MaterialColors.PURPLE_600,
    MaterialColors.PURPLE_700,
    MaterialColors.PURPLE_800,
    MaterialColors.PURPLE_900,
    MaterialColors.PURPLE_A_100,
    MaterialColors.PURPLE_A_200,
    MaterialColors.PURPLE_A_400,
    MaterialColors.PURPLE_A_700,
    MaterialColors.DEEP_PURPLE_50,
    MaterialColors.DEEP_PURPLE_100,
    MaterialColors.DEEP_PURPLE_200,
    MaterialColors.DEEP_PURPLE_300,
    MaterialColors.DEEP_PURPLE_400,
    MaterialColors.DEEP_PURPLE_500,
    MaterialColors.DEEP_PURPLE_600,
    MaterialColors.DEEP_PURPLE_700,
    MaterialColors.DEEP_PURPLE_800,
    MaterialColors.DEEP_PURPLE_900,
    MaterialColors.DEEP_PURPLE_A_100,
    MaterialColors.DEEP_PURPLE_A_200,
    MaterialColors.DEEP_PURPLE_A_400,
    MaterialColors.DEEP_PURPLE_A_700,
    MaterialColors.INDIGO_50,
    MaterialColors.INDIGO_100,
    MaterialColors.INDIGO_200,
    MaterialColors.INDIGO_300,
    MaterialColors.INDIGO_400,
    MaterialColors.INDIGO_500,
    MaterialColors.INDIGO_600,
    MaterialColors.INDIGO_700,
    MaterialColors.INDIGO_800,
    MaterialColors.INDIGO_900,
    MaterialColors.INDIGO_A_100,
    MaterialColors.INDIGO_A_200,
    MaterialColors.INDIGO_A_400,
    MaterialColors.INDIGO_A_700,
    MaterialColors.BLUE_50,
    MaterialColors.BLUE_100,
    MaterialColors.BLUE_200,
    MaterialColors.BLUE_300,
    MaterialColors.BLUE_400,
    MaterialColors.BLUE_500,
    MaterialColors.BLUE_600,
    MaterialColors.BLUE_700,
    MaterialColors.BLUE_800,
    MaterialColors.BLUE_900,
    MaterialColors.BLUE_A_100,
    MaterialColors.BLUE_A_200,
    MaterialColors.BLUE_A_400,
    MaterialColors.BLUE_A_700,
    MaterialColors.LIGHT_BLUE_50,
    MaterialColors.LIGHT_BLUE_100,
    MaterialColors.LIGHT_BLUE_200,
    MaterialColors.LIGHT_BLUE_300,
    MaterialColors.LIGHT_BLUE_400,
    MaterialColors.LIGHT_BLUE_500,
    MaterialColors.LIGHT_BLUE_600,
    MaterialColors.LIGHT_BLUE_700,
    MaterialColors.LIGHT_BLUE_800,
    MaterialColors.LIGHT_BLUE_900,
    MaterialColors.LIGHT_BLUE_A_100,
    MaterialColors.LIGHT_BLUE_A_200,
    MaterialColors.LIGHT_BLUE_A_400,
    MaterialColors.LIGHT_BLUE_A_700,
    MaterialColors.CYAN_50,
    MaterialColors.CYAN_100,
    MaterialColors.CYAN_200,
    MaterialColors.CYAN_300,
    MaterialColors.CYAN_400,
    MaterialColors.CYAN_500,
    MaterialColors.CYAN_600,
    MaterialColors.CYAN_700,
    MaterialColors.CYAN_800,
    MaterialColors.CYAN_900,
    MaterialColors.CYAN_A_100,
    MaterialColors.CYAN_A_200,
    MaterialColors.CYAN_A_400,
    MaterialColors.CYAN_A_700,
    MaterialColors.TEAL_50,
    MaterialColors.TEAL_100,
    MaterialColors.TEAL_200,
    MaterialColors.TEAL_300,
    MaterialColors.TEAL_400,
    MaterialColors.TEAL_500,
    MaterialColors.TEAL_600,
    MaterialColors.TEAL_700,
    MaterialColors.TEAL_800,
    MaterialColors.TEAL_900,
    MaterialColors.TEAL_A_100,
    MaterialColors.TEAL_A_200,
    MaterialColors.TEAL_A_400,
    MaterialColors.TEAL_A_700,
    MaterialColors.GREEN_50,
    MaterialColors.GREEN_100,
    MaterialColors.GREEN_200,
    MaterialColors.GREEN_300,
    MaterialColors.GREEN_400,
    MaterialColors.GREEN_500,
    MaterialColors.GREEN_600,
    MaterialColors.GREEN_700,
    MaterialColors.GREEN_800,
    MaterialColors.GREEN_900,
    MaterialColors.GREEN_A_100,
    MaterialColors.GREEN_A_200,
    MaterialColors.GREEN_A_400,
    MaterialColors.GREEN_A_700,
    MaterialColors.LIGHT_GREEN_50,
    MaterialColors.LIGHT_GREEN_100,
    MaterialColors.LIGHT_GREEN_200,
    MaterialColors.LIGHT_GREEN_300,
    MaterialColors.LIGHT_GREEN_400,
    MaterialColors.LIGHT_GREEN_500,
    MaterialColors.LIGHT_GREEN_600,
    MaterialColors.LIGHT_GREEN_700,
    MaterialColors.LIGHT_GREEN_800,
    MaterialColors.LIGHT_GREEN_900,
    MaterialColors.LIGHT_GREEN_A_100,
    MaterialColors.LIGHT_GREEN_A_200,
    MaterialColors.LIGHT_GREEN_A_400,
    MaterialColors.LIGHT_GREEN_A_700,
    MaterialColors.LIME_50,
    MaterialColors.LIME_100,
    MaterialColors.LIME_200,
    MaterialColors.LIME_300,
    MaterialColors.LIME_400,
    MaterialColors.LIME_500,
    MaterialColors.LIME_600,
    MaterialColors.LIME_700,
    MaterialColors.LIME_800,
    MaterialColors.LIME_900,
    MaterialColors.LIME_A_100,
    MaterialColors.LIME_A_200,
    MaterialColors.LIME_A_400,
    MaterialColors.LIME_A_700,
    MaterialColors.YELLOW_50,
    MaterialColors.YELLOW_100,
    MaterialColors.YELLOW_200,
    MaterialColors.YELLOW_300,
    MaterialColors.YELLOW_400,
    MaterialColors.YELLOW_500,
    MaterialColors.YELLOW_600,
    MaterialColors.YELLOW_700,
    MaterialColors.YELLOW_800,
    MaterialColors.YELLOW_900,
    MaterialColors.YELLOW_A_100,
    MaterialColors.YELLOW_A_200,
    MaterialColors.YELLOW_A_400,
    MaterialColors.YELLOW_A_700,
    MaterialColors.AMBER_50,
    MaterialColors.AMBER_100,
    MaterialColors.AMBER_200,
    MaterialColors.AMBER_300,
    MaterialColors.AMBER_400,
    MaterialColors.AMBER_500,
    MaterialColors.AMBER_600,
    MaterialColors.AMBER_700,
    MaterialColors.AMBER_800,
    MaterialColors.AMBER_900,
    MaterialColors.AMBER_A_100,
    MaterialColors.AMBER_A_200,
    MaterialColors.AMBER_A_400,
    MaterialColors.AMBER_A_700,
    MaterialColors.ORANGE_50,
    MaterialColors.ORANGE_100,
    MaterialColors.ORANGE_200,
    MaterialColors.ORANGE_300,
    MaterialColors.ORANGE_400,
    MaterialColors.ORANGE_500,
    MaterialColors.ORANGE_600,
    MaterialColors.ORANGE_700,
    MaterialColors.ORANGE_800,
    MaterialColors.ORANGE_900,
    MaterialColors.ORANGE_A_100,
    MaterialColors.ORANGE_A_200,
    MaterialColors.ORANGE_A_400,
    MaterialColors.ORANGE_A_700,
    MaterialColors.DEEP_ORANGE_50,
    MaterialColors.DEEP_ORANGE_100,
    MaterialColors.DEEP_ORANGE_200,
    MaterialColors.DEEP_ORANGE_300,
    MaterialColors.DEEP_ORANGE_400,
    MaterialColors.DEEP_ORANGE_500,
    MaterialColors.DEEP_ORANGE_600,
    MaterialColors.DEEP_ORANGE_700,
    MaterialColors.DEEP_ORANGE_800,
    MaterialColors.DEEP_ORANGE_900,
    MaterialColors.DEEP_ORANGE_A_100,
    MaterialColors.DEEP_ORANGE_A_200,
    MaterialColors.DEEP_ORANGE_A_400,
    MaterialColors.DEEP_ORANGE_A_700,
    MaterialColors.BROWN_50,
    MaterialColors.BROWN_100,
    MaterialColors.BROWN_200,
    MaterialColors.BROWN_300,
    MaterialColors.BROWN_400,
    MaterialColors.BROWN_500,
    MaterialColors.BROWN_600,
    MaterialColors.BROWN_700,
    MaterialColors.BROWN_800,
    MaterialColors.BROWN_900,
    MaterialColors.GREY_50,
    MaterialColors.GREY_100,
    MaterialColors.GREY_200,
    MaterialColors.GREY_300,
    MaterialColors.GREY_400,
    MaterialColors.GREY_500,
    MaterialColors.GREY_600,
    MaterialColors.GREY_700,
    MaterialColors.GREY_800,
    MaterialColors.GREY_900,
    MaterialColors.BLUE_GREY_50,
    MaterialColors.BLUE_GREY_100,
    MaterialColors.BLUE_GREY_200,
    MaterialColors.BLUE_GREY_300,
    MaterialColors.BLUE_GREY_400,
    MaterialColors.BLUE_GREY_500,
    MaterialColors.BLUE_GREY_600,
    MaterialColors.BLUE_GREY_700,
    MaterialColors.BLUE_GREY_800,
    MaterialColors.BLUE_GREY_900,
)

BY_NAME: Dict[str, MaterialColor] = {color.name: color for color in ALL}


def get_color(name: str) -> MaterialColor:
    return BY_NAME[name]
