//
//  AlertComponent.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

protocol AlertComponentDelegate: class {
    func didDismissAlert(identifier: Int)
}

enum ModalState {
    case initModal
    case presentinModal
    case endingModal
}

class AlertComponent {
    static let shared = AlertComponent()
    
    weak var delegate: AlertComponentDelegate?
    private var isPresenting: Bool {
        return currentViewController != nil
    }
     
    private var alerts = [BaseAlert]()
    
    fileprivate var completionHandler: (() -> Void)?
    private var currentViewController: UIViewController?
    private var centerY = NSLayoutConstraint()
    
    let verticalMargin: CGFloat = 60
    let horizontalMargin: CGFloat = 40
    
    var isContainKeyboard:Bool = false
    
    private init() {
        
    }
    
    // MARK: - Setup
//    withData status: WebServicesResponseStatus?,
    
    func setupAlertKeyboardHidden(controller: UIViewController?, messasge : String? ,externalView : BaseAlert? = nil, completionHandler: (() -> Void)? = nil) {
        isContainKeyboard = true
        externalView?.controllerToPresentAlert = controller
        self.completionHandler = completionHandler
        if externalView != nil {
            alerts.append(externalView!)
            process()
        }
    }
    
    func setupAlert(controller: UIViewController?, messasge : String? ,externalView : BaseAlert? = nil, completionHandler: (() -> Void)? = nil) {
        externalView?.controllerToPresentAlert = controller
        self.completionHandler = completionHandler
        if externalView != nil {
            alerts.append(externalView!)
            process()
        }
    }
    
    func closeAllAlters() {
        alerts.removeAll()
        if let tempVC = currentViewController {
            tempVC.dismiss(animated: true, completion: {
                self.currentViewController = nil
            })
        }
    }
    
    // MARK: - Design and Logic
    
    private func process() {
        if isPresenting {
            return
        }
        
        beginPresentingVC()
    }
    
    private func beginPresentingVC() {
        if alerts.isEmpty {
            return
        }
        
        if self.alerts.isEmpty {
            fatalError("You shouldn't present alerts when you don't have any")
        }
        let alert = self.alerts.removeFirst()
        
        if let viewController = alert.controllerToPresentAlert, viewController == UIApplication.shared.keyWindow?.topViewController() {
            currentViewController = UIViewController()
            if let tempVC = currentViewController {
                tempVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
                tempVC.view.alpha = 0
                tempVC.view.isHidden = false
                tempVC.modalPresentationStyle = .overCurrentContext
                UIApplication.shared.keyWindow?.rootViewController?.modalPresentationStyle = .fullScreen
                UIApplication.shared.keyWindow?.rootViewController?.present(tempVC, animated: false, completion: {
                    self.presentAlert(alert)
                    UIView.animate(withDuration: 0.5) {
                        tempVC.view.alpha = 1
                        
                        // tempVC.view.addG
                        if self.isContainKeyboard == true {
                            let tap = UITapGestureRecognizer(target: tempVC.view, action: #selector(UIView.endEditing(_:)))
                            tempVC.view.addGestureRecognizer(tap)
                        }
                        
                        
                        
                        
                    }
                })
                
            }
        }
    }
    
    private func setConstraint(alert : BaseAlert) {
        
        let isSmallDevice = UIDevice.current.screenType.rawValue <= UIDevice.ScreenType.iPhones_5_5s_5c_SE.rawValue
        let newHorizontalMargin = isSmallDevice ? 20 : horizontalMargin
        
        let vcHeight    = UIScreen.main.bounds.height
        let vcWidth     = UIScreen.main.bounds.width
        //let alertWidth  = vcWidth - (horizontalMargin * 2)
        let alertWidth  = vcWidth - (newHorizontalMargin * 2)
        let alertHeight = vcHeight - (verticalMargin * 2)
        
        //Heigh and Width
        alert.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            alert.widthAnchor.constraint(lessThanOrEqualToConstant: alertWidth),
            alert.widthAnchor.constraint(equalToConstant: alertWidth),
            alert.heightAnchor.constraint(lessThanOrEqualToConstant: alertHeight)
//            alert.heightAnchor.constraint(equalToConstant: alertHeight),
            ])
        
