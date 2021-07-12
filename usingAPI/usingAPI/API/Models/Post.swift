//
//  Post.swift
//  usingAPI
//
//  Created by Владислав on 11.07.2021.
//

import Foundation


struct Post: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}

typealias Posts = [Post]
