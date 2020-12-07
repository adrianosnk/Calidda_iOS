//
//  RegisterView.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//
  
import UIKit
import RxSwift 
class ChangeLoginLinkPasswordView: UIViewController {
   // var style: Style = Style.myApp
    var router:Router!
     
    @IBOutlet var viwBackContent:UIView!
    @IBOutlet var viwBackUser:UIView!
    @IBOutlet var viwPassActual:UIView!
    @IBOutlet var viwPassNew:UIView!
    @IBOutlet var passActualTexfield:UITextField!
    @IBOutlet var passNewTexfield:UITextField!
    @IBOutlet var passNewRepeatTexfield:UITextField!
    
    @IBOutlet var btnChangePas:UIButton!
    
    let disposebag = DisposeBag()
    private let presenter = ChangePasswordPresenter(loginService: AuthenticationService())
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
            
            self.viwPassActual.layer.cornerRadius = 10
            self.viwPassActual.layer.borderWidth = 2
            self.viwPassActual.backgroundColor = .white
            self.viwPassActual.layer.borderColor = CaliddaColors.lightLead.cgColor
            
            self.viwPassNew.layer.cornerRadius = 10
            self.viwPassNew.layer.borderWidth = 2
            self.viwPassNew.backgroundColor = .white
            self.viwPassNew.layer.borderColor = CaliddaColors.lightLead.cgColor
            
            //self.btnChangePas.layer.cornerRadius = 8
        }
    @IBAction func goToBack(){
        router.pop(sender: self)
    }
    
    @IBAction func goToChangePass(){
        
        if self.passActualTexfield.text == ""{
        DispatchQueue.main.async {
               let view = PopUpCloseErrorView()
               view.setupView(type: .warningVacio, messagin: "")
               AlertComponent.shared.setupAlert(controller: self, messasge: nil, externalView: view)
          }
        }else{
            let view = PopUpCloseErrorView()
                     view.setupView(type: .changePass, messagin: "")
                     view.delegateError = self
                     AlertComponent.shared.setupAlert(controller: self, messasge: nil, externalView: view)
            
           // self.router.show(view: .home, sender: self)
        }
    }
    
    @IBAction func goToDatos(){
        self.passActualTexfield.text = "1234"
        self.passNewTexfield.text = "1234"
        self.passNewRepeatTexfield.text = "1234"
    }

    
}


// MARK: - PopUpErrorView Delegate
extension ChangeLoginLinkPasswordView: PopUpCloseErrorViewDelegate {
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
            router.show(view: .home, sender: self)
             // self.goToHome()
             // router.pop(sender: self)
          //}
      }
   
}
