//
//  StatisticsPresenter.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import Foundation

protocol PostPP: class {
    init(with controller: PostVCP)
}

final class PostPresenter: PostPP {
    
    //MARK: Property
    private weak var controller: PostVCP!
    private var post: Post? {
        didSet {
            controller.updateValues(post)
        }
    }
    
    //MARK: init
    init(with controller: PostVCP) {
        self.controller = controller
        getPost()
    }
    
    //MARK: Func
    private func getPost() {
        InternetService.shared.requestAlamofire(Constants.postsString, parameters: Constants.postsParameters) { [weak self] result in
            if let dataResult = result {
                if let data = try? JSONSerialization.data(withJSONObject: dataResult) {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = Constants.dateFormat
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    self?.post = try? decoder.decode(Post.self, from: data)
                }
            }
        }
    }
}
