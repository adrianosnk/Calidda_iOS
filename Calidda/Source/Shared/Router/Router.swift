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

    lazy private var oldPasswordStoryboard = UIStoryboard(name: "OldPassword", bundle: nil)
    
    
    lazy private var detailNovedadesStoryboard = UIStoryboard(name: "DetailNovedades", bundle: nil)
    lazy private var facturaStoryboard = UIStoryboard(name: "Factura", bundle: nil)
   
    lazy private var facturaDetailStoryboard = UIStoryboard(name: "DetailFactura", bundle: nil)
    lazy private var consumoStoryboard = UIStoryboard(name: "Consumo", bundle: nil)
   
    lazy private var mantenimientoStoryboard = UIStoryboard(name: "Mantenimiento", bundle: nil)
    lazy private var gestionStoryboard = UIStoryboard(name: "Gestion", bundle: nil)
   
    
    //OldPasswordView
    //AttentionManagementView
    
    
    // MARK: - views list
    enum Scene {
        case home
        case homeMenu
        //case register
        case logIn
        case splash
        case oldPassword
        case detailNovedades
        case factura
        case facturaDetail
        case consumo
        case mantenimiento
        case gestion
    }
    // MARK: - invoke a single view
    func show(view: Scene, sender: UIViewController) {
        switch view {
            
        case .home:
            let homeView:HomeView = homeStoryboard.instantiateViewController(withIdentifier:"HomeView") as! HomeView
            homeView.router = self
            self.show(target: homeView, sender: sender)
            
       
            
            break
        case .homeMenu:
                      let homeView:HomeView = homeStoryboard.instantiateViewController(withIdentifier:"HomeView") as! HomeView
                      homeView.router = self
                      self.showMenu(target: homeView, sender: sender)
                      
                 
                      
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
            
        case .oldPassword:
            let oldPasswordView:OldPasswordView = oldPasswordStoryboard.instantiateViewController(withIdentifier:"OldPasswordView") as! OldPasswordView
            oldPasswordView.router = self
            self.show(target: oldPasswordView, sender: sender)
            break

        case .detailNovedades:
            let detailNovedadesView:DetailNovedadesView = detailNovedadesStoryboard.instantiateViewController(withIdentifier:"DetailNovedadesView") as! DetailNovedadesView
            detailNovedadesView.router = self
            self.show(target: detailNovedadesView, sender: sender)
            break

        case .factura:
            let facturaView:FacturaView = facturaStoryboard.instantiateViewController(withIdentifier:"FacturaView") as! FacturaView
            facturaView.router = self
            //self.show(target: facturaView, sender: sender)
            self.showMenu(target: facturaView, sender: sender)
            break


        case .facturaDetail:
            let facturaDetailView:FacturaDetailView = facturaDetailStoryboard.instantiateViewController(withIdentifier:"FacturaDetailView") as! FacturaDetailView
            facturaDetailView.router = self
            self.show(target: facturaDetailView, sender: sender)
            break


        case .consumo:
            let consumoView:ConsumoView = consumoStoryboard.instantiateViewController(withIdentifier:"ConsumoView") as! ConsumoView
            consumoView.router = self
            self.showMenu(target: consumoView, sender: sender)
            break


        case .mantenimiento:
                let mantenimientoView:MantenimientoView = mantenimientoStoryboard.instantiateViewController(withIdentifier:"MantenimientoView") as! MantenimientoView
                mantenimientoView.router = self
                self.showMenu(target: mantenimientoView, sender: sender)
                break


        case .gestion:
                let gestionView:GestionView = gestionStoryboard.instantiateViewController(withIdentifier:"GestionView") as! GestionView
                gestionView.router = self
                self.showMenu(target: gestionView, sender: sender)
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
    
    private func showMenu(target: UIViewController, sender: UIViewController) {
           
        //present modally
            if let nav = sender.navigationController {
                //add controller to navigation stack
                nav.pushViewController(target, animated: false)
                
                
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
