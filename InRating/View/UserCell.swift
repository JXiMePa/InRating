//
//  UserCell.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import UIKit

final class UserCell: UICollectionViewCell {
    
    //MARK:
    @IBOutlet private weak var imageView: UploadingImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    //MARK: Property
    var user: User? {
        didSet {
            imageView.setImageFromStringUrl = user?.avatarImage?.url
            nameLabel.text = user?.nickname
        }
    }
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
    }
}
