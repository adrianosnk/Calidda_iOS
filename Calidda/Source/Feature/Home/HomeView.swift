//
//  HomeView.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MaterialTextField
import SDWebImage
import MaterialComponents.MaterialBottomNavigation

protocol HomeViewDelegate: class {
    func onClickCategory(categoryId: String)
}

class HomeView: UIViewController {

    
   // var style: Style = Style.myApp
    var router:Router!
    let disposeBag = DisposeBag()
    private let presenter = HomePresenter(homeService: HomeService())
     
    @IBOutlet var lblNameDoctor:UILabel!
    @IBOutlet var lblNameEspecialidate:UILabel!
    @IBOutlet var lblNameCMP:UILabel!
    @IBOutlet var imgIconPerfil:UIImageView!
    @IBOutlet var viwBackHome:UIView!
    @IBOutlet var viwBack:UIView!
    @IBOutlet var viwBackHeader:UIView!
    @IBOutlet var tableView:UITableView!
    weak var delegate: HomeViewDelegate?
    
    
    var IdUser:String = ""
    var RazonSocial:String = ""
    var CuentaContrato:String = ""
    var mountAnt:Double = 0.0
    var mountDesp:Double = 0.0
    
    
    var reciboAnio:Int = 0
    var reciboMes:Int = 0
    var reciboVolumenFacturado:Double = 0.0
    var reciboVImporteTotal:Double = 0.0
    var reciboFechaVencimiento:String = ""
    var reciboEstado:String = ""
    
    var boletinNombre:String = ""
    var boletinFecha:String = ""
    var boletinArchivo:String = ""
    
    var manteTipo:String = ""
    var manteFechaMant:String = ""
    
     
    fileprivate var doctorPropertiesModel: DoctorProperties?
    
    var delegateFooter: MenuFooterDelegate?
    
    let menuFooter = MenuFooter()
    //menuFooter.onClickConsumo ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //self.didTapButton()
        
        self.delegateFooter = self
        self.menuFooter.delegateFooter = self
        setupUI()
        loadData()
        
