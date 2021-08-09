//
//  ContentView.swift
//  GridView
//
//  Created by 민성홍 on 2021/08/09.
//

import SwiftUI

enum GridType: CaseIterable {
    case single
    case double
    case tripple
    case adaptive

    var columns: [GridItem] {
        switch self {
        case .single:
            return [GridItem(.flexible())]
        case .double:
            return [GridItem(.flexible()),
                    GridItem(.flexible())
            ]
        case .tripple:
            return [GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
            ]
        case .adaptive:
            return [GridItem(.adaptive(minimum: 70))]
        }
    }
}

struct ContentView: View {

    var items = Item.dummyData

    @State private var selectedGridType: GridType = .single

    var body: some View {
        VStack {
            GridTypePicker(gridType: $selectedGridType)

            ScrollView {
                LazyVGrid(columns: selectedGridType.columns, content: {
                    ForEach(items) { item in

                        switch selectedGridType {
                        case .single,
                             .double:
                            SingleRow(item: item)
                        default:
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }

                    }
                })
                .animation(.default)
            }
        }
    }
}

struct GridTypePicker: View {
    @Binding var gridType: GridType
    var body: some View {
        VStack {
            Picker("Grid Type", selection: $gridType) {
                ForEach(GridType.allCases, id: \.self) { type in
                    switch type {
                    case .single:
                        Image(systemName: "rectangle.grid.1x2")
                    case .double:
                        Image(systemName: "square.grid.2x2")
                    case .tripple:
                        Image(systemName: "square.grid.3x2")
                    case .adaptive:
                        Image(systemName: "square.grid.4x3.fill")
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
