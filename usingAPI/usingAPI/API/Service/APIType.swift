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
    case defaultValues
    
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
            
        case .defaultValues:
            return "/"
        }
    }
}
