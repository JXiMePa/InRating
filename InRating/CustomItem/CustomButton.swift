//
//  CustomButton.swift
//  InRating
//
//  Created by Tarasenko Jurik on 1/22/19.
//  Copyright © 2019 Next Level. All rights reserved.
//

import UIKit

final class CustomButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        defaultSetup()
    }
    
    private func defaultSetup() {
        setTitleColor(Constants.globalTintColor, for: .normal)
        backgroundColor = UIColor.lightText
        layer.cornerRadius = 8.0
        layer.shadowRadius = 6.0
        layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}
