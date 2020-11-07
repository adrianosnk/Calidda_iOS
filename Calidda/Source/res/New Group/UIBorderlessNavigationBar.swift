//
//  UIBorderlessNavigationBar.swift
//  Claro Hogar
//
//  Created by Daniel Aragon Ore on 12/19/18.
//  Copyright © 2018 Claro. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class UIBorderlessNavigationBar: UINavigationController{
    override func viewDidLoad() {
        sharedInit()
    }

    func sharedInit() {
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
    }
}
