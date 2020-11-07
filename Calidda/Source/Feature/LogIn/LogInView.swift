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
    
    @IBOutlet var viwBackContent:UIView!
    @IBOutlet var viwBackUser:UIView!
    @IBOutlet var viwBackPass:UIView!
    @IBOutlet var buttonAccept:UIButton!
    
    
    
    @IBOutlet var emailTexfield:MFTextField!
    @IBOutlet var passwordTexfield:MFTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
     //   emailTexfield.text = "doctor@smartdoctor.pe"
        emailTexfield.text = "15831296"
        //passwordTexfield.text = "123456"
        passwordTexfield.text = "123456"
        print("login")
        setupUI()
    }
    func setupUI(){
       // style.apply(textStyle: .title, to: emailTexfield)
       // style.apply(textStyle: .title, to: passwordTexfield)
        self.viwBackContent.layer.cornerRadius = 20
        self.viwBackUser.layer.cornerRadius = 10
        self.viwBackUser.layer.borderWidth = 2
        self.viwBackUser.backgroundColor = .white
        self.viwBackUser.layer.borderColor = CaliddaColors.lightLead.cgColor
        
        self.viwBackPass.layer.cornerRadius = 10
        self.viwBackPass.layer.borderWidth = 2
        self.viwBackPass.layer.borderColor = CaliddaColors.lightLead.cgColor
        
        self.viwBackPass.backgroundColor = .white
        
        self.buttonAccept.setStyle(background: CaliddaColors.green, textButton: CaliddaColors.white)
        self.buttonAccept.setTitle("INGRESAR", for: .normal)
        self.buttonAccept.addTarget(self, action: #selector(oneTapped(_:)), for: .touchUpInside)
        
        
    }
    
        @objc func oneTapped(_ sender: Any?) {
            
        }
    // MARK: - Navigation
    @IBAction func logIn(_ sender:UIButton){
        presenter.auth(email: emailTexfield.text!, password: passwordTexfield.text!)
            .subscribeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: {result in
                

            

                UserDefaults.standard.set(result.TokenAcceso!, forKey: "KeyToken")
                UserDefaults.standard.set(result.RazonSocial!, forKey: "KeyRazon")
                UserDefaults.standard.set(result.CuentaContrato!, forKey: "KeyAcountCon") //setObject
                
                
                /*
                 UserDefaults.standard.string(forKey: "KeyToken")
                             UserDefaults.standard.string(forKey: "KeyRazon")
                             UserDefaults.standard.string(forKey: "KeyAcountCon")
                 */
                //print("PrimerNOmbre: " + result.data.first_name!)
                print("Id: " + result.Id!)
                print("PrimerRazonSocial: " + result.RazonSocial!)
                print("CuentaContrato: " + result.CuentaContrato!)
                print("TokenAcceso: " + result.TokenAcceso!)
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
    
    @IBAction func goToOldPassword(_ sender:UIButton){
        router.show(view: .oldPassword, sender: self)
    }
    
    func goToHome(){
        //para ir al hilo principal
        DispatchQueue.main.async {
            self.router.show(view: .home, sender: self)
            
       
            //self.goToHomeTab()
            /*
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
             let mainTabBarController = storyboard.instantiateViewController(identifier: "UIBorderlessNavigationBar")
                          mainTabBarController.modalPresentationStyle = .fullScreen

              self.present(mainTabBarController, animated: true, completion: nil)
                     
            */
            
        }
    }
    func goToHomeTab() {
                  let tabBar = self.tabBarController as? CaliddaTabBarController
                  tabBar?.selectedIndex = 0
                  tabBar?.centerPin(0)
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

