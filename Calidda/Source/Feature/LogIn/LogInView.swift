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
import JLActivityIndicator

class LogInView: UIViewController {
    //var style: Style = Style.myApp
    
    var window: UIWindow?
    var router:Router!
    let disposebag = DisposeBag()
    private let presenter = LogInPresenter(loginService: AuthenticationService())
    
    @IBOutlet var viwBackContent:UIView!
    @IBOutlet var viwBackUser:UIView!
    @IBOutlet var viwBackPass:UIView!
    @IBOutlet var buttonAccept:UIButton!
    
    
    
    @IBOutlet var emailTexfield:MFTextField!
    @IBOutlet var passwordTexfield:MFTextField!
    
    //MenuFooter
    
    //1
         //Initialize and keeping reference of HHTabBarView.
         let hhTabBarView = HHTabBarView.shared
         
         //Keeping reference of iOS default UITabBarController.
         let referenceUITabBarController = HHTabBarView.shared.referenceUITabBarController
         
         //2
         func setupReferenceUITabBarController() {
             
             //Creating a storyboard reference
             let storyboard = UIStoryboard(name: "Consumo", bundle: Bundle.main)
             
             //First and Second Tab ViewControllers will be taken from the UIStoryBoard
             //Creating navigation controller for navigation inside the first tab.
             let navigationController1: UINavigationController = UINavigationController(rootViewController: storyboard.instantiateViewController(withIdentifier: "ConsumoView"))
             
             //Creating navigation controller for navigation inside the second tab.
             //let navigationController2: UINavigationController = UINavigationController(rootViewController: storyboard.instantiateViewController(withIdentifier: "FacturaViewID"))
             
             //Third, Fourth and Fifth will be created runtime.
             let sofaViewController = UIViewController()
             sofaViewController.title = "Sofa"
             sofaViewController.view.backgroundColor = .white
             let sofaNavigationController: UINavigationController = UINavigationController(rootViewController: sofaViewController)
             
             let targetViewController = UIViewController()
             targetViewController.title = "Target"
             targetViewController.view.backgroundColor = .white
             let targetNavigationController: UINavigationController = UINavigationController(rootViewController: targetViewController)
             
             let umbrellaViewController = UIViewController()
             umbrellaViewController.title = "Umbrella"
             umbrellaViewController.view.backgroundColor = .white
             let umbrellaNavigationController: UINavigationController = UINavigationController(rootViewController: umbrellaViewController)
             
             //Update referenced TabbarController with your viewcontrollers
             referenceUITabBarController.setViewControllers([navigationController1, sofaNavigationController, sofaNavigationController, targetNavigationController, umbrellaNavigationController], animated: false)
         }
         
