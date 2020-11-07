//
//  RegisterView.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//
  
import UIKit
import RxSwift 
class ChangePasswordView: UIViewController {
   // var style: Style = Style.myApp
    var router:Router!
    let disposebag = DisposeBag()
    private let presenter = ChangePasswordPresenter(loginService: AuthenticationService())
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func goToBack(){
        router.pop(sender: self)
    }

    
}
