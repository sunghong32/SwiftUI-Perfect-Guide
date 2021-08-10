//
//  API.swift
//  Network_JSON
//
//  Created by 민성홍 on 2021/08/10.
//

import Foundation

struct Todo: Codable, Identifiable {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
}

class WebService {
    // https://jsonplaceholder.typicode.com/todos

    func getTodos(completion: @escaping ([Todo]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let hasData = data else { return }

            let todos = try! JSONDecoder().decode([Todo].self, from: hasData)

            completion(todos)
        }.resume()
    }
}
