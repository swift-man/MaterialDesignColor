//
//  File.swift
//  
//
//  Created by SwiftMan on 2023/03/12.
//

import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct ColorRowViewModel: Hashable {
  let name: String
  let backgroundColor: Color
  let foregroundColor: Color
  
  init(name: String, backgroundColor: Color, foregroundColor: Color = .white) {
    self.name = name
    self.backgroundColor = backgroundColor
    self.foregroundColor = foregroundColor
  }
  
  static func red() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "red50", backgroundColor: .red50, foregroundColor: .black),
      ColorRowViewModel(name: "red100", backgroundColor: .red100, foregroundColor: .black),
      ColorRowViewModel(name: "red200", backgroundColor: .red200, foregroundColor: .black),
      ColorRowViewModel(name: "red300", backgroundColor: .red300, foregroundColor: .black),
      ColorRowViewModel(name: "red400", backgroundColor: .red400),
      ColorRowViewModel(name: "red500", backgroundColor: .red500),
      ColorRowViewModel(name: "red600", backgroundColor: .red600),
      ColorRowViewModel(name: "red700", backgroundColor: .red700),
      ColorRowViewModel(name: "red800", backgroundColor: .red800),
      ColorRowViewModel(name: "red900", backgroundColor: .red900),
      ColorRowViewModel(name: "redA100", backgroundColor: .redA100, foregroundColor: .black),
      ColorRowViewModel(name: "redA200", backgroundColor: .redA200),
      ColorRowViewModel(name: "redA400", backgroundColor: .redA400),
      ColorRowViewModel(name: "redA700", backgroundColor: .redA700),
    ]
  }
  
  static func pink() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "pink50", backgroundColor: .pink50, foregroundColor: .black),
      ColorRowViewModel(name: "pink100", backgroundColor: .pink100, foregroundColor: .black),
      ColorRowViewModel(name: "pink200", backgroundColor: .pink200, foregroundColor: .black),
      ColorRowViewModel(name: "pink300", backgroundColor: .pink300),
      ColorRowViewModel(name: "pink400", backgroundColor: .pink400),
      ColorRowViewModel(name: "pink500", backgroundColor: .pink500),
      ColorRowViewModel(name: "pink600", backgroundColor: .pink600),
      ColorRowViewModel(name: "pink700", backgroundColor: .pink700),
      ColorRowViewModel(name: "pink800", backgroundColor: .pink800),
      ColorRowViewModel(name: "pink900", backgroundColor: .pink900),
      ColorRowViewModel(name: "pinkA100", backgroundColor: .pinkA100, foregroundColor: .black),
      ColorRowViewModel(name: "pinkA200", backgroundColor: .pinkA200),
      ColorRowViewModel(name: "pinkA400", backgroundColor: .pinkA400),
      ColorRowViewModel(name: "pinkA700", backgroundColor: .pinkA700),
    ]
  }
  
  static func purple() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "purple50", backgroundColor: .purple50, foregroundColor: .black),
      ColorRowViewModel(name: "purple100", backgroundColor: .purple100, foregroundColor: .black),
      ColorRowViewModel(name: "purple200", backgroundColor: .purple200, foregroundColor: .black),
      ColorRowViewModel(name: "purple300", backgroundColor: .purple300),
      ColorRowViewModel(name: "purple400", backgroundColor: .purple400),
      ColorRowViewModel(name: "purple500", backgroundColor: .purple500),
      ColorRowViewModel(name: "purple600", backgroundColor: .purple600),
      ColorRowViewModel(name: "purple700", backgroundColor: .purple700),
      ColorRowViewModel(name: "purple800", backgroundColor: .purple800),
      ColorRowViewModel(name: "purple900", backgroundColor: .purple900),
      ColorRowViewModel(name: "purpleA100", backgroundColor: .purpleA100, foregroundColor: .black),
      ColorRowViewModel(name: "purpleA200", backgroundColor: .purpleA200),
      ColorRowViewModel(name: "purpleA400", backgroundColor: .purpleA400),
      ColorRowViewModel(name: "purpleA700", backgroundColor: .purpleA700),
    ]
  }
  
  static func deepPurple() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "deepPurple50", backgroundColor: .deepPurple50, foregroundColor: .black),
      ColorRowViewModel(name: "deepPurple100", backgroundColor: .deepPurple100, foregroundColor: .black),
      ColorRowViewModel(name: "deepPurple200", backgroundColor: .deepPurple200, foregroundColor: .black),
      ColorRowViewModel(name: "deepPurple300", backgroundColor: .deepPurple300),
      ColorRowViewModel(name: "deepPurple400", backgroundColor: .deepPurple400),
      ColorRowViewModel(name: "deepPurple500", backgroundColor: .deepPurple500),
      ColorRowViewModel(name: "deepPurple600", backgroundColor: .deepPurple600),
      ColorRowViewModel(name: "deepPurple700", backgroundColor: .deepPurple700),
      ColorRowViewModel(name: "deepPurple800", backgroundColor: .deepPurple800),
      ColorRowViewModel(name: "deepPurple900", backgroundColor: .deepPurple900),
      ColorRowViewModel(name: "deepPurpleA100", backgroundColor: .deepPurpleA100, foregroundColor: .black),
      ColorRowViewModel(name: "deepPurpleA200", backgroundColor: .deepPurpleA200),
      ColorRowViewModel(name: "deepPurpleA400", backgroundColor: .deepPurpleA400),
      ColorRowViewModel(name: "deepPurpleA700", backgroundColor: .deepPurpleA700),
    ]
  }
  
  static func indigo() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "indigo50", backgroundColor: .indigo50, foregroundColor: .black),
      ColorRowViewModel(name: "indigo100", backgroundColor: .indigo100, foregroundColor: .black),
      ColorRowViewModel(name: "indigo200", backgroundColor: .indigo200, foregroundColor: .black),
      ColorRowViewModel(name: "indigo300", backgroundColor: .indigo300),
      ColorRowViewModel(name: "indigo400", backgroundColor: .indigo400),
      ColorRowViewModel(name: "indigo500", backgroundColor: .indigo500),
      ColorRowViewModel(name: "indigo600", backgroundColor: .indigo600),
      ColorRowViewModel(name: "indigo700", backgroundColor: .indigo700),
      ColorRowViewModel(name: "indigo800", backgroundColor: .indigo800),
      ColorRowViewModel(name: "indigo900", backgroundColor: .indigo900),
      ColorRowViewModel(name: "indigoA100", backgroundColor: .indigoA100, foregroundColor: .black),
      ColorRowViewModel(name: "indigoA200", backgroundColor: .indigoA200),
      ColorRowViewModel(name: "indigoA400", backgroundColor: .indigoA400),
      ColorRowViewModel(name: "indigoA700", backgroundColor: .indigoA700),
    ]
  }
  
  static func blue() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "blue50", backgroundColor: .blue50, foregroundColor: .black),
      ColorRowViewModel(name: "blue100", backgroundColor: .blue100, foregroundColor: .black),
      ColorRowViewModel(name: "blue200", backgroundColor: .blue200, foregroundColor: .black),
      ColorRowViewModel(name: "blue300", backgroundColor: .blue300, foregroundColor: .black),
      ColorRowViewModel(name: "blue400", backgroundColor: .blue400, foregroundColor: .black),
      ColorRowViewModel(name: "blue500", backgroundColor: .blue500),
      ColorRowViewModel(name: "blue600", backgroundColor: .blue600),
      ColorRowViewModel(name: "blue700", backgroundColor: .blue700),
      ColorRowViewModel(name: "blue800", backgroundColor: .blue800),
      ColorRowViewModel(name: "blue900", backgroundColor: .blue900),
      ColorRowViewModel(name: "blueA100", backgroundColor: .blueA100, foregroundColor: .black),
      ColorRowViewModel(name: "blueA200", backgroundColor: .blueA200),
      ColorRowViewModel(name: "blueA400", backgroundColor: .blueA400),
      ColorRowViewModel(name: "blueA700", backgroundColor: .blueA700),
    ]
  }
  
  static func lightBlue() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "lightBlue50", backgroundColor: .lightBlue50, foregroundColor: .black),
      ColorRowViewModel(name: "lightBlue100", backgroundColor: .lightBlue100, foregroundColor: .black),
      ColorRowViewModel(name: "lightBlue200", backgroundColor: .lightBlue200, foregroundColor: .black),
      ColorRowViewModel(name: "lightBlue300", backgroundColor: .lightBlue300, foregroundColor: .black),
      ColorRowViewModel(name: "lightBlue400", backgroundColor: .lightBlue400, foregroundColor: .black),
      ColorRowViewModel(name: "lightBlue500", backgroundColor: .lightBlue500, foregroundColor: .black),
      ColorRowViewModel(name: "lightBlue600", backgroundColor: .lightBlue600),
      ColorRowViewModel(name: "lightBlue700", backgroundColor: .lightBlue700),
      ColorRowViewModel(name: "lightBlue800", backgroundColor: .lightBlue800),
      ColorRowViewModel(name: "lightBlue900", backgroundColor: .lightBlue900),
      ColorRowViewModel(name: "lightBlueA100", backgroundColor: .lightBlueA100, foregroundColor: .black),
      ColorRowViewModel(name: "lightBlueA200", backgroundColor: .lightBlueA200, foregroundColor: .black),
      ColorRowViewModel(name: "lightBlueA400", backgroundColor: .lightBlueA400, foregroundColor: .black),
      ColorRowViewModel(name: "lightBlueA700", backgroundColor: .lightBlueA700),
    ]
  }
  
  static func cyan() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "cyan50", backgroundColor: .cyan50, foregroundColor: .black),
      ColorRowViewModel(name: "cyan100", backgroundColor: .cyan100, foregroundColor: .black),
      ColorRowViewModel(name: "cyan200", backgroundColor: .cyan200, foregroundColor: .black),
      ColorRowViewModel(name: "cyan300", backgroundColor: .cyan300, foregroundColor: .black),
      ColorRowViewModel(name: "cyan400", backgroundColor: .cyan400, foregroundColor: .black),
      ColorRowViewModel(name: "cyan500", backgroundColor: .cyan500, foregroundColor: .black),
      ColorRowViewModel(name: "cyan600", backgroundColor: .cyan600, foregroundColor: .black),
      ColorRowViewModel(name: "cyan700", backgroundColor: .cyan700),
      ColorRowViewModel(name: "cyan800", backgroundColor: .cyan800),
      ColorRowViewModel(name: "cyan900", backgroundColor: .cyan900),
      ColorRowViewModel(name: "cyanA100", backgroundColor: .cyanA100, foregroundColor: .black),
      ColorRowViewModel(name: "cyanA200", backgroundColor: .cyanA200, foregroundColor: .black),
      ColorRowViewModel(name: "cyanA400", backgroundColor: .cyanA400, foregroundColor: .black),
      ColorRowViewModel(name: "cyanA700", backgroundColor: .cyanA700, foregroundColor: .black),
    ]
  }
  
  static func teal() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "teal50", backgroundColor: .teal50, foregroundColor: .black),
      ColorRowViewModel(name: "teal100", backgroundColor: .teal100, foregroundColor: .black),
      ColorRowViewModel(name: "teal200", backgroundColor: .teal200, foregroundColor: .black),
      ColorRowViewModel(name: "teal300", backgroundColor: .teal300, foregroundColor: .black),
      ColorRowViewModel(name: "teal400", backgroundColor: .teal400, foregroundColor: .black),
      ColorRowViewModel(name: "teal500", backgroundColor: .teal500),
      ColorRowViewModel(name: "teal600", backgroundColor: .teal600),
      ColorRowViewModel(name: "teal700", backgroundColor: .teal700),
      ColorRowViewModel(name: "teal800", backgroundColor: .teal800),
      ColorRowViewModel(name: "teal900", backgroundColor: .teal900),
      ColorRowViewModel(name: "tealA100", backgroundColor: .tealA100, foregroundColor: .black),
      ColorRowViewModel(name: "tealA200", backgroundColor: .tealA200, foregroundColor: .black),
      ColorRowViewModel(name: "tealA400", backgroundColor: .tealA400, foregroundColor: .black),
      ColorRowViewModel(name: "tealA700", backgroundColor: .tealA700, foregroundColor: .black),
    ]
  }
  
  static func green() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "green50", backgroundColor: .green50, foregroundColor: .black),
      ColorRowViewModel(name: "green100", backgroundColor: .green100, foregroundColor: .black),
      ColorRowViewModel(name: "green200", backgroundColor: .green200, foregroundColor: .black),
      ColorRowViewModel(name: "green300", backgroundColor: .green300, foregroundColor: .black),
      ColorRowViewModel(name: "green400", backgroundColor: .green400, foregroundColor: .black),
      ColorRowViewModel(name: "green500", backgroundColor: .green500, foregroundColor: .black),
      ColorRowViewModel(name: "green600", backgroundColor: .green600),
      ColorRowViewModel(name: "green700", backgroundColor: .green700),
      ColorRowViewModel(name: "green800", backgroundColor: .green800),
      ColorRowViewModel(name: "green900", backgroundColor: .green900),
      ColorRowViewModel(name: "greenA100", backgroundColor: .greenA100, foregroundColor: .black),
      ColorRowViewModel(name: "greenA200", backgroundColor: .greenA200, foregroundColor: .black),
      ColorRowViewModel(name: "greenA400", backgroundColor: .greenA400, foregroundColor: .black),
      ColorRowViewModel(name: "greenA700", backgroundColor: .greenA700, foregroundColor: .black),
    ]
  }
  
  static func lightGreen() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "lightGreen50", backgroundColor: .lightGreen50, foregroundColor: .black),
      ColorRowViewModel(name: "lightGreen100", backgroundColor: .lightGreen100, foregroundColor: .black),
      ColorRowViewModel(name: "lightGreen200", backgroundColor: .lightGreen200, foregroundColor: .black),
      ColorRowViewModel(name: "lightGreen300", backgroundColor: .lightGreen300, foregroundColor: .black),
      ColorRowViewModel(name: "lightGreen400", backgroundColor: .lightGreen400, foregroundColor: .black),
      ColorRowViewModel(name: "lightGreen500", backgroundColor: .lightGreen500, foregroundColor: .black),
      ColorRowViewModel(name: "lightGreen600", backgroundColor: .lightGreen600, foregroundColor: .black),
      ColorRowViewModel(name: "lightGreen700", backgroundColor: .lightGreen700),
      ColorRowViewModel(name: "lightGreen800", backgroundColor: .lightGreen800),
      ColorRowViewModel(name: "lightGreen900", backgroundColor: .lightGreen900),
      ColorRowViewModel(name: "lightGreenA100", backgroundColor: .lightGreenA100, foregroundColor: .black),
      ColorRowViewModel(name: "lightGreenA200", backgroundColor: .lightGreenA200, foregroundColor: .black),
      ColorRowViewModel(name: "lightGreenA400", backgroundColor: .lightGreenA400, foregroundColor: .black),
      ColorRowViewModel(name: "lightGreenA700", backgroundColor: .lightGreenA700, foregroundColor: .black),
    ]
  }
  
  static func lime() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "lime50", backgroundColor: .lime50, foregroundColor: .black),
      ColorRowViewModel(name: "lime100", backgroundColor: .lime100, foregroundColor: .black),
      ColorRowViewModel(name: "lime200", backgroundColor: .lime200, foregroundColor: .black),
      ColorRowViewModel(name: "lime300", backgroundColor: .lime300, foregroundColor: .black),
      ColorRowViewModel(name: "lime400", backgroundColor: .lime400, foregroundColor: .black),
      ColorRowViewModel(name: "lime500", backgroundColor: .lime500, foregroundColor: .black),
      ColorRowViewModel(name: "lime600", backgroundColor: .lime600, foregroundColor: .black),
      ColorRowViewModel(name: "lime700", backgroundColor: .lime700, foregroundColor: .black),
      ColorRowViewModel(name: "lime800", backgroundColor: .lime800, foregroundColor: .black),
      ColorRowViewModel(name: "lime900", backgroundColor: .lime900),
      ColorRowViewModel(name: "limeA100", backgroundColor: .limeA100, foregroundColor: .black),
      ColorRowViewModel(name: "limeA200", backgroundColor: .limeA200, foregroundColor: .black),
      ColorRowViewModel(name: "limeA400", backgroundColor: .limeA400, foregroundColor: .black),
      ColorRowViewModel(name: "limeA700", backgroundColor: .limeA700, foregroundColor: .black),
    ]
  }
  
  static func yellow() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "yellow50", backgroundColor: .yellow50, foregroundColor: .black),
      ColorRowViewModel(name: "yellow100", backgroundColor: .yellow100, foregroundColor: .black),
      ColorRowViewModel(name: "yellow200", backgroundColor: .yellow200, foregroundColor: .black),
      ColorRowViewModel(name: "yellow300", backgroundColor: .yellow300, foregroundColor: .black),
      ColorRowViewModel(name: "yellow400", backgroundColor: .yellow400, foregroundColor: .black),
      ColorRowViewModel(name: "yellow500", backgroundColor: .yellow500, foregroundColor: .black),
      ColorRowViewModel(name: "yellow600", backgroundColor: .yellow600, foregroundColor: .black),
      ColorRowViewModel(name: "yellow700", backgroundColor: .yellow700, foregroundColor: .black),
      ColorRowViewModel(name: "yellow800", backgroundColor: .yellow800, foregroundColor: .black),
      ColorRowViewModel(name: "yellow900", backgroundColor: .yellow900, foregroundColor: .black),
      ColorRowViewModel(name: "yellowA100", backgroundColor: .yellowA100, foregroundColor: .black),
      ColorRowViewModel(name: "yellowA200", backgroundColor: .yellowA200, foregroundColor: .black),
      ColorRowViewModel(name: "yellowA400", backgroundColor: .yellowA400, foregroundColor: .black),
      ColorRowViewModel(name: "yellowA700", backgroundColor: .yellowA700, foregroundColor: .black),
    ]
  }
  
  static func amber() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "amber50", backgroundColor: .amber50, foregroundColor: .black),
      ColorRowViewModel(name: "amber100", backgroundColor: .amber100, foregroundColor: .black),
      ColorRowViewModel(name: "amber200", backgroundColor: .amber200, foregroundColor: .black),
      ColorRowViewModel(name: "amber300", backgroundColor: .amber300, foregroundColor: .black),
      ColorRowViewModel(name: "amber400", backgroundColor: .amber400, foregroundColor: .black),
      ColorRowViewModel(name: "amber500", backgroundColor: .amber500, foregroundColor: .black),
      ColorRowViewModel(name: "amber600", backgroundColor: .amber600, foregroundColor: .black),
      ColorRowViewModel(name: "amber700", backgroundColor: .amber700, foregroundColor: .black),
      ColorRowViewModel(name: "amber800", backgroundColor: .amber800, foregroundColor: .black),
      ColorRowViewModel(name: "amber900", backgroundColor: .amber900, foregroundColor: .black),
      ColorRowViewModel(name: "amberA100", backgroundColor: .amberA100, foregroundColor: .black),
      ColorRowViewModel(name: "amberA200", backgroundColor: .amberA200, foregroundColor: .black),
      ColorRowViewModel(name: "amberA400", backgroundColor: .amberA400, foregroundColor: .black),
      ColorRowViewModel(name: "amberA700", backgroundColor: .amberA700, foregroundColor: .black),
    ]
  }
  
  static func orange() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "orange50", backgroundColor: .orange50, foregroundColor: .black),
      ColorRowViewModel(name: "orange100", backgroundColor: .orange100, foregroundColor: .black),
      ColorRowViewModel(name: "orange200", backgroundColor: .orange200, foregroundColor: .black),
      ColorRowViewModel(name: "orange300", backgroundColor: .orange300, foregroundColor: .black),
      ColorRowViewModel(name: "orange400", backgroundColor: .orange400, foregroundColor: .black),
      ColorRowViewModel(name: "orange500", backgroundColor: .orange500, foregroundColor: .black),
      ColorRowViewModel(name: "orange600", backgroundColor: .orange600, foregroundColor: .black),
      ColorRowViewModel(name: "orange700", backgroundColor: .orange700, foregroundColor: .black),
      ColorRowViewModel(name: "orange800", backgroundColor: .orange800),
      ColorRowViewModel(name: "orange900", backgroundColor: .orange900),
      ColorRowViewModel(name: "orangeA100", backgroundColor: .orangeA100, foregroundColor: .black),
      ColorRowViewModel(name: "orangeA200", backgroundColor: .orangeA200, foregroundColor: .black),
      ColorRowViewModel(name: "orangeA400", backgroundColor: .orangeA400, foregroundColor: .black),
      ColorRowViewModel(name: "orangeA700", backgroundColor: .orangeA700, foregroundColor: .black),
    ]
  }
  
  static func deepOrange() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "deepOrange50", backgroundColor: .deepOrange50, foregroundColor: .black),
      ColorRowViewModel(name: "deepOrange100", backgroundColor: .deepOrange100, foregroundColor: .black),
      ColorRowViewModel(name: "deepOrange200", backgroundColor: .deepOrange200, foregroundColor: .black),
      ColorRowViewModel(name: "deepOrange300", backgroundColor: .deepOrange300, foregroundColor: .black),
      ColorRowViewModel(name: "deepOrange400", backgroundColor: .deepOrange400, foregroundColor: .black),
      ColorRowViewModel(name: "deepOrange500", backgroundColor: .deepOrange500, foregroundColor: .black),
      ColorRowViewModel(name: "deepOrange600", backgroundColor: .deepOrange600),
      ColorRowViewModel(name: "deepOrange700", backgroundColor: .deepOrange700),
      ColorRowViewModel(name: "deepOrange800", backgroundColor: .deepOrange800),
      ColorRowViewModel(name: "deepOrange900", backgroundColor: .deepOrange900),
      ColorRowViewModel(name: "deepOrangeA100", backgroundColor: .deepOrangeA100, foregroundColor: .black),
      ColorRowViewModel(name: "deepOrangeA200", backgroundColor: .deepOrangeA200, foregroundColor: .black),
      ColorRowViewModel(name: "deepOrangeA400", backgroundColor: .deepOrangeA400),
      ColorRowViewModel(name: "deepOrangeA700", backgroundColor: .deepOrangeA700),
    ]
  }
  
  static func brown() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "brown50", backgroundColor: .brown50, foregroundColor: .black),
      ColorRowViewModel(name: "brown100", backgroundColor: .brown100, foregroundColor: .black),
      ColorRowViewModel(name: "brown200", backgroundColor: .brown200, foregroundColor: .black),
      ColorRowViewModel(name: "brown300", backgroundColor: .brown300),
      ColorRowViewModel(name: "brown400", backgroundColor: .brown400),
      ColorRowViewModel(name: "brown500", backgroundColor: .brown500),
      ColorRowViewModel(name: "brown600", backgroundColor: .brown600),
      ColorRowViewModel(name: "brown700", backgroundColor: .brown700),
      ColorRowViewModel(name: "brown800", backgroundColor: .brown800),
      ColorRowViewModel(name: "brown900", backgroundColor: .brown900),
    ]
  }
  
  static func grey() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "grey50", backgroundColor: .grey50, foregroundColor: .black),
      ColorRowViewModel(name: "grey100", backgroundColor: .grey100, foregroundColor: .black),
      ColorRowViewModel(name: "grey200", backgroundColor: .grey200, foregroundColor: .black),
      ColorRowViewModel(name: "grey300", backgroundColor: .grey300, foregroundColor: .black),
      ColorRowViewModel(name: "grey400", backgroundColor: .grey400, foregroundColor: .black),
      ColorRowViewModel(name: "grey500", backgroundColor: .grey500, foregroundColor: .black),
      ColorRowViewModel(name: "grey600", backgroundColor: .grey600),
      ColorRowViewModel(name: "grey700", backgroundColor: .grey700),
      ColorRowViewModel(name: "grey800", backgroundColor: .grey800),
      ColorRowViewModel(name: "grey900", backgroundColor: .grey900),
    ]
  }
  
  static func blueGrey() -> [ColorRowViewModel] {
    [
      ColorRowViewModel(name: "blueGrey50", backgroundColor: .blueGrey50, foregroundColor: .black),
      ColorRowViewModel(name: "blueGrey100", backgroundColor: .blueGrey100, foregroundColor: .black),
      ColorRowViewModel(name: "blueGrey200", backgroundColor: .blueGrey200, foregroundColor: .black),
      ColorRowViewModel(name: "blueGrey300", backgroundColor: .blueGrey300, foregroundColor: .black),
      ColorRowViewModel(name: "blueGrey400", backgroundColor: .blueGrey400),
      ColorRowViewModel(name: "blueGrey500", backgroundColor: .blueGrey500),
      ColorRowViewModel(name: "blueGrey600", backgroundColor: .blueGrey600),
      ColorRowViewModel(name: "blueGrey700", backgroundColor: .blueGrey700),
      ColorRowViewModel(name: "blueGrey800", backgroundColor: .blueGrey800),
      ColorRowViewModel(name: "blueGrey900", backgroundColor: .blueGrey900),
    ]
  }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct ColorRow: View {
  let viewModel: ColorRowViewModel
  
  var body: some View {
    HStack {
      Spacer()
      Text(viewModel.name)
        .foregroundColor(viewModel.foregroundColor)
      Spacer()
    }
    .background(viewModel.backgroundColor)
    .frame(maxWidth: .infinity,
           alignment: .topLeading)
  }
}
