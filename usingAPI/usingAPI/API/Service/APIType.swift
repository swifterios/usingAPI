//
//  APIType.swift
//  usingAPI
//
//  Created by Владислав on 12.07.2021.
//

import Foundation

enum APIType {
    case getPosts
    case getCommentsByPostId

    
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/")!
    }

    
    var path: String {
        
        switch self {
        case .getPosts:
            return "posts"
        
        case .getCommentsByPostId:
            return "comments"
        }
    }
    
    var headers: [String: String] {
        
        switch self {
        case .getPosts:
            return [:]
        case .getCommentsByPostId:
            return [:]
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)
        var request = URLRequest(url: url!)
        request.allHTTPHeaderFields = headers
        
        switch self {
        case .getPosts:
            request.httpMethod = "GET"
            return request
            
        case .getCommentsByPostId:
            request.httpMethod = "GET"
            return request
        }
    }
}
