//
//  RegisterView.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//
  
import UIKit
import RxSwift
class OldPasswordView: UIViewController {
    //var style: Style = Style.myApp
    var router:Router!
    
    @IBOutlet var viwBackContent:UIView!
    @IBOutlet var viwBackUser:UIView!
    @IBOutlet var emailTexfield:UITextField!
    
    let disposebag = DisposeBag()
    private let presenter = OldPasswordPresenter(loginService: AuthenticationService())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    func setupUI(){
        
        self.viwBackContent.layer.cornerRadius = 20
        
        self.viwBackUser.layer.cornerRadius = 10
        self.viwBackUser.layer.borderWidth = 2
        self.viwBackUser.backgroundColor = .white
        self.viwBackUser.layer.borderColor = CaliddaColors.lightLead.cgColor
    }
    @IBAction func goToBack(){
        router.pop(sender: self)
    }

    
}
