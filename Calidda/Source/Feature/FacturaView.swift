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

protocol FacturaViewDelegate: class {
    func onClickCategory(categoryId: String)
}

class FacturaView: UIViewController {

    
   // var style: Style = Style.myApp
    var router:Router!
    let disposeBag = DisposeBag()
    private let presenter = FacturaPresenter(facturaService: FacturaService())
     
    @IBOutlet var lblNameDoctor:UILabel!
    @IBOutlet var lblNameEspecialidate:UILabel!
    @IBOutlet var lblNameCMP:UILabel!
    @IBOutlet var imgIconPerfil:UIImageView!
    @IBOutlet var viwBackHome:UIView!
    @IBOutlet var viwBack:UIView!
    @IBOutlet var viwBackHeader:UIView!
    @IBOutlet var tableView:UITableView!
    weak var delegate: FacturaViewDelegate?
    
      var newGroupSections = [ResponseFacturaData]()
    
    fileprivate var doctorPropertiesModel: DoctorProperties?
    
    var myArray:[String] = []
    
    fileprivate var reponseFacturaModel: ResponseFacturaData?
    
    var refreshControl = UIRefreshControl()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.didTapButton()
        setupUI()
        loadData()
        tableView.reloadData()
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
        setupNavigationBar()
     }  
     // MARK: - Setup
     func setupNavigationBar(){
            self.navigationController?.navigationBar.isHidden = false
            loadNavigationBar(hideNavigation: false, title: "Home")
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
    
      @objc func refresh(_ sender: AnyObject) {
         // Code to refresh table view
        loadData()
        refreshControl.endRefreshing()
      }
    
    // MARK: - Setup
    func setupUI(){
        
        
        tableView.delegate = self
        tableView.dataSource = self
              
        
     //   style.apply(textStyle: .title, to: lblNameDoctor)
     //   style.apply(textStyle: .subtitleDoctor, to: lblNameEspecialidate)
     //   style.apply(textStyle: .subtitleDoctor, to: lblNameCMP)

     //   lblNameDoctor.textColor = CaliddaColors.white
     //   lblNameEspecialidate.textColor = CaliddaColors.white
    //    lblNameCMP.textColor = CaliddaColors.white
        
       // viwBack.layer.cornerRadius = 24;
       // viwBack.layer.masksToBounds = true;
      //  viwBackHeader.backgroundColor = CaliddaColors.purple
        
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
        let cuentaContrato =  UserDefaults.standard.string(forKey: "KeyCuentaContrato")!
        presenter.getInfoFactura(token: userProperties,cuentaContrato: cuentaContrato)
            .subscribeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: {result in
                //self.fillInfoTop(result.data)
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
           let profileListaFirstCellNib = UINib(nibName: FacturaListaFirstDetailInfoViewCell.reuseIdentifier, bundle: nil)
           tableView.register(profileListaFirstCellNib, forCellReuseIdentifier: FacturaListaFirstDetailInfoViewCell.reuseIdentifier)
        
        //Celda Home Lista
        let profileListaCellNib = UINib(nibName: FacturaListaViewCell.reuseIdentifier, bundle: nil)
        tableView.register(profileListaCellNib, forCellReuseIdentifier: FacturaListaViewCell.reuseIdentifier)
    } 
    func fillInfoTop(_ info:[ResponseFacturaData]){
     
        DispatchQueue.main.async {
            //self.reponseFacturaModel = info
            
             self.newGroupSections = info
            
            print(" infooooFac >>::", info)
            print(" self.reponseFacturaModelFac >>", self.reponseFacturaModel as Any)
           
            //  self.reciboAnio = info.Recibos[0].Anio
          /*
            let fileName = info.photo!
            let fileArray = fileName.components(separatedBy: "/")
            let finalFileName = fileArray.last
            print("finalFileName::",String(finalFileName!))
            */
    //myArray
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
    
   
    @IBAction func btnSettings(_ sender:UIButton){
        
        self.goToSettings()
        
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
        self.navigationController?.navigationBar.isHidden = false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
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
   



// MARK: - Table view datasource
extension FacturaView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    } 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("num:::", self.newGroupSections.count as Any)
        switch section {
                case 0:
                     return 1
                default:
                     return self.newGroupSections.count
          }
    } 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         //let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableView", for: indexPath) as? ServicesTableView
        switch indexPath.section {
                  case 0:
                      return sectionHeaderCell(tableView, cellForRowAt: indexPath)
                  default:
                      return sectionOneCell(tableView, cellForRowAt: indexPath)
            }
    }
    // MARK: UITableViewDelegate
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
              case 0:
                  return 60.0
              default:
                    return 95.0
              }
        /*switch indexPath.section {
        case 0:
            return 450.0
        default:
              return 112.0
        }*/
    }
     
    func sectionHeaderCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 
               /*
                let cell = tableView.dequeueReusableCell(withIdentifier: HomeListaViewCell.reuseIdentifier, for: indexPath)
                 if let cell = cell as? HomeListaViewCell {
                     //cell.loadWithData(info: presenter.getDoctorInfo())
                 }
                 return cell
                */
               
               guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "FacturaListaFirstDetailInfoViewCell", for: indexPath) as? FacturaListaFirstDetailInfoViewCell, let categoryValue = self.doctorPropertiesModel?.services[indexPath.row] else {
                          return UITableViewCell()
                      }
                      tableViewCell.selectionStyle = .none
                      tableViewCell.loadWith(services: categoryValue)
                      
               return tableViewCell
               
               
             }
    // MARK: Cell
      func sectionOneCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "FacturaListaViewCell", for: indexPath) as? FacturaListaViewCell
        
        let categoryValue = self.newGroupSections[indexPath.row]
        
        tableViewCell!.selectionStyle = .none
        //tableViewCell!.loadWith(services: categoryValue)
        print("categoryValue.FechaVencimiento::>>",categoryValue.FechaVencimiento)
        tableViewCell!.titleServiceLabel.text = categoryValue.FechaVencimiento
        tableViewCell!.importeLabel.text = categoryValue.ImporteTotal.convertToString(withSymbol: true)
        tableViewCell!.anioLabel.text = "\(categoryValue.Anio ?? 0)"
        var reciboMes:String = ""
        reciboMes = "\(categoryValue.Mes ?? 0)"
        
        if reciboMes == "1" {
            reciboMes = "Enero"
        }
        if reciboMes == "2" {
            reciboMes = "Febrero"
        }
        if reciboMes == "3" {
            reciboMes = "Marzo"
        }
        if reciboMes == "4" {
            reciboMes = "Abril"
        }
        if reciboMes == "5" {
            reciboMes = "Mayo"
        }
        if reciboMes == "6" {
            reciboMes = "Junio"
        }
        if reciboMes == "7" {
            reciboMes = "Julio"
        }
        if reciboMes == "8" {
            reciboMes = "Agosto"
        }
        if reciboMes == "9" {
            reciboMes = "Setiembre"
        }
        if reciboMes == "10" {
            reciboMes = "Octubre"
        }
        if reciboMes == "11" {
            reciboMes = "Noviembre"
        }
        if reciboMes == "12" {
            reciboMes = "Diciembre"
        }
        
        tableViewCell!.mesLabel.text = reciboMes
         
        let dateFormatter = DateFormatter()
             dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
             let date = dateFormatter.date(from: categoryValue.FechaVencimiento)
             dateFormatter.dateFormat = "dd/MM"
             dateFormatter.timeZone = NSTimeZone.local
             let timeStamp = dateFormatter.string(from: date!)
        
        if categoryValue.IdEstado == "1"{
            tableViewCell!.viwContentFecha.isHidden = true
        }else if categoryValue.IdEstado == "2" {

            tableViewCell!.fechVenLabel2.text = timeStamp
            tableViewCell!.fechVenLabel2.textColor = CaliddaColors.white
            tableViewCell!.viwContentFecha.isHidden = false
            
            if categoryValue.AlertaVencimiento == true{
                
                tableViewCell!.viwContentFecha.backgroundColor = CaliddaColors.red
            }else if categoryValue.AlertaVencimiento == false {
                
                tableViewCell!.viwContentFecha.backgroundColor = CaliddaColors.skyblue
                
            }
        }
        
     
        
        
        tableViewCell!.fechVenLabel.text = timeStamp
        
        return tableViewCell!
        
      }
}

// MARK: - Table view delegate
extension FacturaView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      /*  guard let delegate = delegate, let categories = self.doctorPropertiesModel?.services[indexPath.row] else {
            
            DispatchQueue.main.async {
                                  self.router.show(view: .scheduled, sender: self)
                       }
            return
        }*/
         let categories = self.newGroupSections[indexPath.row]
      //  let category = categories?.service_code
      //  if !category.isExpensesEmpty {
      //  print("category::",category as Any)

        DispatchQueue.main.async {
            self.router.show(view: .facturaDetail, sender: self)
        }
        
      
      //  self.delegate?.onClickCategory(categoryId: category!)
        
           
        
       // }
    }
    
}
