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
}

final class StatisticViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var viewsCollectionSV: StatisticsView!
    @IBOutlet weak var viewsCollectionSVHeight: NSLayoutConstraint!
    
    @IBOutlet weak var likersCollectionSV: StatisticsView!
    @IBOutlet weak var likersCollectionViewHeight: NSLayoutConstraint!
    
    //MARK: Property
    private var presenter: StatisticPP!

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK: Func
    private func setupView() {
        navigationItem.title = ConstName.statisticTitle
        presenter = StatisticPresenter(with: self)
        likersCollectionSV.setIcon = ConstName.likeIcon
        likersCollectionSV.setCollectionName = ConstName.likeTitle
        likersCollectionViewHeight.constant = Constants.showCollectionHeight
        
        viewsCollectionSV.setIcon = ConstName.viewsIcon
        viewsCollectionSV.setCollectionName = ConstName.viewsTitle
        viewsCollectionSVHeight.constant = Constants.hiddenCollectionHeight
    }
}

extension StatisticViewController: StatisticVCP {
    func updateLikersValues(_ from: [User]?) {
        if let dataArray = from {
        likersCollectionSV.users = dataArray
        }
    }
    
}
