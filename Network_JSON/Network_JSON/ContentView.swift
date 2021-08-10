//
//  ContentView.swift
//  Network_JSON
//
//  Created by 민성홍 on 2021/08/10.
//

import SwiftUI

struct ContentView: View {
    @State var todos = [Todo]()

    var body: some View {
        List(todos) { todo in
            VStack(alignment: .leading) {
                Text(todo.title!)
                    .padding(.bottom, 10)
                Text(todo.completed!.description)
                    .foregroundColor(todo.completed == true ? .red : .blue)
            }
        }
        .onAppear {
            WebService().getTodos { todos in
                self.todos = todos
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
