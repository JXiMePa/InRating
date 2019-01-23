//
//  StatisticPresenter.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import Foundation

protocol StatisticPP: class {
    init(with controller: StatisticVCP)
}

final class StatisticPresenter: StatisticPP {
    
    //MARK: Property
    private weak var controller: StatisticVCP!
    
    private var likers: [User]? {
        didSet {
            controller.updateLikersValues(likers)
        }
    }

    private var reposters: [User]? {
        didSet {
            controller.updateRepostersValue(reposters)
        }
    }
    
    private var commentators: [User]? {
        didSet {
            controller.updateCommentsValues(commentators)
        }
    }
    
    private var marked: [User]? {
        didSet {
            controller.updateMarkedValues(marked)
        }
    }
    
    //MARK: Init
    init(with controller: StatisticVCP) {
        self.controller = controller
        load()
    }
    
    //MARK: Func
    private func load() {
        for value in ApiUrlString.allCases {
            loadUsers(value)
        }
    }
    
    private func loadUsers(_ from: ApiUrlString) {
        InternetService.shared.requestAlamofire(from.rawValue, parameters: Constants.postsParameters) { [weak self] result in
            if let dataResult = result,
                let data = dataResult["data"] {
                if let data = try? JSONSerialization.data(withJSONObject: data) {
                    
                    switch from {
                    case .likers: self?.likers = try? JSONDecoder().decode([User].self, from: data)
                    case .reposters: self?.reposters = try? JSONDecoder().decode([User].self, from: data)
                    case .commentators: self?.commentators = try? JSONDecoder().decode([User].self, from: data)
                    case .marked: self?.marked = try? JSONDecoder().decode([User].self, from: data)
                    }
                }
            }
        }
    } 
}
