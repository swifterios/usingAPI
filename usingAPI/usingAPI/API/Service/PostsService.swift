//
//  PostsService.swift
//  usingAPI
//
//  Created by Владислав on 11.07.2021.
//

import Foundation

class PostsService {
    
    static let shared = PostsService()
    
    
    func getPosts(completion: @escaping (Posts) -> Void) {
        let request = APIType.getPosts.request
        
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
    
}
