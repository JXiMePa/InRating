//
//  Constants.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import UIKit

enum ApiUrlString: String, CaseIterable {
    case likers = "https://api.inrating.top/v1/users/posts/likers/all"
    case reposters = "https://api.inrating.top/v1/users/posts/reposters/all"
    case commentators = "https://api.inrating.top/v1/users/posts/commentators/all"
    case marked = "https://api.inrating.top/v1/users/posts/mentions/all"
}

struct Constants {
    static let postsParameters = ["id": "2724"]
    static let dateFormat = "yyyy-MM-dd HH:mm:ss"
    static let cellWidth: CGFloat = 70
    static let hiddenCollectionHeight: CGFloat = 36
    static let showCollectionHeight: CGFloat = hiddenCollectionHeight + cellWidth + 14
    static let globalTintColor = UIColor.hexStr("0AC8FF", alpha: 1)
    static let posts = "https://api.inrating.top/v1/users/posts/get"
}

struct ConstName {
    static let statisticTitle = "Статистика Поста"
    static let viewsIcon = "👁"
    static let viewsTitle = "Просмотры"
    static let likeIcon = "♥️"
    static let likeTitle = "Лайки"
    static let сommentatorsIcon = "💬"
    static let сommentatorsTitle = "Комментаторы"
    static let markedIcon = "😀"
    static let markedTitle = "Отметки"
    static let repostersIcon = "🔄"
    static let repostersTitle = "Репосты"
    static let bookmarksIcon = "🔖"
    static let bookmarksTitle = "Закдадки"
}
