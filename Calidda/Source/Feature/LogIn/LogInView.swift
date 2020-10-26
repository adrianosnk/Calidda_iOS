//
//  LogInView.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import Photos
import UIKit
import RxSwift
import MaterialTextField
import DLRadioButton
class LogInView: UIViewController {
    //var style: Style = Style.myApp
    var router:Router!
    let disposebag = DisposeBag()
    private let presenter = LogInPresenter(loginService: AuthenticationService())
    
    @IBOutlet var emailTexfield:MFTextField!
    @IBOutlet var passwordTexfield:MFTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        emailTexfield.text = "doctor@smartdoctor.pe"
        //emailTexfield.text = "usuario@calidda.pe"
        passwordTexfield.text = "123456"
        print("login")
        //setupUI()
    }
    func setupUI(){
       // style.apply(textStyle: .title, to: emailTexfield)
       // style.apply(textStyle: .title, to: passwordTexfield)
    }
    // MARK: - Navigation
    @IBAction func logIn(_ sender:UIButton){
        presenter.auth(email: emailTexfield.text!, password: passwordTexfield.text!)
            .subscribeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: {result in
                
              
                
                print("PrimerNOmbre: " + result.data.first_name!)
               self.goToHome()
            },
                       onError: {error in
                        
                      DispatchQueue.main.async {
                        let view = PopUpErrorView()
                        view.setupView(type: .warning)
                        AlertComponent.shared.setupAlert(controller: self, messasge: nil, externalView: view)
                    }
                        
            },
                       onCompleted: {},
                       onDisposed: {})
            .disposed(by: self.disposebag)
    }
    @IBAction func goToRegister(_ sender:UIButton){
       // router.show(view: .register, sender: self)
    }
    func goToHome(){
        //para ir al hilo principal
        DispatchQueue.main.async {
            self.router.show(view: .home, sender: self)
        }
    }
    @IBAction func checkTerms(_ sender:DLRadioButton){

    }
}

// MARK: - PopUpErrorView Delegate
extension LogInView: PopUpErrorViewDelegate {
    func onClose(type: PopUpErrorType) {
        if type == .connection {
            self.goToHome()
        }
    }
}
