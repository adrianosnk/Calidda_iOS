//
//  BaseDialogViewController.swift
//  Claro Hogar
//
//  Created by Sheyla Vásquez Campos on 12/26/18.
//  Copyright © 2018 Claro. All rights reserved.
//

import UIKit
class BaseDialogViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initBaseView()
    }
    
    // MARK: - Own Methods
    
    func initBaseView()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
