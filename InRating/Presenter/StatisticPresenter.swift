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
    
    init(with controller: StatisticVCP) {
        self.controller = controller
        getLikers()
    }
    
    //MARK: Func
    private func getLikers() {
        InternetService.shared.requestAlamofire(Constants.likersString, parameters: Constants.postsParameters) { [weak self] result in
            if let dataResult = result,
                let data = dataResult["data"] {
                print(data)
                if let data = try? JSONSerialization.data(withJSONObject: data) {
                    self?.likers = try? JSONDecoder().decode([User].self, from: data)
                }
            }
        }
    } 
}
