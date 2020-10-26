//
//  UIButton.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

extension UIButton {

    func setStyle(background: UIColor, textButton: UIColor) {
        backgroundColor = background
        layer.cornerRadius = 5
        setTitleColor(textButton, for: .normal)
        titleLabel?.font = CaliddaFont.regular15
    }
    
    func setStyle2(background: UIColor, textButton: UIColor) {
        backgroundColor = background
        layer.cornerRadius = 5
        setTitleColor(textButton, for: .normal)
        titleLabel?.font = CaliddaFont.semiBold18
    }
    
    
    func setStyleBorder(background: UIColor, textButton: UIColor) {
        backgroundColor = background
        layer.cornerRadius = 5
        setTitleColor(textButton, for: .normal)
        titleLabel?.font = CaliddaFont.regular15
        
        layer.borderWidth = 1
        layer.borderColor = textButton.cgColor
        
    }
    
}
