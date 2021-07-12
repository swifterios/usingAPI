//
//  APIType.swift
//  usingAPI
//
//  Created by Владислав on 12.07.2021.
//

import Foundation

enum APIType {
    case getPosts
    
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/")!
    }
    
    var path: String {
        switch self {
        case .getPosts:
            return "posts"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)
        var request = URLRequest(url: url!)
        
        switch self {
        case .getPosts:
            request.httpMethod = "GET"
            return request
        }
    }
}
