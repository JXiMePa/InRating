//
//  UploadingImageView.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import UIKit
import SDWebImage

final class UploadingImageView: UIImageView {
    
    let spiner: UIActivityIndicatorView = {
        let spiner = UIActivityIndicatorView()
        spiner.color = Constants.globalTintColor
        spiner.hidesWhenStopped = true
        return spiner
    }()
    
    var setImageFromStringUrl: String? {
        didSet {
            if let urlString = setImageFromStringUrl, let url = URL(string: urlString) {
                sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"),
                            options: SDWebImageOptions()) { [weak self] _,_,_,_ in
                                self?.spiner.stopAnimating()
                }
            } else {
                self.image = UIImage(named: "placeholder")
                self.spiner.stopAnimating()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(spiner)
        _ = spiner.anchor(centerX: self.centerXAnchor, centerY: self.centerYAnchor)
        spiner.startAnimating()
    }
}