         tableView.reloadData()
    }
    
  
    
    // MARK: - Setup
    func setupUI(){
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

     //   self.MenuFooterDelegate.delegate = self
     //   style.apply(textStyle: .title, to: lblNameDoctor)
     //   style.apply(textStyle: .subtitleDoctor, to: lblNameEspecialidate)
     //   style.apply(textStyle: .subtitleDoctor, to: lblNameCMP)

     //   lblNameDoctor.textColor = CaliddaColors.white
     //   lblNameEspecialidate.textColor = CaliddaColors.white
     //   lblNameCMP.textColor = CaliddaColors.white
        
       // viwBack.layer.cornerRadius = 24;
       // viwBack.layer.masksToBounds = true;
       // viwBackHeader.backgroundColor = CaliddaColors.purple
        
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.separatorColor = UIColor.clear
        
        
        viwBackHome.backgroundColor = CaliddaColors.lightBackDark
    }
    
    @IBAction func goToBack(){
        router.pop(sender: self)
    }
    func loadData(){
        
       
                                  
        
        //let userProperties = presenter.getMyUser().TokenAcceso!
        let userProperties =  UserDefaults.standard.string(forKey: "KeyToken")!
         
        presenter.getInfoDoctor(token: userProperties)
            .subscribeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: {result in
                
               // self.fillInfoTop(result.data)
                self.fillInfoTop(result)
            },
                       onError: {error in
                        
            },
                       onCompleted: {},
                       onDisposed: {})
            .disposed(by: self.disposeBag)
        
        
        registerCell()
    }
    // MARK: Helpers
    
    func registerCell() {
        //Celda Home Info
        let profileCellNib = UINib(nibName: HomeInfoViewCell.reuseIdentifier, bundle: nil)
        tableView.register(profileCellNib, forCellReuseIdentifier: HomeInfoViewCell.reuseIdentifier)
        
        //Celda Home Lista
        let profileListaCellNib = UINib(nibName: HomeListaViewCell.reuseIdentifier, bundle: nil)
        tableView.register(profileListaCellNib, forCellReuseIdentifier: HomeListaViewCell.reuseIdentifier)
    }
   // func fillInfoTop(_ info:DoctorProperties){
        func fillInfoTop(_ info:ResponseResuData){
        
        DispatchQueue.main.async {
           // self.doctorPropertiesModel = info
            
            print(" infoooo >>::", info)
            print(" self.doctorPropertiesModel >>", self.doctorPropertiesModel as Any)
           
            //let fileNamePerfil = info.first_name!
            let fileNamePerfil = info.Id!
            print(" fileNamePerfilIDDD >>::", fileNamePerfil)
            let fileArrayName = fileNamePerfil.components(separatedBy: " ")
            let firstFileNamePerfil = fileArrayName.first
            
            self.mountAnt = info.DemandaMesAnterior
            self.mountDesp = info.DemandaActual
            
            self.reciboAnio = info.Recibos[0].Anio
            self.reciboMes = info.Recibos[0].Mes
            self.reciboVolumenFacturado = info.Recibos[0].VolumenFacturado
            self.reciboVImporteTotal = info.Recibos[0].ImporteTotal
            self.reciboFechaVencimiento = info.Recibos[0].FechaVencimiento
            self.reciboEstado = info.Recibos[0].Estado
            
            
            print(" self.reciboAnio >>::", self.reciboAnio)
            print(" self.reciboMes >>::", self.reciboMes)
            print(" self.reciboVolumenFacturado >>::", self.reciboVolumenFacturado)
            print(" self.reciboVImporteTotal >>::", self.reciboVImporteTotal)
            print(" self.reciboFechaVencimiento >>::", self.reciboFechaVencimiento)
            print(" self.reciboEstado >>::", self.reciboEstado)
        //    self.lblNameDoctor.text = "Hola Dr(a) \(String(firstFileNamePerfil!))"
            //self.lblNameEspecialidate.text = info.speciality!.uppercased()
         //   self.lblNameCMP.text = info.number_record!
            
            // First of all remove the old image (required for images in cells)
            
            //let fileName = info.photo!
            //let fileArray = fileName.components(separatedBy: "/")
            //let finalFileName = fileArray.last
           // print("finalFileName::",String(finalFileName!))
            
         //   self.imgIconPerfil.sd_setImage(with: URL(string: info.photo!), placeholderImage: UIImage(named: String(finalFileName!)))
        //    self.showServices(services: info.services)

            self.tableView.reloadData()
 
        }
    }
    func showServices(services:[HomeServices]){
        
        let items = Observable.just( services )
        items.bind(to: self.tableView.rx.items(cellIdentifier: "ServicesTableView")) { row, model, cell in
            let serviceCell = cell as? ServicesTableView
            serviceCell?.loadWith(services: model)
        }.disposed(by: self.disposeBag)
    }
    
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         // create a new cell if needed or reuse an old one
        let cell:ServicesTableView = (self.tableView.dequeueReusableCell(withIdentifier: "ServicesTableView") as! ServicesTableView?)!

               // set the text from the data model
               cell.titleServiceLabel.text = "name"

               return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         // Do here
        DispatchQueue.main.async {
                   self.router.show(view: .scheduled, sender: self)
        }
       }
    
    */
    @IBAction func btnSettings(_ sender:UIButton){
        
        self.goToSettings()
        
    }
     
    @IBAction func btnConsumo(_ sender:UIButton){
       // self.menuFooter.onClickConsumoView ()
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
    
    func goToSettings(){
        //para ir al hilo principal
        DispatchQueue.main.async {
           // self.router.show(view: .settings, sender: self)
           
            //self.router.show(view: .scheduled, sender: self)
         //   self.router.show(view: .SubDetailAttentionRegister, sender: self)
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    /*
     func didTapButton(){
            
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
 */
    }
/*
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
 
*/


// MARK: - Table view datasource
extension HomeView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("num:::",self.doctorPropertiesModel?.services.count as Any)
        switch section {
             case 0:
                 return 1
             case 1:
                 return self.doctorPropertiesModel?.services.count ?? 0
            default:
                 return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         //let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableView", for: indexPath) as? ServicesTableView
        
        switch indexPath.section {
              case 0:
                  return sectionOneCell(tableView, cellForRowAt: indexPath)
              case 1:
                  return sectionTwoCell(tableView, cellForRowAt: indexPath)
              default:
                  return sectionTwoCell(tableView, cellForRowAt: indexPath)
        }
                  
        /*
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableView", for: indexPath) as? ServicesTableView, let categoryValue = self.doctorPropertiesModel?.services[indexPath.row] else {
                   return UITableViewCell()
               }
               tableViewCell.loadWith(services: categoryValue)
               
        return tableViewCell
         */
    }
    // MARK: UITableViewDelegate
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 450.0
        default:
              return 112.0
        }
    }
     
    
    // MARK: Cell
      func sectionOneCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: HomeInfoViewCell.reuseIdentifier, for: indexPath)
          if let cell = cell as? HomeInfoViewCell {
            cell.selectionStyle = .none
              //cell.loadWithData(info: presenter.getDoctorInfo())
            cell.mountAnteLabel.text = "\(self.mountAnt) m3"
            cell.mountDespLabel.text = "\(self.mountDesp) m3"
            
            

            
            
            cell.facturaYearLabel.text = "\(self.reciboAnio)"
            cell.facturaMountStringLabel.text = "\(self.reciboVImporteTotal)"
            cell.facturaVolLabel.text = "\(self.reciboVolumenFacturado)"
            cell.facturaImpoLabel.text = "\(self.reciboVImporteTotal)"
            
          }
          
          return cell
      }
    func sectionTwoCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        /*
         let cell = tableView.dequeueReusableCell(withIdentifier: HomeListaViewCell.reuseIdentifier, for: indexPath)
          if let cell = cell as? HomeListaViewCell {
              //cell.loadWithData(info: presenter.getDoctorInfo())
          }
          return cell
         */
        
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeListaViewCell", for: indexPath) as? HomeListaViewCell, let categoryValue = self.doctorPropertiesModel?.services[indexPath.row] else {
                   return UITableViewCell()
               }
               tableViewCell.selectionStyle = .none
               tableViewCell.loadWith(services: categoryValue)
               
        return tableViewCell
        
        
      }
}

