//
//  StatisticsView.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import UIKit

final class StatisticsView: UIView {
    
    //MARK: IBOutlet
    @IBOutlet private weak var iconLabel: UILabel!
    @IBOutlet private weak var collectionNameLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var showElseButton: UIButton!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK: Property
    var users: [User] = [] {
        didSet {
            collectionView.reloadData()
            let cellsOnScreen = Int(frame.width / Constants.cellWidth)
            showElseButton.isHidden = users.count < cellsOnScreen
            showElseButton.setTitle("ещё \((users.count + 1) - cellsOnScreen)", for: .normal)
            countLabel.text = String(users.count)
        }
    }
    
    var setCount: String? {
        get { return countLabel.text }
        set { countLabel.text = newValue }
    }
    
    var setIcon: String? {
        get { return iconLabel.text }
        set { iconLabel.text = newValue }
    }
    
    var setCollectionName: String? {
        get { return collectionNameLabel.text }
        set { collectionNameLabel.text = newValue }
    }
    
    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    //MARK: Func
    private func commonInit() {
        if let view = Bundle.main.loadNibNamed(StatisticsView.identifier, owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
            setupView()
        }
    }
    
    private func setupView() {
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: UserCell.identifier, bundle: nil), forCellWithReuseIdentifier: UserCell.identifier)
    }
    
    //MARK: ButtonActions
    @IBAction func showElseButtonAction(_ sender: UIButton) {
        collectionView.scrollToLast()
    }
}

//MARK: CollectionViewDelegate, DataSource, DelegateFlowLayout
extension StatisticsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCell.identifier, for: indexPath) as! UserCell
        cell.user = users[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let nameLabelHeight: CGFloat = 24
        let height = Constants.cellWidth + nameLabelHeight
        return CGSize(width: Constants.cellWidth, height: height)
    }
    
}
