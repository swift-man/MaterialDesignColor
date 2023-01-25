//
//  MaterialDesignPreview.swift
//  
//
//  Created by SwiftMan on 2023/01/25.
//

import SwiftUI

struct Model {
  let name: String
  let backgroundColor: Color
  let foregroundColor: Color
  
  init(name: String, backgroundColor: Color, foregroundColor: Color = .white) {
    self.name = name
    self.backgroundColor = backgroundColor
    self.foregroundColor = foregroundColor
  }
}

struct ColorView: View {
  let sectionTitle: String
  let array: [Model]
  
  var body: some View {
    VStack {
      Section(sectionTitle) {
        ForEach(array, id: \.name) { element in
          HStack {
            Spacer()
            Text(element.name)
              .foregroundColor(element.foregroundColor)
            Spacer()
          }
          .background(element.backgroundColor)
          .frame(maxWidth: .infinity,
                 alignment: .topLeading)
        }
      }
    }
  }
}

struct LeftSection: View {
  let sectionTitle: String
  let array: [String]
  
  var body: some View {
    VStack {
      Section(sectionTitle) {
        ForEach(array, id: \.self) { element in
          HStack {
            Spacer()
            Text(element)
            Spacer()
          }
          .frame(maxWidth: .infinity,
                 alignment: .topLeading)
        }
      }
    }
  }
}