        //Center View
        if let tempView = currentViewController?.view {
            centerY = alert.centerYAnchor.constraint(equalTo: tempView.centerYAnchor)
            NSLayoutConstraint.activate([
                alert.centerXAnchor.constraint(equalTo: tempView.centerXAnchor),
                centerY
                ])
        }
    }
    
    private func loadEffect(type : ModalState) {
        let vcHeight = UIScreen.main.bounds.height
        switch type {
        case .initModal:
            centerY.constant = vcHeight
        case .presentinModal:
            centerY.constant = 0
        case .endingModal:
            centerY.constant = -vcHeight
        }
        
        if let tempView = currentViewController?.view {
            tempView.layoutIfNeeded()
        }
    }
    
    // MARK: - Steps
     
    private func presentAlert(_ alert: BaseAlert) {
        if let tempVC = currentViewController {
            alert.delegate = self
            alert.currentViewController = tempVC
            
            tempVC.view.addSubview(alert)
            
            setConstraint(alert: alert)
            
            /* loadEffect(type: .initModal)
            
            UIView.animate(withDuration: 0.2, animations: {
                self.loadEffect(type: .presentinModal)
                alert.loadWhenViewIsVisible(margin: self.verticalMargin)
            }) */
            
            /*
            UIView.animate(withDuration: 0.5, animations: {
                self.currentViewController?.view.alpha = 1
            }, completion: { _ in
            })
            */
            
            
        }
    }
    
    fileprivate func dismissAlert(_ alert: BaseAlert) {
        UIView.animate(withDuration: 0.5, animations: {
            self.currentViewController?.view.alpha = 0
        }, completion: { _ in
            self.currentViewController?.view.isHidden = true
           if let delegate = self.delegate {
               delegate.didDismissAlert(identifier: alert.identifier)
            }
            alert.removeFromSuperview()
            self.checkAndContinue()
        })
        
        /*
        UIView.animate(withDuration: 5.0, delay: 0.0, options: UIView.AnimationOptions.transitionCrossDissolve, animations: {
             // self.alpha = 0.0
         }, completion: { _ in
             if let delegate = self.delegate {
                delegate.didDismissAlert(identifier: alert.identifier)
             }
             alert.removeFromSuperview()
             self.checkAndContinue()
         }) */
        
        /*
        if let delegate = self.delegate {
           delegate.didDismissAlert(identifier: alert.identifier)
        }
        alert.removeFromSuperview()
        self.checkAndContinue() */
        
        
    }
    
    private func checkAndContinue() {
        if !alerts.isEmpty {
            let alert = self.alerts.removeFirst()
            self.presentAlert(alert)
        } else {
            if let tempVC = currentViewController {
                tempVC.dismiss(animated: true, completion: {
                    self.currentViewController = nil
                })
            }
        }
    }
    
}

// MARK: - Alert Delegate

extension AlertComponent: BaseAlertDelegate {
    func didTapOnButton(forAlert alert: BaseAlert) {
        dismissAlert(alert)
    }
    
    func onTapReload() {
        if completionHandler != nil {
            completionHandler!()
        }
    }
    
    func onTapOnButtonWithCompletion(forAlert alert: BaseAlert) {
        if completionHandler != nil {
            completionHandler!()
        }
        dismissAlert(alert)
    }
}

// MARK: - Last View
internal extension UIWindow {
    func topViewController() -> UIViewController? {
        var top = self.rootViewController
        while true {
            if let presented = top?.presentedViewController {
                top = presented
            } else if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else if let tab = top as? UITabBarController {
                top = tab.selectedViewController
            } else {
                break
            }
        }
        return top
    }
}
