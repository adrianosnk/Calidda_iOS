//
//  BaseAlert.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

protocol BaseAlertDelegate: class {
    func didTapOnButton(forAlert alert: BaseAlert)
    
    func onTapReload()
    
    func onTapOnButtonWithCompletion(forAlert alert: BaseAlert)
}

class BaseAlert: UIView {
    weak var delegate: BaseAlertDelegate?
    var identifier: Int = 0
    var currentViewController : UIViewController?
    weak var controllerToPresentAlert: UIViewController?
    
    func setIdentifier(identifier : Int) {
        self.identifier = identifier
    }
    
    func onClickButton(view : BaseAlert) {
        if delegate != nil {
            delegate!.didTapOnButton(forAlert: view)
        }
    }
    
    func onClickReload() {
        if delegate != nil {
            delegate!.onTapReload()
        }
    }
    
    func onClickWithResponse(view : BaseAlert) {
        if delegate != nil {
            delegate!.onTapOnButtonWithCompletion(forAlert: view)
        }
    }
    
    func loadWhenViewIsVisible(margin : CGFloat) {
        
    }
}
