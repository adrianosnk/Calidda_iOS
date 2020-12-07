//
//  SceneDelegate.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    let navigator = Router()
    var window: UIWindow?
     
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
      
      //4
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        IQKeyboardManager.shared.enable = true
           IQKeyboardManager.shared.goNext()
           IQKeyboardManager.shared.toolbarTintColor = .black
           
        
        
        //Setup HHTabBarView
          setupReferenceUITabBarController()
            setupHHTabBarView()
           /*
            //This is important.
            //Setup Application Window
            window = UIWindow.init(frame: UIScreen.main.bounds)
            window?.rootViewController = referenceUITabBarController
            window?.makeKeyAndVisible()
         */
        
           let navigatiorView = UINavigationController()
           navigatiorView.isNavigationBarHidden = true
           window?.rootViewController = navigatiorView
           
           //window?.rootViewController = referenceUITabBarController
        
        
           window?.makeKeyAndVisible()
           navigator.show(view: .splash, sender: navigatiorView)
           window?.tintColor = .black
           
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func application(_ application: UIApplication, continue userActivity:NSUserActivity,restorationHandler:@escaping([UIUserActivityRestoring]?) -> Void) -> Bool{
        
        guard let url = userActivity.webpageURL else{ return false}
        //guard let viewController =
        application.open(url)

        let navigatiorView = UINavigationController()
        navigatiorView.isNavigationBarHidden = true
        window?.rootViewController = navigatiorView
        
        navigator.show(view: .home, sender: navigatiorView)
        
        return false
    }
    
   // Alberto Roque.
    
    

    func applicationWillResignActive(_ application: UIApplication) { }
    func applicationDidEnterBackground(_ application: UIApplication) { }
    func applicationWillEnterForeground(_ application: UIApplication) { }
    func applicationDidBecomeActive(_ application: UIApplication) { }
    func applicationWillTerminate(_ application: UIApplication) {  }

    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

