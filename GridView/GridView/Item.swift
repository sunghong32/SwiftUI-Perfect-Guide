//
//  Item.swift
//  GridView
//
//  Created by 민성홍 on 2021/08/09.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let mainTitle: String
    let subTitle: String
    let imageName: String

    static var dummyData: [Item] {
        (0...30).map {
            Item(mainTitle: "Main Title Index \($0)",
                 subTitle: "Sub Title Index\($0)",
                 imageName: "bg\($0 % 3 + 1)")
        }
    }
}
