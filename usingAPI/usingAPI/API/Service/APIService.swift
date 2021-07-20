//
//  APIService.swift
//  usingAPI
//
//  Created by Владислав on 11.07.2021.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    func getPosts(completion: @escaping (Posts) -> Void) {

        let request = APIType.getPosts.url
        
        let task = URLSession.shared.dataTask(with: request!) { data, response, error in
            if let data = data,
               let posts = try? JSONDecoder().decode(Posts.self, from: data) {
                completion(posts)
            } else {
                completion([])
            }
        }
        task.resume()
    }
    
    func getCommentsById(postId: String, completion: @escaping (Comments) -> Void) {
        
        var request = APIType.getCommentsByPostId.url
        
        
        let task = URLSession.shared.dataTask(with: request!) { data, response, error in
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
