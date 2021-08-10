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
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())], content: {
                    ForEach(users) { user in
                        NavigationLink(
                            destination: UserDetailView(user: user),
                            label: {
                                HStack {
                                    URLImage(urlString: user.avatar)
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                    Text("\(user.name)")
                                    Spacer()
                                }
                            })
                    }
                })
            }
            .navigationTitle("User List")
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
