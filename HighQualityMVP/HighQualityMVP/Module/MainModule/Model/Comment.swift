//
//  Comment.swift
//  HighQualityMVP
//
//  Created by Vitaliy Halai on 10.06.24.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
