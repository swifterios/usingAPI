//
//  Comment.swift
//  usingAPI
//
//  Created by Владислав on 14.07.2021.
//

import Foundation

struct Comment: Codable {
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
}

typealias Comments = [Comment]
