//
//  Model.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import Foundation

struct Post: Decodable {
    let title: String?
    let id: Int?
    let viewsCount: Int?
    let repostsCount: Int?
    let likesCount: Int?
    let commentsCount: Int?
    let bookmarksCount: Int?
    let attachments: Image?
    let createdAt: Date?
    
    enum CodingKeys : String, CodingKey {
        case title, id, attachments
        case viewsCount = "views_count"
        case repostsCount = "reposts_count"
        case likesCount = "likes_count"
        case commentsCount = "comments_count"
        case bookmarksCount = "bookmarks_count"
        case createdAt = "created_at"
    }
}

struct User: Decodable {
    let avatarImage: ImageData?
    let gender: String?
    let id: Int?
    let lastname: String?
    let name: String?
    let nickname: String?
    
    enum CodingKeys : String, CodingKey {
        case gender, id, lastname, name, nickname
        case avatarImage = "avatar_image"
    }
}

struct Image: Decodable {
    let images: [ImageData]?
}

struct ImageData: Decodable {
    let id: Int?
    let url: String?
}
