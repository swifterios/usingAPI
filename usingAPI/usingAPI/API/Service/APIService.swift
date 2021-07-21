//
//  APIService.swift
//  usingAPI
//
//  Created by Владислав on 11.07.2021.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = APIType.defaultValues.scheme
        urlComponents.host = APIType.defaultValues.host
        
        return urlComponents
    }
    
    
    func getPosts(completion: @escaping (Posts) -> Void) {
        var urlComponents = self.urlComponents
        urlComponents.path = APIType.getPosts.path
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
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
        var urlComponents = self.urlComponents
        urlComponents.path = APIType.getCommentsByPostId.path
        urlComponents.queryItems = [URLQueryItem(name: "postId", value: postId)]
        
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
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
