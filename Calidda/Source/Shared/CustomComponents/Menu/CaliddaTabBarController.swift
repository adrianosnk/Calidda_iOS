//
//  ClaroHogarTabBarController.swift
//  Claro Hogar
//
//  Created by Daniel Aragon Ore on 12/28/18.
//  Copyright © 2018 Claro. All rights reserved.
//

import UIKit
import RxSwift

protocol CaliddaTabBarControllerProtocol: class{
}

class CaliddaTabBarController: UITabBarController, UITabBarControllerDelegate  {
    
    var isLoading : Bool = true
    let tabPin = UIView(frame: CGRect.zero)
    var notificationNumber : Int = 0
   // var interactorPackage: PackagesUseCase?
   // var interactorNotification: NotificationUseCase?
    var packageName : String = ""
    var notificationNumberSubscription: Disposable!
  //  var dataDTH : DataDTH?
    
    weak var delegateTabBar: CaliddaTabBarControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        //interactorNotification = NotificationInteractor(with: NotificationRepository())
        //interactorPackage = HomeInteractor(with: PackagesRepository())
       // packageName = interactorPackage?.getPackageSelected().nombrePaquete ?? ""
        self.drawItemTabBarSelected()
        NotificationCenter.default.addObserver(self, selector: #selector(onDidUpdateView(_:)), name: .didEnableMenu, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNotification(_:)), name: .didReceiveNotification, object: nil)
        
    }
    
    @objc func onDidUpdateView(_ notification:Notification) {
        if let value = notification.object as? Bool{
            NotificationCenter.default.post(name: .didReloadAfterPullToRefresh, object: true)
            isLoading = value
        }
    }
    
    private func drawItemTabBarSelected(){
        UITabBar.appearance().backgroundImage = UIImage.colorForNavBar(color: .white)
        UITabBar.appearance().shadowImage = UIImage.colorForNavBar(color: .white)
        self.tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.tabBar.layer.shadowRadius = 14
        self.tabBar.layer.shadowColor = UIColor(red: 172/255, green: 178/255, blue: 197/255, alpha: 0.48 ).cgColor
        self.tabBar.layer.shadowOpacity = 1
        tabPin.frame.size = CGSize(width: 40, height: 40)
        tabPin.addDiamondMask(cornerRadius: 9)
        tabPin.backgroundColor = .white
        tabPin.layer.masksToBounds = true
        let countItems:CGFloat = 3.0
        let itemWidth = UIScreen.main.bounds.width / countItems
        tabPin.center = CGPoint(x: itemWidth/3 + 5 , y: 9)
        self.tabBar.insertSubview(tabPin, at: 0)
    }
    
    func centerPin(_ index: Int){
        let screenWidth = UIScreen.main.bounds.width
        let screenFactor: CGFloat = 4
        tabPin.center = CGPoint(x:(screenWidth/screenFactor)*(CGFloat(index)+0.5), y: 9.0)

    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        NotificationCenter.default.post(name: .didClearRequestOnTabChange, object: true)
        let index = (self.tabBar.items?.firstIndex(of: item))!
        switch index {
        case 1:
            if isLoading {
                centerPin(index)
            }
        default:
            
            centerPin(index)
        }
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool
    {
        var tabTag: ClaroAnalytics.Tag!
        var shouldChangeTab = true
        switch viewController {
        case self.viewControllers![0]:
            tabTag = .homeTab
            logEvent(category: .menuBar, action: .clickOnButton, tag: tabTag)
        case self.viewControllers![1]:
            tabTag = .manageTab
            logEvent(category: .menuBar, action: .clickOnButton, tag: tabTag)
            shouldChangeTab = isLoading
        case self.viewControllers![2]:
            if notificationNumber > 0 {
                notificationNumber = 0
                logEvent(category: .menuBar, action: .clickOnButton, tagString: notificationEvents(packageName, section: .withNotificationTab))
            }else{
                logEvent(category: .menuBar, action: .clickOnButton, tagString: notificationEvents(packageName, section: .withOutNotificationTab))
            }
        case self.viewControllers![3]:
            tabTag = .moreTab
            logEvent(category: .menuBar, action: .clickOnButton, tag: tabTag)
            
        default:
            break
        }
        
        return shouldChangeTab
    }
    
    @objc func didReceiveNotification(_ notification:Notification) {
        if let value = notification.object as? Bool{
            NotificationCenter.default.removeObserver(self, name: .didReceiveNotification, object: nil)
           // getNotificationNumberFromServer(shouldChangeTab: value)
            
            NotificationCenter.default.addObserver(self, selector: #selector(didReceiveNotification(_:)), name: .didReceiveNotification, object: nil)
            
            logEvent(category: .notifications, action: .pushUpNotification, tagString: notificationEvents(packageName, section: .notificationPush))
            
        }
    }
    /*
    func getNotificationNumberFromServer(shouldChangeTab : Bool = false){
        guard Utils.checkInternetConnection() else {
            return
        }
        
        if (notificationNumberSubscription != nil) { notificationNumberSubscription.dispose()}
        
        notificationNumberSubscription = interactorNotification?.getNotificationNumber().subscribe(
            { (maybe) in
                
                switch maybe{
                case .success(let response):
//                    guard response.auditResponse.codigoRespuesta == ServerResponses.success else {
//                        return
//                    }
//                    self.notificationNumber = response.notificaciones.contadorNoVistas.or(0)
                    
                    self.notificationNumber = response.Count.or(0)
                    
                    if self.notificationNumber > 0 {
                        self.viewControllers![2].tabBarItem.badgeValue = String(self.notificationNumber)
                    }else{
                        self.viewControllers![2].tabBarItem.badgeValue = nil
                    }
                    
                    if shouldChangeTab{
                        self.selectedIndex =  2
                        self.centerPin(2)
                    }
                    
                    break
                case .error(_):
                    break
                case .completed:
                    break
                }
                
                
        })
    }*/
}
