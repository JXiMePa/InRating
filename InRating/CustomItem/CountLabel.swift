//
//  CountLabel.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import UIKit

final class CountLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.white.withAlphaComponent(0.6)
        layer.cornerRadius = 8.0
        clipsToBounds = true
    }
}
