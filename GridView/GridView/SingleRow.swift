//
//  SingleRow.swift
//  GridView
//
//  Created by 민성홍 on 2021/08/09.
//

import SwiftUI

struct SingleRow: View {
    let item: Item
    var body: some View {
        ZStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)

            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.mainTitle)
                            .font(.headline)
                            .lineLimit(1)
                        Text(item.subTitle)
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                    Spacer()
                }
                .padding(10)
                .background(Color.white.opacity(0.5))
            }

        }
    }
}

struct SingleRow_Previews: PreviewProvider {

    static var previews: some View {
        SingleRow(item: Item(mainTitle: "main", subTitle: "sub", imageName: "bg1"))
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
