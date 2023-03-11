//
//  MaterialDesignPreview.swift
//  
//
//  Created by SwiftMan on 2023/01/25.
//

import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct ColorViewModel: Hashable, Identifiable {
  var id: String {
    title
  }
  
  let title: String
  let rowModels: [ColorRowViewModel]
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct ColorView: View {
  let viewModel: ColorViewModel
  
  var body: some View {
    VStack {
      Section {
        ForEach(viewModel.rowModels, id: \.name) { viewModel in
          ColorRow(viewModel: viewModel)
        }
      } header: {
        Text(viewModel.title)
      }
    }
  }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct MaterialDesignColorBoard: View {
  var columns: [GridItem]
  
  let viewModels: [ColorViewModel] = [
    ColorViewModel(title: "Red", rowModels: ColorRowViewModel.red()),
    ColorViewModel(title: "Pink", rowModels: ColorRowViewModel.pink()),
    ColorViewModel(title: "Purple", rowModels: ColorRowViewModel.purple()),
    ColorViewModel(title: "Deep Purple", rowModels: ColorRowViewModel.deepPurple()),
    ColorViewModel(title: "Indigo", rowModels: ColorRowViewModel.indigo()),
    ColorViewModel(title: "Blue", rowModels: ColorRowViewModel.blue()),
    ColorViewModel(title: "Light Blue", rowModels: ColorRowViewModel.lightBlue()),
    ColorViewModel(title: "Cyan", rowModels: ColorRowViewModel.cyan()),
    ColorViewModel(title: "Teal", rowModels: ColorRowViewModel.teal()),
    ColorViewModel(title: "Green", rowModels: ColorRowViewModel.green()),
    ColorViewModel(title: "Light Green", rowModels: ColorRowViewModel.lightGreen()),
    ColorViewModel(title: "Lime", rowModels: ColorRowViewModel.lime()),
    ColorViewModel(title: "Yellow", rowModels: ColorRowViewModel.yellow()),
    ColorViewModel(title: "Amber", rowModels: ColorRowViewModel.amber()),
    ColorViewModel(title: "Orange", rowModels: ColorRowViewModel.orange()),
    ColorViewModel(title: "Deep Orange", rowModels: ColorRowViewModel.deepOrange()),
    ColorViewModel(title: "Brown", rowModels: ColorRowViewModel.brown()),
    ColorViewModel(title: "Grey", rowModels: ColorRowViewModel.grey()),
    ColorViewModel(title: "Blue Grey", rowModels: ColorRowViewModel.blueGrey()),
  ]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns) {
        ForEach(viewModels) { viewModel in
          ColorView(viewModel: viewModel)
        }
      }
    }
  }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct MaterialDesignColorBoard_Previews: PreviewProvider {
  static var columns: [GridItem] {
    let count: Int
    #if os(macOS)
    count = 6
    #elseif os(iOS)
    let idiom = UIDevice.current.userInterfaceIdiom
    
    switch idiom {
    case .phone:
      count = 2
    case .pad:
      count = 3
    default:
      count = 1
    }
    #elseif os(tvOS)
    count = 4
    #else
    count = 1
    #endif
    
    return Array(repeating: GridItem(.flexible(minimum: 50,
                                               maximum: 200)),
                 count: count)
  }
  
  static var previews: some View {
    MaterialDesignColorBoard(columns: columns)
      .preferredColorScheme(.dark)
      .frame(width: 1200, height: 700)
    
  }
}
