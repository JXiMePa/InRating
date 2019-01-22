//
//  Constants.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import UIKit

struct Constants {
    static let postsString = "https://api.inrating.top/v1/users/posts/get"
    static let likersString = "https://api.inrating.top/v1/users/posts/likers/all"
    static let repostersString = "https://api.inrating.top/v1/users/posts/reposters/all"
    static let commentatorsString = "https://api.inrating.top/v1/users/posts/commentators/all"
    static let mentionsString = "https://api.inrating.top/v1/users/posts/mentions/all"
    static let postsParameters = ["id": "2720"]
    static let dateFormat = "yyyy-MM-dd HH:mm:ss"
    static let cellWidth: CGFloat = 70
    static let cellsOnScreen = 4
    static let hiddenCollectionHeight: CGFloat = 36
    static let showCollectionHeight: CGFloat = hiddenCollectionHeight + cellWidth + 20
    static let globalTintColor = UIColor.hexStr("0AC8FF", alpha: 1) 
}

struct ConstName {
    static let likeIcon = "♥️"
    static let likeTitle = "Лайки"
    static let statisticTitle = "Статистика Поста"
    static let viewsIcon = "👁"
    static let viewsTitle = "Просмотры"
}
