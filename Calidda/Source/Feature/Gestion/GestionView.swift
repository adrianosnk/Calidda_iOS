//
//  RegisterView.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import Charts

import UIKit
import RxSwift
class GestionView: UIViewController , ChartViewDelegate{
    //var style: Style = Style.myApp
    var router:Router!
    
    @IBOutlet var viwBackContent:UIView!
    @IBOutlet var viwBackFirst:UIView!
    @IBOutlet var viwBackSecond:UIView!
    @IBOutlet var viwBackThere:UIView!
    @IBOutlet var viwBackFour:UIView!
    @IBOutlet var viwBackFive:UIView!
    @IBOutlet var viwBackSix:UIView!
    @IBOutlet var viwBackSeven:UIView!
    @IBOutlet var emailTexfield:UITextField!
    
    
    let disposebag = DisposeBag()
    
    var barChart = BarChartView()
    
    private let presenter = GestionPresenter(loginService: AuthenticationService())
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
        setupUI()
        setupNavigationBar()
     }
      // MARK: - Setup
      func setupNavigationBar(){
                  self.navigationController?.navigationBar.isHidden = false
                  loadNavigationBar(hideNavigation: false, title: "Gestion")
                  addNavigationLeftLogoOption(target: self, selector: #selector(goBack), icon: CaliddaImage.getImage(named: .icon_LogoCalidda))
                  addNavigationRightOption(target: self, selector: #selector(goNotification), icon: CaliddaImage.getImage(named: .icon_AlertaBlue))
       }
       // MARK: - Actions
       @IBAction func goBack() {
         // router.pop(sender: self)
       }
       @IBAction func goNotification() {
         // router.pop(sender: self)
       }
    func setupUI(){
        

        self.viwBackFirst.layer.cornerRadius = 10
        self.viwBackFirst.layer.borderWidth = 2
        self.viwBackFirst.backgroundColor = .white
        self.viwBackFirst.layer.borderColor = CaliddaColors.lightLead.cgColor
        
        
        self.viwBackSecond.layer.cornerRadius = 10
        self.viwBackSecond.layer.borderWidth = 2
        self.viwBackSecond.backgroundColor = .white
        self.viwBackSecond.layer.borderColor = CaliddaColors.lightLead.cgColor
        
        self.viwBackThere.layer.cornerRadius = 10
        self.viwBackThere.layer.borderWidth = 2
        self.viwBackThere.backgroundColor = .white
        self.viwBackThere.layer.borderColor = CaliddaColors.lightLead.cgColor
        
        self.viwBackFour.layer.cornerRadius = 10
        self.viwBackFour.layer.borderWidth = 2
        self.viwBackFour.backgroundColor = .white
        self.viwBackFour.layer.borderColor = CaliddaColors.lightLead.cgColor
        
   
      
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
      
        
    }
    @IBAction func goToBack(){
        router.pop(sender: self)
    }

    @IBAction func btnChangePasssword(_ sender:UIButton){
            DispatchQueue.main.async {
                self.router.show(view: .changePassword, sender: self)
            }
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


