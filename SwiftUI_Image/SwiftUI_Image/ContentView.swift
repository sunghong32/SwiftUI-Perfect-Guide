//
//  ContentView.swift
//  SwiftUI_Image
//
//  Created by 민성홍 on 2021/08/10.
//

import SwiftUI

struct ContentView: View {

    @State private var users = [User]()

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible())], content: {
                ForEach(users) { user in
                    HStack {
                        URLImage(urlString: user.avatar)
                        Text("\(user.name)")

                    }
                }
            })
        }
        .onAppear {
            WebService().loadUsers { users in
                self.users = users
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
