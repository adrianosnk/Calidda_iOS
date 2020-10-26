//
//  UIViewController.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

extension UIViewController : UIGestureRecognizerDelegate {
    
    private struct ViewConstants {
        static let barButtonSize: CGFloat = 30.0
    }
    
    func loadNavigationBar(hideNavigation : Bool, title : String) {
        navigationItem.title = title
        let font = CaliddaFont.medium17
        
        guard let navigationController = navigationController else {
            return
        }
        
        let navBartTitleTextAttributes = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController.navigationBar.barStyle = .default
        navigationController.navigationBar.titleTextAttributes = navBartTitleTextAttributes as [NSAttributedString.Key : Any]
        navigationController.isNavigationBarHidden = hideNavigation
        navigationController.navigationBar.isTranslucent = false
        navigationController.interactivePopGestureRecognizer?.delegate = self
        
        navigationController.navigationBar.barTintColor = CaliddaColors.purple
        navigationController.navigationBar.backgroundColor = CaliddaColors.purple
        
        let image = UIImage()
        navigationController.navigationBar.shadowImage = image
        navigationController.navigationBar.setBackgroundImage(image, for: .default)
    }
    
    func addNavigationRightOption(target: Any?, selector: Selector, icon: UIImage?) {
        guard let rightOption = addNavigationOption(target: target, selector: selector, icon: icon) else {
            return
        }
        self.navigationItem.rightBarButtonItem = rightOption
    }
    
    func addNavigationLeftOption(target: Any?, selector: Selector, icon: UIImage?) {
        guard let leftOption = addNavigationOption(target: target, selector: selector, icon: icon) else {
            return
        }
        self.navigationItem.leftBarButtonItem = leftOption
    }
    
    private func addNavigationOption(target: Any?, selector: Selector, icon: UIImage?) -> UIBarButtonItem? {
        guard let target = target, let icon = icon else {
            return nil
        }
        let tapGesture = UITapGestureRecognizer(target: target, action: selector)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ViewConstants.barButtonSize, height: ViewConstants.barButtonSize))
        view.addGestureRecognizer(tapGesture)
        addImageView(view: view, image: icon)
        
        return UIBarButtonItem(customView: view)
    }
    
    private func addImageView(view: UIView, image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        view.addSubViewWithLayout(view: imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: ViewConstants.barButtonSize),
            view.heightAnchor.constraint(equalToConstant: ViewConstants.barButtonSize)
        ])
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
