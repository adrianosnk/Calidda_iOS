//
//  Router.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import RxSwift
import Then
import RxCocoa

class Router {
    lazy private var mainStoryboard = UIStoryboard(name: "Splash", bundle: nil)
    lazy private var authStoryboard = UIStoryboard(name: "Auth", bundle: nil)
    lazy private var homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
    lazy private var settingsStoryboard = UIStoryboard(name: "Settings", bundle: nil)

    lazy private var helpViewStoryboard = UIStoryboard(name: "Help", bundle: nil)
    lazy private var profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
 
    
    //AttentionManagementView
    
    
    // MARK: - views list
    enum Scene {
        case home
        //case register
        case logIn
        case splash
    
    }
    // MARK: - invoke a single view
    func show(view: Scene, sender: UIViewController) {
        switch view {
            
        case .home:
            let homeView:HomeView = homeStoryboard.instantiateViewController(withIdentifier:"HomeView") as! HomeView
            homeView.router = self
            self.show(target: homeView, sender: sender)
            break
        case .logIn:
            let logInView:LogInView = authStoryboard.instantiateViewController(withIdentifier:"LogInView") as! LogInView
            logInView.router = self
            self.show(target: logInView, sender: sender)
            break
   
        case .splash:
            let splashView:SplashView = mainStoryboard.instantiateViewController(withIdentifier:"SplashView") as! SplashView
            splashView.router = self
            self.show(target: splashView, sender: sender)
            break
     /*   case .register:
            let registerView:RegisterView = authStoryboard.instantiateViewController(withIdentifier:"RegisterView") as! RegisterView
            registerView.router = self
            self.show(target: registerView, sender: sender)
            break
*/
         
            
        }
    }
    private func show(target: UIViewController, sender: UIViewController) {
        
        if let nav = sender as? UINavigationController {
            //push root controller on navigation stack
            nav.pushViewController(target, animated: false)
            nav.setNavigationBarHidden(true, animated: false)
            return
        }
        
        if let nav = sender.navigationController {
            //add controller to navigation stack
            nav.pushViewController(target, animated: true)
            
            
        } else {
            //present modally
            sender.present(target, animated: true, completion: nil)
        }
    }
    func pop(sender: UIViewController){
        if let nav = sender.navigationController {
            //add controller to navigation stack
            nav.popViewController(animated: true)
        } else {
            //present modally
            sender.dismiss(animated: true, completion: nil)
        }
    }
}
