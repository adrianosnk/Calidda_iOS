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
    
     var resultPorcen:Double = 0.0
     var flechaIndicator:Int = 0
    
    var reciboAnio:Int = 0
    var reciboMes:String = ""
    var reciboVolumenFacturado:Double = 0.0
    var reciboVImporteTotal:Double = 0.0
    var reciboFechaVencimiento:String = ""
    var reciboEstado:String = ""
     
    var boletinNombre:String = ""
    var boletinFecha:String = ""
    var boletinArchivo:String = ""
    
    var manteTipo:String = ""
    var manteFechaMant:String = ""
    
    var manteTipo2:String = ""
    var manteFechaMant2:String = ""
    
    var manteTipo3:String = ""
    var manteFechaMant3:String = ""
    
    var manteTipo4:String = ""
    var manteFechaMant4:String = ""
    
    var resultPorcentage:String = ""
    

     @IBOutlet var lblRazonSocial:UILabel!
     @IBOutlet var lblCuentaContrato:UILabel!
    
    var razonSocial:String = ""
    var cuentaContrato:String = ""
    
    fileprivate var doctorPropertiesModel: DoctorProperties?
    
    var delegateFooter: MenuFooterDelegate?
    
    let menuFooter = MenuFooter()
    //menuFooter.onClickConsumo ()
    
    var activityIndicator = UIActivityIndicatorView()
    let loadingView = UIView()
    let loadingLabel = UILabel()
    var spinner = UIActivityIndicatorView()
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          let alert = AlertComponent.shared
          alert.closeAllAlters()
    }
    
    @IBAction func goToBack(){
       // router.pop(sender: self)
        DispatchQueue.main.async {
            let view = PopUpCloseErrorView()
            view.setupView(type: .warning)
            AlertComponent.shared.setupAlert(controller: self, messasge: nil, externalView: view)
       }
    }
    func loadData(){
        
         
                setLoadingScreen(myMsg: "Loading...")
                
       // ProgressView.shared.showProgressView()
                //let userProperties = presenter.getMyUser().TokenAcceso!
                let userProperties =  UserDefaults.standard.string(forKey: "KeyToken")!

                
        
                self.presenter.getInfoDoctor(token: userProperties)
                    .subscribeOn(MainScheduler.asyncInstance)
                    .subscribe(onNext: {result in
                       // self.fillInfoTop(result.data)
                      //  ProgressView.shared.hideProgressView()
                        self.fillInfoTop(result)
                        
                       // self.spinner.stopAnimating()
                       // self.activityIndicator.stopAnimating()
                        
                       // UIApplication.shared.endIgnoringInteractionEvents()
                        //self.loadingLabel.isHidden = true
                        
                    },
                               onError: {error in
                    },
                               onCompleted: {},
                               onDisposed: {})
                    .disposed(by: self.disposeBag)
                self.registerCell()
                
                
                
         
    }
    // MARK: Helpers
    
    func registerCell() {
        //Celda Home Info
        let profileCellNib = UINib(nibName: HomeInfoViewCell.reuseIdentifier, bundle: nil)
        tableView.register(profileCellNib, forCellReuseIdentifier: HomeInfoViewCell.reuseIdentifier)
        
        // Header Home Lista
        let profileListaHeaderCellNib = UINib(nibName: HomeFirstDetailInfoViewCell.reuseIdentifier, bundle: nil)
        tableView.register(profileListaHeaderCellNib, forCellReuseIdentifier: HomeFirstDetailInfoViewCell.reuseIdentifier)
        
        
        //Celda Home Lista
        let profileListaCellNib = UINib(nibName: HomeListaViewCell.reuseIdentifier, bundle: nil)
        tableView.register(profileListaCellNib, forCellReuseIdentifier: HomeListaViewCell.reuseIdentifier)
    }
   // func fillInfoTop(_ info:DoctorProperties){
        func fillInfoTop(_ info:ResponseResuData){
            ProgressView.shared.hideProgressView()
        
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
            
            self.resultPorcen = ((self.mountDesp/self.mountAnt) - 1)*100
            
            if self.resultPorcen > 0 {
                print("positivo")
                self.flechaIndicator = 1
            }else{
                print("negativo")
                self.flechaIndicator = 0
                
            }
           
            //let aString = "This is my string"
             //let newString = aString.replacingOccurrences(of: " ", with: "+")
           
            print("resultPorcen::>>","\(self.resultPorcen)")
            print("resultfirstName::>>","\(String(format: "%.f", self.resultPorcen))")
            
            let aString = "\(String(format: "%.f", self.resultPorcen))"
            self.resultPorcentage = aString.replacingOccurrences(of: "-", with: "")
            
            print("resultPorcen::>>","\(self.resultPorcen)")
            
            
            
            
            
            
            
            self.reciboAnio = info.Recibos[0].Anio
            self.reciboMes = "\(info.Recibos[0].Mes ?? 0)"
            
            if self.reciboMes == "1" {
                self.reciboMes = "Enero"
            }
            
            if self.reciboMes == "2" {
                self.reciboMes = "Febrero"
            }
            
            if self.reciboMes == "3" {
                self.reciboMes = "Marzo"
            }
            
            if self.reciboMes == "4" {
                self.reciboMes = "Abril"
            }
            
            if self.reciboMes == "5" {
                self.reciboMes = "Mayo"
            }
            
            if self.reciboMes == "6" {
                self.reciboMes = "Junio"
            }
            
            if self.reciboMes == "7" {
                self.reciboMes = "Julio"
            }
            
            if self.reciboMes == "8" {
                self.reciboMes = "Agosto"
            }
            
            if self.reciboMes == "9" {
                self.reciboMes = "Setiembre"
            }
            
            if self.reciboMes == "10" {
                self.reciboMes = "Octubre"
            }
            
            if self.reciboMes == "11" {
                self.reciboMes = "Noviembre"
            }
            
            if self.reciboMes == "12" {
                self.reciboMes = "Diciembre"
            }
             
            self.reciboVolumenFacturado = info.Recibos[0].VolumenFacturado
            self.reciboVImporteTotal = info.Recibos[0].ImporteTotal
            self.reciboFechaVencimiento = info.Recibos[0].FechaVencimiento
            self.reciboEstado = info.Recibos[0].Estado
            
            
            self.razonSocial  = info.RazonSocial
            self.cuentaContrato = "Nro. Cliente: \(info.CuentaContrato ?? "")"

            //self.lblRazonSocial.text = info.RazonSocial
            //self.lblCuentaContrato.text = "Nro. Cliente: \(info.CuentaContrato ?? "")"
            
            
            self.boletinNombre = info.Boletines[0].Nombre
            self.boletinFecha = info.Boletines[0].Fecha
             
            self.manteTipo = info.Mantenimientos[0].Nombre
            self.manteFechaMant = info.Mantenimientos[0].FechaMantenimiento
            
            self.manteTipo2 = info.Mantenimientos[1].Nombre
            self.manteFechaMant2 = info.Mantenimientos[1].FechaMantenimiento
            
            self.manteTipo3 = info.Mantenimientos[2].Nombre
            self.manteFechaMant3 = info.Mantenimientos[2].FechaMantenimiento
            
            
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
    
    func setLoadingScreen(myMsg : String) {
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (self.view.frame.width / 2) - (width / 2)
        let y = (169 / 2) - (height / 2) + 60
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.loadingLabel.textColor = UIColor.white
        self.loadingLabel.textAlignment = NSTextAlignment.center
        self.loadingLabel.text = myMsg
        self.loadingLabel.frame = CGRect(x: 0, y: 0, width: 160, height: 30)
        self.loadingLabel.isHidden = false
        self.activityIndicator.style = UIActivityIndicatorView.Style.white
        self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.activityIndicator.startAnimating()
        loadingView.addSubview(self.spinner)
        loadingView.addSubview(self.activityIndicator)
        loadingView.addSubview(self.loadingLabel)
        self.view.addSubview(loadingView)
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
        return 3
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("num:::",self.doctorPropertiesModel?.services.count as Any)
        switch section {
             case 0:
                 return 1
             case 1:
                 return 1
            default:
                return self.doctorPropertiesModel?.services.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         //let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableView", for: indexPath) as? ServicesTableView
        
        switch indexPath.section {
              case 0:
                  return sectionHeaderCell(tableView, cellForRowAt: indexPath)
              case 1:
                  return sectionOneCell(tableView, cellForRowAt: indexPath)
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
            return 65.0
        case 1:
            return 600.0
        default:
             return 112.0
        }
    }
     
    
    func sectionHeaderCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    
           guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeFirstDetailInfoViewCell", for: indexPath) as? HomeFirstDetailInfoViewCell, let categoryValue = self.doctorPropertiesModel?.services[indexPath.row] else {
                             return UITableViewCell()
                         }
                         tableViewCell.selectionStyle = .none
                         //tableViewCell.loadWith(services: categoryValue)
        

        tableViewCell.lblRazonSocial.text = self.razonSocial
        tableViewCell.lblCuentaContrato.text = self.cuentaContrato
            return tableViewCell
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
            cell.facturaMountStringLabel.text = "\(self.reciboMes)"
            cell.facturaVolLabel.text = "\(self.reciboVolumenFacturado) sm3"
            cell.facturaImpoLabel.text = "S/ \(self.reciboVImporteTotal)"
            
            cell.CalLabel.text = "\(self.resultPorcentage)%"
            
            
            if self.flechaIndicator == 1{
                cell.iconImage.image = UIImage(named: "icon_FlechaUpLoadGreen")
            }else{
                cell.iconImage.image = UIImage(named: "icon_FlechaDownLoadGreen")
                
            }
            
            /*
            cell.viwBackContentSubDeman.isHidden = true
            cell.viwBackContentSubFac.isHidden = true
            cell.viwBackContentSubInd.isHidden = true
            cell.viwBackContentSubMant.isHidden = true
            */
            
            
            
            if self.boletinFecha != "" {
                // create dateFormatter with UTC time format
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                let date = dateFormatter.date(from: self.boletinFecha)
                
                print("self.boletinFecha>>>",self.boletinFecha)
                //let date = dateFormatter.date(from: "2020-12-30T05:00:00.000Z")

                // change to a readable time format and change to local time zone
                dateFormatter.dateFormat = "yyyy"
                dateFormatter.timeZone = NSTimeZone.local
                let timeStamp = dateFormatter.string(from: date!)
                
                
                cell.boletinFechaLabel.text  = timeStamp
            }
            cell.boletinNombreLabel.text  = self.boletinNombre
           // cell.boletinFechaLabel.text  = self.boletinFecha
            
            
            
            cell.manteTipoLabel.text  = self.manteTipo
            cell.manteTipoLabel2.text  = self.manteTipo2
            cell.manteTipoLabel3.text  = self.manteTipo3
            
             
            if self.manteFechaMant != "" {
                         // create dateFormatter with UTC time format
                         let dateFormatter = DateFormatter()
                         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                         let date = dateFormatter.date(from: self.manteFechaMant)
                         let date2 = dateFormatter.date(from: self.manteFechaMant2)
                         let date3 = dateFormatter.date(from: self.manteFechaMant3)
                         let date4 = dateFormatter.date(from: self.manteFechaMant4)
                         
                         print("self.boletinFecha>>>",self.boletinFecha)
                         //let date = dateFormatter.date(from: "2020-12-30T05:00:00.000Z")

                         // change to a readable time format and change to local time zone
                         dateFormatter.dateFormat = "dd / MMMM"
                         dateFormatter.timeZone = NSTimeZone.local
                         let timeStamp = dateFormatter.string(from: date!)
                         let timeStamp2 = dateFormatter.string(from: date2!)
                         let timeStamp3 = dateFormatter.string(from: date3!)
                       
                         
                         
                       //cell.manteFechaLabel.text = self.manteFechaMant
                cell.manteFechaLabel.text = timeStamp
                cell.manteFechaLabel2.text = timeStamp2
                cell.manteFechaLabel3.text = timeStamp3
             }
            
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

      
        switch indexPath.section {
              case 1:
                 DispatchQueue.main.async {
                       self.router.show(view: .detailNovedades, sender: self)
                 }
              default:
                 DispatchQueue.main.async {
                     //self.router.show(view: .detailNovedades, sender: self)
                 }
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


// MARK: - PopUpErrorView Delegate
extension HomeView: PopUpCloseErrorViewDelegate {
    func onClose(type: PopUpCloseErrorType) {
       // if type == .connection {
           // self.goToHome()
            router.pop(sender: self)
       // }
    }
    func onAceppt(type: PopUpCloseErrorType) {
          if type == .connection {
             // self.goToHome()
              router.pop(sender: self)
          }
      }
   
}

