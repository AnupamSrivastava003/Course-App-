//
//  Data.swift
//  Course App
//
//  Created by SKUBI on 15/04/23.
//

import SwiftUI

struct Post: Codable, Identifiable {
    var id = UUID()
    var title: String
    var body: String
}


class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            let post = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(post)
            }
        }
        .resume()
    }
}
