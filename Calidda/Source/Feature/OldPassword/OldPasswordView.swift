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
    
    @IBOutlet var btnChangePas:UIButton!
    
    let disposebag = DisposeBag()
    private let presenter = OldPasswordPresenter(loginService: OldPasswordService())
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
    
    @IBAction func goToChangePass(){
           
           if self.emailTexfield.text == ""{
           DispatchQueue.main.async {
                  let view = PopUpCloseErrorView()
                  view.setupView(type: .warningVacio)
                  AlertComponent.shared.setupAlert(controller: self, messasge: nil, externalView: view)
             }
           }else{
            
            

                   presenter.postChangePassword(cuentaContrato: emailTexfield.text!)
                       .subscribeOn(MainScheduler.asyncInstance)
                       .subscribe(onNext: {result in
                            
            
                           ProgressView.shared.hideProgressView()
                           print("result.Id!::>>",result.Id!)
                           print("result.Id!::>>",result.CuentaContrato!)
                        
                           //login succes
                           //self.goToHome()
                       },
                                  onError: {error in
                                 DispatchQueue.main.async {
                                   let view = PopUpCloseErrorView()
                                          view.setupView(type: .error)
                                          view.delegateError = self
                                          AlertComponent.shared.setupAlert(controller: self, messasge: nil, externalView: view)
                               }
                       },
                                  onCompleted: {},
                                  onDisposed: {})
                       .disposed(by: self.disposebag)
            
            
               let view = PopUpCloseErrorView()
                        view.setupView(type: .oldPass)
                        view.delegateError = self
                        AlertComponent.shared.setupAlert(controller: self, messasge: nil, externalView: view)
               
              // self.router.show(view: .home, sender: self)
           }
       }

    
        @IBAction func goToDatos(){
            self.emailTexfield.text = "1234"
        }

        
}


    // MARK: - PopUpErrorView Delegate
extension OldPasswordView: PopUpCloseErrorViewDelegate {
        func onClose(type: PopUpCloseErrorType) {
           // if type == .connection {
               // self.goToHome()
            let alert = AlertComponent.shared
            alert.closeAllAlters()
               // router.pop(sender: self)
           // }
        }
        func onAceppt(type: PopUpCloseErrorType) {
             // if type == .connection {
                router.show(view: .logIn, sender: self)
                 // self.goToHome()
                 // router.pop(sender: self)
              //}
          }
       
    }