// MARK: - Table view delegate
extension HomeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      /*  guard let delegate = delegate, let categories = self.doctorPropertiesModel?.services[indexPath.row] else {
            
            DispatchQueue.main.async {
                                  self.router.show(view: .scheduled, sender: self)
                       }
            return
        }*/
         let categories = self.doctorPropertiesModel?.services[indexPath.row]
        let category = categories?.service_code
      //  if !category.isExpensesEmpty {
        print("category::",category as Any)

      
        DispatchQueue.main.async {
            self.router.show(view: .detailNovedades, sender: self)
         }
        /*
        if category == "001" {
            //Chat
            DispatchQueue.main.async {
              //        self.router.show(view: .detailNovedades, sender: self)
                  }
        }
        
        if category == "002" {
            //Chat
            
              DispatchQueue.main.async {
                     // self.router.show(view: .factura, sender: self)
                  }
        }
        if category == "003" {
            //Atenciones agendadas
            DispatchQueue.main.async {
              // self.router.show(view: .scheduled, sender: self)
            }
        }
        if category == "004" {
            //Registro de Atenciones
            DispatchQueue.main.async {
              // self.router.show(view: .SubDetailAttentionRegister, sender: self)
            }
        }
        if category == "005" {
            //Atenciones agendadas
            DispatchQueue.main.async {
              // self.router.show(view: .dateScheduled, sender: self)
            }
        }
         */
      //  self.delegate?.onClickCategory(categoryId: category!)
        
           
        
       // }
    }
    
}

/*
// MARK: - PopUpErrorView Delegate
extension HomeView: PopUpErrorViewDelegate {
    func onClose(type: PopUpErrorType) {
        if type == .connection {
            self.goToHome()
        }
    }
}
 */


// MARK: - PopUpErrorView Delegate
extension HomeView: MenuFooterDelegate {
    func onClickConsumo() {
        self.menuFooter.onClickConsumo ()
        DispatchQueue.main.async {
                             self.router.show(view: .factura, sender: self)
                         }
    }
    
    func onClickFactura() {
         DispatchQueue.main.async {
                             self.router.show(view: .factura, sender: self)
                         }
    }
    
    func onClickMenu() {
         DispatchQueue.main.async {
                             self.router.show(view: .factura, sender: self)
                         }
    }
    
    func onClickMante() {
         DispatchQueue.main.async {
                             self.router.show(view: .factura, sender: self)
                         }
    }
    
    func onClickConfiguration() {
         DispatchQueue.main.async {
                             self.router.show(view: .factura, sender: self)
                         }
    }
    
  
}
