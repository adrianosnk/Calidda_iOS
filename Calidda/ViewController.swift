//
//  ViewController.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    private let button:UIButton = {
        let button = UIButton(frame:CGRect(x:0, y:0, width:200, height:52))
        button.setTitle("Login In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func didTapButton(){
        
        let tabBarVC = UITabBarController()
        let vc1 =  UINavigationController(rootViewController: HomeView())
        let vc2 =  UINavigationController(rootViewController: SecondViewController())
        let vc3 =  UINavigationController(rootViewController: ThirdViewController())
        let vc4 =  UINavigationController(rootViewController: FourdViewController())
        let vc5 =  UINavigationController(rootViewController: FiveViewController())
        
        vc1.title = "Home"
        vc2.title = "Contact"
        vc3.title = "Help"
        vc4.title = "About"
        vc5.title = "Setting"
        
        tabBarVC.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: false)
        
        guard let items = tabBarVC.tabBar.items else{
            return
        }
        
        let images = ["house","bell","person.circle","star","gear"]
        for x in 0..<items.count {
            items[x].badgeValue = "1"
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}
class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Home"
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Contact"
    }
}

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Help"
    }
}

class FourdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        title = "About"
    }
}

class FiveViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Setting"
    }
}




