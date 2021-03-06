//
//  LogineView.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

class SplashView: UIViewController {
    var router:Router!
 //   var style: Style = Style.myApp
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
      //  let login = loginService()
      //  login.callService()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { 
            // Code you want to be delayed

            if let userProperties =  UserDefaults.standard.string(forKey: "KeyLogin"){
                print(userProperties)
                print("userProperties:>>",userProperties)
                         if userProperties == "1"{
                             self.goTohome()
                         }else{
                             self.goToLogIn()
                         }
            }else{
                self.goToLogIn()
            }
            
            //let userProperties =  UserDefaults.standard.string(forKey: "KeyLogin")!
         
            
        }
    }
    
    // MARK: - Navigation
    func goToLogIn() {
        router.show(view: .logIn, sender: self)
    }
    func goTohome() {
        router.show(view: .home, sender: self)
    }
}
