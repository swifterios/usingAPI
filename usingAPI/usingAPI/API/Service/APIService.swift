//
//  APIService.swift
//  usingAPI
//
//  Created by Владислав on 11.07.2021.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    var request = APIType.getPosts.request
    
    func getPosts(completion: @escaping (Posts) -> Void) {

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let posts = try? JSONDecoder().decode(Posts.self, from: data) {
                completion(posts)
            } else {
                completion([])
            }
        }
        task.resume()
    }
    
    func getComments(completion: @escaping (Comments) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let result = try? JSONDecoder().decode(Comments.self, from: data) {
                completion(result)
            } else {
                completion([])
            }
        }
        task.resume()
    }
}