struct MaterialDesignColorBoard: View {
  var body: some View {
    VStack {
      HStack {
        LeftSection(sectionTitle: " ",
                    array: [
                      "50",
                      "100",
                      "200",
                      "300",
                      "400",
                      "500",
                      "600",
                      "700",
                      "800",
                      "900",
                      "A100",
                      "A200",
                      "A400",
                      "A700",
                    ])
        .frame(width: 50)
        ColorView(sectionTitle: "Red",
                  array: [
                    Model(name: "red50", backgroundColor: .red50, foregroundColor: .black),
                    Model(name: "red100", backgroundColor: .red100, foregroundColor: .black),
                    Model(name: "red200", backgroundColor: .red200, foregroundColor: .black),
                    Model(name: "red300", backgroundColor: .red300, foregroundColor: .black),
                    Model(name: "red400", backgroundColor: .red400),
                    Model(name: "red500", backgroundColor: .red500),
                    Model(name: "red600", backgroundColor: .red600),
                    Model(name: "red700", backgroundColor: .red700),
                    Model(name: "red800", backgroundColor: .red800),
                    Model(name: "red900", backgroundColor: .red900),
                    Model(name: "redA100", backgroundColor: .redA100, foregroundColor: .black),
                    Model(name: "redA200", backgroundColor: .redA200),
                    Model(name: "redA400", backgroundColor: .redA400),
                    Model(name: "redA700", backgroundColor: .redA700),
                  ])
        ColorView(sectionTitle: "Pink",
                  array: [
                    Model(name: "pink50", backgroundColor: .pink50, foregroundColor: .black),
                    Model(name: "pink100", backgroundColor: .pink100, foregroundColor: .black),
                    Model(name: "pink200", backgroundColor: .pink200, foregroundColor: .black),
                    Model(name: "pink300", backgroundColor: .pink300),
                    Model(name: "pink400", backgroundColor: .pink400),
                    Model(name: "pink500", backgroundColor: .pink500),
                    Model(name: "pink600", backgroundColor: .pink600),
                    Model(name: "pink700", backgroundColor: .pink700),
                    Model(name: "pink800", backgroundColor: .pink800),
                    Model(name: "pink900", backgroundColor: .pink900),
                    Model(name: "pinkA100", backgroundColor: .pinkA100, foregroundColor: .black),
                    Model(name: "pinkA200", backgroundColor: .pinkA200),
                    Model(name: "pinkA400", backgroundColor: .pinkA400),
                    Model(name: "pinkA700", backgroundColor: .pinkA700),
                  ])
        ColorView(sectionTitle: "Purple",
                  array: [
                    Model(name: "purple50", backgroundColor: .purple50, foregroundColor: .black),
                    Model(name: "purple100", backgroundColor: .purple100, foregroundColor: .black),
                    Model(name: "purple200", backgroundColor: .purple200, foregroundColor: .black),
                    Model(name: "purple300", backgroundColor: .purple300),
                    Model(name: "purple400", backgroundColor: .purple400),
                    Model(name: "purple500", backgroundColor: .purple500),
                    Model(name: "purple600", backgroundColor: .purple600),
                    Model(name: "purple700", backgroundColor: .purple700),
                    Model(name: "purple800", backgroundColor: .purple800),
                    Model(name: "purple900", backgroundColor: .purple900),
                    Model(name: "purpleA100", backgroundColor: .purpleA100, foregroundColor: .black),
                    Model(name: "purpleA200", backgroundColor: .purpleA200),
                    Model(name: "purpleA400", backgroundColor: .purpleA400),
                    Model(name: "purpleA700", backgroundColor: .purpleA700),
                  ])
        ColorView(sectionTitle: "Deep Purple",
                  array: [
                    Model(name: "deepPurple50", backgroundColor: .deepPurple50, foregroundColor: .black),
                    Model(name: "deepPurple100", backgroundColor: .deepPurple100, foregroundColor: .black),
                    Model(name: "deepPurple200", backgroundColor: .deepPurple200, foregroundColor: .black),
                    Model(name: "deepPurple300", backgroundColor: .deepPurple300),
                    Model(name: "deepPurple400", backgroundColor: .deepPurple400),
                    Model(name: "deepPurple500", backgroundColor: .deepPurple500),
                    Model(name: "deepPurple600", backgroundColor: .deepPurple600),
                    Model(name: "deepPurple700", backgroundColor: .deepPurple700),
                    Model(name: "deepPurple800", backgroundColor: .deepPurple800),
                    Model(name: "deepPurple900", backgroundColor: .deepPurple900),
                    Model(name: "deepPurpleA100", backgroundColor: .deepPurpleA100, foregroundColor: .black),
                    Model(name: "deepPurpleA200", backgroundColor: .deepPurpleA200),
                    Model(name: "deepPurpleA400", backgroundColor: .deepPurpleA400),
                    Model(name: "deepPurpleA700", backgroundColor: .deepPurpleA700),
                  ])
        ColorView(sectionTitle: "Indigo",
                  array: [
                    Model(name: "indigo50", backgroundColor: .indigo50, foregroundColor: .black),
                    Model(name: "indigo100", backgroundColor: .indigo100, foregroundColor: .black),
                    Model(name: "indigo200", backgroundColor: .indigo200, foregroundColor: .black),
                    Model(name: "indigo300", backgroundColor: .indigo300),
                    Model(name: "indigo400", backgroundColor: .indigo400),
                    Model(name: "indigo500", backgroundColor: .indigo500),
                    Model(name: "indigo600", backgroundColor: .indigo600),
                    Model(name: "indigo700", backgroundColor: .indigo700),
                    Model(name: "indigo800", backgroundColor: .indigo800),
                    Model(name: "indigo900", backgroundColor: .indigo900),
                    Model(name: "indigoA100", backgroundColor: .indigoA100, foregroundColor: .black),
                    Model(name: "indigoA200", backgroundColor: .indigoA200),
                    Model(name: "indigoA400", backgroundColor: .indigoA400),
                    Model(name: "indigoA700", backgroundColor: .indigoA700),
                  ])
        ColorView(sectionTitle: "Blue",
                  array: [
                    Model(name: "blue50", backgroundColor: .blue50, foregroundColor: .black),
                    Model(name: "blue100", backgroundColor: .blue100, foregroundColor: .black),
                    Model(name: "blue200", backgroundColor: .blue200, foregroundColor: .black),
                    Model(name: "blue300", backgroundColor: .blue300, foregroundColor: .black),
                    Model(name: "blue400", backgroundColor: .blue400, foregroundColor: .black),
                    Model(name: "blue500", backgroundColor: .blue500),
                    Model(name: "blue600", backgroundColor: .blue600),
                    Model(name: "blue700", backgroundColor: .blue700),
                    Model(name: "blue800", backgroundColor: .blue800),
                    Model(name: "blue900", backgroundColor: .blue900),
                    Model(name: "blueA100", backgroundColor: .blueA100, foregroundColor: .black),
                    Model(name: "blueA200", backgroundColor: .blueA200),
                    Model(name: "blueA400", backgroundColor: .blueA400),
                    Model(name: "blueA700", backgroundColor: .blueA700),
                  ])
        ColorView(sectionTitle: "Light Blue",
                  array: [
                    Model(name: "lightBlue50", backgroundColor: .lightBlue50, foregroundColor: .black),
                    Model(name: "lightBlue100", backgroundColor: .lightBlue100, foregroundColor: .black),
                    Model(name: "lightBlue200", backgroundColor: .lightBlue200, foregroundColor: .black),
                    Model(name: "lightBlue300", backgroundColor: .lightBlue300, foregroundColor: .black),
                    Model(name: "lightBlue400", backgroundColor: .lightBlue400, foregroundColor: .black),
                    Model(name: "lightBlue500", backgroundColor: .lightBlue500, foregroundColor: .black),
                    Model(name: "lightBlue600", backgroundColor: .lightBlue600),
                    Model(name: "lightBlue700", backgroundColor: .lightBlue700),
                    Model(name: "lightBlue800", backgroundColor: .lightBlue800),
                    Model(name: "lightBlue900", backgroundColor: .lightBlue900),
                    Model(name: "lightBlueA100", backgroundColor: .lightBlueA100, foregroundColor: .black),
                    Model(name: "lightBlueA200", backgroundColor: .lightBlueA200, foregroundColor: .black),
                    Model(name: "lightBlueA400", backgroundColor: .lightBlueA400, foregroundColor: .black),
                    Model(name: "lightBlueA700", backgroundColor: .lightBlueA700),
                  ])
        ColorView(sectionTitle: "Cyan",
                  array: [
                    Model(name: "cyan50", backgroundColor: .cyan50, foregroundColor: .black),
                    Model(name: "cyan100", backgroundColor: .cyan100, foregroundColor: .black),
                    Model(name: "cyan200", backgroundColor: .cyan200, foregroundColor: .black),
                    Model(name: "cyan300", backgroundColor: .cyan300, foregroundColor: .black),
                    Model(name: "cyan400", backgroundColor: .cyan400, foregroundColor: .black),
                    Model(name: "cyan500", backgroundColor: .cyan500, foregroundColor: .black),
                    Model(name: "cyan600", backgroundColor: .cyan600, foregroundColor: .black),
                    Model(name: "cyan700", backgroundColor: .cyan700),
                    Model(name: "cyan800", backgroundColor: .cyan800),
                    Model(name: "cyan900", backgroundColor: .cyan900),
                    Model(name: "cyanA100", backgroundColor: .cyanA100, foregroundColor: .black),
                    Model(name: "cyanA200", backgroundColor: .cyanA200, foregroundColor: .black),
                    Model(name: "cyanA400", backgroundColor: .cyanA400, foregroundColor: .black),
                    Model(name: "cyanA700", backgroundColor: .cyanA700, foregroundColor: .black),
                  ])
      }
      HStack {
        LeftSection(sectionTitle: " ",
                    array: [
                      "50",
                      "100",
                      "200",
                      "300",
                      "400",
                      "500",
                      "600",
                      "700",
                      "800",
                      "900",
                      "A100",
                      "A200",
                      "A400",
                      "A700",
                    ])
        .frame(width: 50)
        ColorView(sectionTitle: "Teal",
                  array: [
                    Model(name: "teal50", backgroundColor: .teal50, foregroundColor: .black),
                    Model(name: "teal100", backgroundColor: .teal100, foregroundColor: .black),
                    Model(name: "teal200", backgroundColor: .teal200, foregroundColor: .black),
                    Model(name: "teal300", backgroundColor: .teal300, foregroundColor: .black),
                    Model(name: "teal400", backgroundColor: .teal400, foregroundColor: .black),
                    Model(name: "teal500", backgroundColor: .teal500),
                    Model(name: "teal600", backgroundColor: .teal600),
                    Model(name: "teal700", backgroundColor: .teal700),
                    Model(name: "teal800", backgroundColor: .teal800),
                    Model(name: "teal900", backgroundColor: .teal900),
                    Model(name: "tealA100", backgroundColor: .tealA100, foregroundColor: .black),
                    Model(name: "tealA200", backgroundColor: .tealA200, foregroundColor: .black),
                    Model(name: "tealA400", backgroundColor: .tealA400, foregroundColor: .black),
                    Model(name: "tealA700", backgroundColor: .tealA700, foregroundColor: .black),
                  ])
        ColorView(sectionTitle: "Green",
                  array: [
                    Model(name: "green50", backgroundColor: .green50, foregroundColor: .black),
                    Model(name: "green100", backgroundColor: .green100, foregroundColor: .black),
                    Model(name: "green200", backgroundColor: .green200, foregroundColor: .black),
                    Model(name: "green300", backgroundColor: .green300, foregroundColor: .black),
                    Model(name: "green400", backgroundColor: .green400, foregroundColor: .black),
                    Model(name: "green500", backgroundColor: .green500, foregroundColor: .black),
                    Model(name: "green600", backgroundColor: .green600),
                    Model(name: "green700", backgroundColor: .green700),
                    Model(name: "green800", backgroundColor: .green800),
                    Model(name: "green900", backgroundColor: .green900),
                    Model(name: "greenA100", backgroundColor: .greenA100, foregroundColor: .black),
                    Model(name: "greenA200", backgroundColor: .greenA200, foregroundColor: .black),
                    Model(name: "greenA400", backgroundColor: .greenA400, foregroundColor: .black),
                    Model(name: "greenA700", backgroundColor: .greenA700, foregroundColor: .black),
                  ])
        ColorView(sectionTitle: "Light Green",
                  array: [
                    Model(name: "lightGreen50", backgroundColor: .lightGreen50, foregroundColor: .black),
                    Model(name: "lightGreen100", backgroundColor: .lightGreen100, foregroundColor: .black),
                    Model(name: "lightGreen200", backgroundColor: .lightGreen200, foregroundColor: .black),
                    Model(name: "lightGreen300", backgroundColor: .lightGreen300, foregroundColor: .black),
                    Model(name: "lightGreen400", backgroundColor: .lightGreen400, foregroundColor: .black),
                    Model(name: "lightGreen500", backgroundColor: .lightGreen500, foregroundColor: .black),
                    Model(name: "lightGreen600", backgroundColor: .lightGreen600, foregroundColor: .black),
                    Model(name: "lightGreen700", backgroundColor: .lightGreen700),
                    Model(name: "lightGreen800", backgroundColor: .lightGreen800),
                    Model(name: "lightGreen900", backgroundColor: .lightGreen900),
                    Model(name: "lightGreenA100", backgroundColor: .lightGreenA100, foregroundColor: .black),
                    Model(name: "lightGreenA200", backgroundColor: .lightGreenA200, foregroundColor: .black),
                    Model(name: "lightGreenA400", backgroundColor: .lightGreenA400, foregroundColor: .black),
                    Model(name: "lightGreenA700", backgroundColor: .lightGreenA700, foregroundColor: .black),
                  ])
        ColorView(sectionTitle: "Lime",
                  array: [
                    Model(name: "lime50", backgroundColor: .lime50, foregroundColor: .black),
                    Model(name: "lime100", backgroundColor: .lime100, foregroundColor: .black),
                    Model(name: "lime200", backgroundColor: .lime200, foregroundColor: .black),
                    Model(name: "lime300", backgroundColor: .lime300, foregroundColor: .black),
                    Model(name: "lime400", backgroundColor: .lime400, foregroundColor: .black),
                    Model(name: "lime500", backgroundColor: .lime500, foregroundColor: .black),
                    Model(name: "lime600", backgroundColor: .lime600, foregroundColor: .black),
                    Model(name: "lime700", backgroundColor: .lime700, foregroundColor: .black),
                    Model(name: "lime800", backgroundColor: .lime800, foregroundColor: .black),
                    Model(name: "lime900", backgroundColor: .lime900),
                    Model(name: "limeA100", backgroundColor: .limeA100, foregroundColor: .black),
                    Model(name: "limeA200", backgroundColor: .limeA200, foregroundColor: .black),
                    Model(name: "limeA400", backgroundColor: .limeA400, foregroundColor: .black),
                    Model(name: "limeA700", backgroundColor: .limeA700, foregroundColor: .black),
                  ])
        ColorView(sectionTitle: "Yellow",
                  array: [
                    Model(name: "yellow50", backgroundColor: .yellow50, foregroundColor: .black),
                    Model(name: "yellow100", backgroundColor: .yellow100, foregroundColor: .black),
                    Model(name: "yellow200", backgroundColor: .yellow200, foregroundColor: .black),
                    Model(name: "yellow300", backgroundColor: .yellow300, foregroundColor: .black),
                    Model(name: "yellow400", backgroundColor: .yellow400, foregroundColor: .black),
                    Model(name: "yellow500", backgroundColor: .yellow500, foregroundColor: .black),
                    Model(name: "yellow600", backgroundColor: .yellow600, foregroundColor: .black),
                    Model(name: "yellow700", backgroundColor: .yellow700, foregroundColor: .black),
                    Model(name: "yellow800", backgroundColor: .yellow800, foregroundColor: .black),
                    Model(name: "yellow900", backgroundColor: .yellow900, foregroundColor: .black),
                    Model(name: "yellowA100", backgroundColor: .yellowA100, foregroundColor: .black),
                    Model(name: "yellowA200", backgroundColor: .yellowA200, foregroundColor: .black),
                    Model(name: "yellowA400", backgroundColor: .yellowA400, foregroundColor: .black),
                    Model(name: "yellowA700", backgroundColor: .yellowA700, foregroundColor: .black),
                  ])
        ColorView(sectionTitle: "Amber",
                  array: [
                    Model(name: "amber50", backgroundColor: .amber50, foregroundColor: .black),
                    Model(name: "amber100", backgroundColor: .amber100, foregroundColor: .black),
                    Model(name: "amber200", backgroundColor: .amber200, foregroundColor: .black),
                    Model(name: "amber300", backgroundColor: .amber300, foregroundColor: .black),
                    Model(name: "amber400", backgroundColor: .amber400, foregroundColor: .black),
                    Model(name: "amber500", backgroundColor: .amber500, foregroundColor: .black),
                    Model(name: "amber600", backgroundColor: .amber600, foregroundColor: .black),
                    Model(name: "amber700", backgroundColor: .amber700, foregroundColor: .black),
                    Model(name: "amber800", backgroundColor: .amber800, foregroundColor: .black),
                    Model(name: "amber900", backgroundColor: .amber900, foregroundColor: .black),
                    Model(name: "amberA100", backgroundColor: .amberA100, foregroundColor: .black),
                    Model(name: "amberA200", backgroundColor: .amberA200, foregroundColor: .black),
                    Model(name: "amberA400", backgroundColor: .amberA400, foregroundColor: .black),
                    Model(name: "amberA700", backgroundColor: .amberA700, foregroundColor: .black),
                  ])
        ColorView(sectionTitle: "Orange",
                  array: [
                    Model(name: "orange50", backgroundColor: .orange50, foregroundColor: .black),
                    Model(name: "orange100", backgroundColor: .orange100, foregroundColor: .black),
                    Model(name: "orange200", backgroundColor: .orange200, foregroundColor: .black),
                    Model(name: "orange300", backgroundColor: .orange300, foregroundColor: .black),
                    Model(name: "orange400", backgroundColor: .orange400, foregroundColor: .black),
                    Model(name: "orange500", backgroundColor: .orange500, foregroundColor: .black),
                    Model(name: "orange600", backgroundColor: .orange600, foregroundColor: .black),
                    Model(name: "orange700", backgroundColor: .orange700, foregroundColor: .black),
                    Model(name: "orange800", backgroundColor: .orange800),
                    Model(name: "orange900", backgroundColor: .orange900),
                    Model(name: "orangeA100", backgroundColor: .orangeA100, foregroundColor: .black),
                    Model(name: "orangeA200", backgroundColor: .orangeA200, foregroundColor: .black),
                    Model(name: "orangeA400", backgroundColor: .orangeA400, foregroundColor: .black),
                    Model(name: "orangeA700", backgroundColor: .orangeA700, foregroundColor: .black),
                  ])
        ColorView(sectionTitle: "Deep Orange",
                  array: [
                    Model(name: "deepOrange50", backgroundColor: .deepOrange50, foregroundColor: .black),
                    Model(name: "deepOrange100", backgroundColor: .deepOrange100, foregroundColor: .black),
                    Model(name: "deepOrange200", backgroundColor: .deepOrange200, foregroundColor: .black),
                    Model(name: "deepOrange300", backgroundColor: .deepOrange300, foregroundColor: .black),
                    Model(name: "deepOrange400", backgroundColor: .deepOrange400, foregroundColor: .black),
                    Model(name: "deepOrange500", backgroundColor: .deepOrange500, foregroundColor: .black),
                    Model(name: "deepOrange600", backgroundColor: .deepOrange600),
                    Model(name: "deepOrange700", backgroundColor: .deepOrange700),
                    Model(name: "deepOrange800", backgroundColor: .deepOrange800),
                    Model(name: "deepOrange900", backgroundColor: .deepOrange900),
                    Model(name: "deepOrangeA100", backgroundColor: .deepOrangeA100, foregroundColor: .black),
                    Model(name: "deepOrangeA200", backgroundColor: .deepOrangeA200, foregroundColor: .black),
                    Model(name: "deepOrangeA400", backgroundColor: .deepOrangeA400),
                    Model(name: "deepOrangeA700", backgroundColor: .deepOrangeA700),
                  ])
      }
      HStack {
        LeftSection(sectionTitle: " ",
                    array: [
                      "50",
                      "100",
                      "200",
                      "300",
                      "400",
                      "500",
                      "600",
                      "700",
                      "800",
                      "900",
                    ])
        .frame(width: 50)
        ColorView(sectionTitle: "Brown",
                  array: [
                    Model(name: "brown50", backgroundColor: .brown50, foregroundColor: .black),
                    Model(name: "brown100", backgroundColor: .brown100, foregroundColor: .black),
                    Model(name: "brown200", backgroundColor: .brown200, foregroundColor: .black),
                    Model(name: "brown300", backgroundColor: .brown300),
                    Model(name: "brown400", backgroundColor: .brown400),
                    Model(name: "brown500", backgroundColor: .brown500),
                    Model(name: "brown600", backgroundColor: .brown600),
                    Model(name: "brown700", backgroundColor: .brown700),
                    Model(name: "brown800", backgroundColor: .brown800),
                    Model(name: "brown900", backgroundColor: .brown900),
                  ])
        .frame(width: 136)
        ColorView(sectionTitle: "Grey",
                  array: [
                    Model(name: "grey50", backgroundColor: .grey50, foregroundColor: .black),
                    Model(name: "grey100", backgroundColor: .grey100, foregroundColor: .black),
                    Model(name: "grey200", backgroundColor: .grey200, foregroundColor: .black),
                    Model(name: "grey300", backgroundColor: .grey300, foregroundColor: .black),
                    Model(name: "grey400", backgroundColor: .grey400, foregroundColor: .black),
                    Model(name: "grey500", backgroundColor: .grey500, foregroundColor: .black),
                    Model(name: "grey600", backgroundColor: .grey600),
                    Model(name: "grey700", backgroundColor: .grey700),
                    Model(name: "grey800", backgroundColor: .grey800),
                    Model(name: "grey900", backgroundColor: .grey900),
                  ])
        .frame(width: 136)
        ColorView(sectionTitle: "Blue Grey",
                  array: [
                    Model(name: "blueGrey50", backgroundColor: .blueGrey50, foregroundColor: .black),
                    Model(name: "blueGrey100", backgroundColor: .blueGrey100, foregroundColor: .black),
                    Model(name: "blueGrey200", backgroundColor: .blueGrey200, foregroundColor: .black),
                    Model(name: "blueGrey300", backgroundColor: .blueGrey300, foregroundColor: .black),
                    Model(name: "blueGrey400", backgroundColor: .blueGrey400),
                    Model(name: "blueGrey500", backgroundColor: .blueGrey500),
                    Model(name: "blueGrey600", backgroundColor: .blueGrey600),
                    Model(name: "blueGrey700", backgroundColor: .blueGrey700),
                    Model(name: "blueGrey800", backgroundColor: .blueGrey800),
                    Model(name: "blueGrey900", backgroundColor: .blueGrey900),
                  ])
        .frame(width: 136)
        Spacer()
      }
    }
  }
}

struct MaterialDesignColorBoard_Previews: PreviewProvider {
  static var previews: some View {
    MaterialDesignColorBoard()
      .frame(width: 1200, height: 700)
  }
}
