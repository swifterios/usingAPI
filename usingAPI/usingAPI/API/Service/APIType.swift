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
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "jsonplaceholder.typicode.com"
    }
    
    var path: String {
        
        switch self {
        case .getPosts:
            return "/posts"
        
        case .getCommentsByPostId:
            return "/comments"
        }
    }
    
    var query: [URLQueryItem] {
        return [URLQueryItem(name: "", value: "")]
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = query
        
        return components.url
    }
}
