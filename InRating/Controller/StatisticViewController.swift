//
//  StatisticViewController.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import UIKit

protocol StatisticVCP: class  {
    func updateLikersValues(_ from: [User]?)
    func updateRepostersValue(_ from: [User]?)
    func updateCommentsValues(_ from: [User]?)
    func updateMarkedValues(_ from: [User]?)
}

final class StatisticViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet private weak var viewsCollectionSV: StatisticsView!
    @IBOutlet private weak var likersCollectionSV: StatisticsView!    //
    @IBOutlet private weak var likersCollectionSVHeight: NSLayoutConstraint!
    @IBOutlet private weak var commentsCollectionSV: StatisticsView!  //
    @IBOutlet private weak var commentsCollectionSVHeight: NSLayoutConstraint!
    @IBOutlet private weak var markedCollectionSV: StatisticsView!    //
    @IBOutlet private weak var markedCollectionSVHeight: NSLayoutConstraint!
    @IBOutlet private weak var repostersCollectionSV: StatisticsView! //
    @IBOutlet private weak var repostersCollectionSVHeight: NSLayoutConstraint!
    @IBOutlet private weak var bookmarksCollectionSV: StatisticsView!
    
    //MARK: Property
    private var presenter: StatisticPP!
    var post: Post?
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Func
    private func setupView() {
        navigationItem.title = ConstName.statisticTitle
        presenter = StatisticPresenter(with: self)
        viewsCollectionSV.setIcon = ConstName.viewsIcon
        viewsCollectionSV.setCollectionName = ConstName.viewsTitle
        likersCollectionSV.setIcon = ConstName.likeIcon
        likersCollectionSV.setCollectionName = ConstName.likeTitle
        commentsCollectionSV.setIcon = ConstName.сommentatorsIcon
        commentsCollectionSV.setCollectionName = ConstName.сommentatorsTitle
        markedCollectionSV.setIcon = ConstName.markedIcon
        markedCollectionSV.setCollectionName = ConstName.markedTitle
        repostersCollectionSV.setIcon = ConstName.repostersIcon
        repostersCollectionSV.setCollectionName = ConstName.repostersTitle
        bookmarksCollectionSV.setIcon = ConstName.bookmarksIcon
        bookmarksCollectionSV.setCollectionName = ConstName.bookmarksTitle
        viewsCollectionSV.setCount = String(post?.viewsCount ?? 0)
        bookmarksCollectionSV.setCount = String(post?.bookmarksCount ?? 0)
    }
}

extension StatisticViewController: StatisticVCP {
    func updateMarkedValues(_ from: [User]?) {
        if let users = from, users.count > 0 {
            markedCollectionSV.users = users
            markedCollectionSVHeight.constant = Constants.showCollectionHeight
        } else {
            markedCollectionSV.setCount = String(from?.count ?? 0)
        }
    }
    
    func updateRepostersValue(_ from: [User]?) {
        if let users = from, users.count > 0  {
            repostersCollectionSV.users = users
            repostersCollectionSVHeight.constant = Constants.showCollectionHeight
        } else {
            repostersCollectionSV.setCount = String(from?.count ?? 0)
        }
    }
    
    func updateCommentsValues(_ from: [User]?) {
        if let users = from, users.count > 0  {
            commentsCollectionSV.users = users
            commentsCollectionSVHeight.constant = Constants.showCollectionHeight
        } else {
            commentsCollectionSV.setCount = String(from?.count ?? 0)
        }
    }
    
    func updateLikersValues(_ from: [User]?) {
        if let users = from, users.count > 0  {
            likersCollectionSV.users = users
            likersCollectionSVHeight.constant = Constants.showCollectionHeight
        } else {
            likersCollectionSV.setCount = String(from?.count ?? 0)
        }
    }
    
}
