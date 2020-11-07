//
//  RegisterView.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//
  
import UIKit
import RxSwift
class MantenimientoView: UIViewController {
    //var style: Style = Style.myApp
    var router:Router!
    
    @IBOutlet var viwBackContent:UIView!
    @IBOutlet var viwBackUser:UIView!
    @IBOutlet var emailTexfield:UITextField!
    
    let disposebag = DisposeBag()
    private let presenter = MantenimientoPresenter(loginService: AuthenticationService())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    func setupUI(){
        
      
    }
    @IBAction func goToBack(){
        router.pop(sender: self)
    }

    @IBAction func btnConsumo(_ sender:UIButton){
           DispatchQueue.main.async {
               self.router.show(view: .consumo, sender: self)
           }
       }
       
        @IBAction func btnFactura(_ sender:UIButton){
              DispatchQueue.main.async {
                  self.router.show(view: .factura, sender: self)
              }
         }
       
         @IBAction func btnMenu(_ sender:UIButton){
              DispatchQueue.main.async {
                  self.router.show(view: .homeMenu, sender: self)
              }
         }
       
          @IBAction func btnMante(_ sender:UIButton){
              DispatchQueue.main.async {
                  self.router.show(view: .mantenimiento, sender: self)
              }
          }
       
          @IBAction func btnGestion(_ sender:UIButton){
              DispatchQueue.main.async {
                  self.router.show(view: .gestion, sender: self)
              }
          }
    
}