         //3
         func setupHHTabBarView() {
             
             //Default & Selected Background Color
             let defaultTabColor = UIColor.black.withAlphaComponent(0.8)
             let selectedTabColor = UIColor(red: 28/255, green: 158/255, blue: 247/255, alpha: 1.0)
             let tabFont = UIFont.init(name: "Helvetica-Light", size: 12.0)
             let spacing: CGFloat = 3.0
             
             //Create Custom Tabs
             //Note: As tabs are subclassed of UIButton so you can modify it as much as possible.
             
             let titles = ["Location", "Refresh", "Sofa", "Target", "Umbrella"]
             let icons = [UIImage(named: "location-pin")!, UIImage(named: "refresh")!, UIImage(named: "sofa")!, UIImage(named: "target")!, UIImage(named: "umbrella")!]
             var tabs = [HHTabButton]()
             
             for index in 0...4 {
                 let tab = HHTabButton(withTitle: titles[index], tabImage: icons[index], index: index)
                 tab.titleLabel?.font = tabFont
                 tab.setHHTabBackgroundColor(color: defaultTabColor, forState: .normal)
                 tab.setHHTabBackgroundColor(color: selectedTabColor, forState: .selected)
                 tab.imageToTitleSpacing = spacing
                 tab.imageVerticalAlignment = .top
                 tab.imageHorizontalAlignment = .center
                 tabs.append(tab)
             }
             
             //Set HHTabBarView position.
             hhTabBarView.tabBarViewPosition = .bottom
             
             //Set this value according to your UI requirements.
             hhTabBarView.tabBarViewTopPositionValue = 64

             //Set Default Index for HHTabBarView.
             hhTabBarView.tabBarTabs = tabs
             
             // To modify badge label.
             // Note: You should only modify badgeLabel after assigning tabs array.
             // Example:
             //t1.badgeLabel?.backgroundColor = .white
             //t1.badgeLabel?.textColor = selectedTabColor
             //t1.badgeLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
             
             //Handle Tab Change Event
             hhTabBarView.defaultIndex = 0
             
             //Show Animation on Switching Tabs
             hhTabBarView.tabChangeAnimationType = .none
             
             //Handle Tab Changes
             hhTabBarView.onTabTapped = { (tabIndex, isSameTab, controller) in
                 if isSameTab {
                     if let navcon = controller as? UINavigationController {
                         navcon.popToRootViewController(animated: true)
                     } else if let vc = controller as? UIViewController {
                         vc.navigationController?.popToRootViewController(animated: true)
                     }
                 }
                 print("Selected Tab Index:\(tabIndex)")
             }
         }
         
    
    /////
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
     //   emailTexfield.text = "doctor@smartdoctor.pe"
        emailTexfield.text = "20180516647"
        //passwordTexfield.text = "123456"
        //passwordTexfield.text = "Ed\$123456"
        print("login")
        setupUI()
        
       
        let spinner = JLActivityIndicator(on: view, mode: .image)
              spinner.image = UIImage(named: "icon_ConsumoBlue")
              spinner.start()
              DispatchQueue.global(qos: .userInitiated).async {
                  // time consuming task
                  DispatchQueue.main.async {
                    //  spinner.stop()
                  }
              }
        
        //Setup HHTabBarView
        setupReferenceUITabBarController()
        setupHHTabBarView()
        
        
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
         
        //ProgressView.shared.showProgressView()
         
        presenter.auth(email: emailTexfield.text!, password: passwordTexfield.text!)
            .subscribeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: {result in
                 
 
                ProgressView.shared.hideProgressView()
                print("result.Id!::>>",result.Id!)
                UserDefaults.standard.set(result.TokenAcceso!, forKey: "KeyToken")
                UserDefaults.standard.set(result.Id!, forKey: "KeyIdLogin")
                UserDefaults.standard.set(result.RazonSocial!, forKey: "KeyRazon")
                UserDefaults.standard.set(result.CuentaContrato!, forKey: "KeyAcountCon") //setObject
                
                //login succes
                
                UserDefaults.standard.set("1", forKey: "KeyLogin")
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
                       /* let view = PopUpErrorView()
                        view.setupView(type: .warning)
                        AlertComponent.shared.setupAlert(controller: self, messasge: nil, externalView: view)*/
                        
                        
                        let view = PopUpCloseErrorView()
                               view.setupView(type: .error)
                               view.delegateError = self
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
        
        ProgressView.shared.hideProgressView()
        DispatchQueue.main.async {
            self.router.show(view: .home, sender: self)
        //    self.router.show(view: .home, sender: self.referenceUITabBarController)
            
           // let myTabBar = self.storyboard?.instantiateViewController(withIdentifier: "TabBarr") as! UITabBarController
           // let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
           // appDelegate.window?.rootViewController = myTabBar
            /*
        self.setupReferenceUITabBarController()
        self.setupHHTabBarView()
                
        //This is important.
        //Setup Application Window
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.referenceUITabBarController
        self.window?.makeKeyAndVisible()
         */
            //self.goToHomeTab()
            /*
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
             let mainTabBarController = storyboard.instantiateViewController(identifier: "UIBorderlessNavigationBar")
                          mainTabBarController.modalPresentationStyle = .fullScreen
              self.present(mainTabBarController, animated: true, completion: nil)
            */
        }
    }
    
    /////End ------ SETUP HHTabBarView ------
       
       
       func applicationWillResignActive(_ application: UIApplication) { }
       func applicationDidEnterBackground(_ application: UIApplication) { }
       func applicationWillEnterForeground(_ application: UIApplication) { }
       func applicationDidBecomeActive(_ application: UIApplication) { }
       func applicationWillTerminate(_ application: UIApplication) {  }
    
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



// MARK: - PopUpErrorView Delegate
extension LogInView: PopUpCloseErrorViewDelegate {
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
