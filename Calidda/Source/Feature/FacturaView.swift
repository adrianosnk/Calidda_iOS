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
    private let presenter = FacturaPresenter(homeService: HomeService())
     
    @IBOutlet var lblNameDoctor:UILabel!
    @IBOutlet var lblNameEspecialidate:UILabel!
    @IBOutlet var lblNameCMP:UILabel!
    @IBOutlet var imgIconPerfil:UIImageView!
    @IBOutlet var viwBackHome:UIView!
    @IBOutlet var viwBack:UIView!
    @IBOutlet var viwBackHeader:UIView!
    @IBOutlet var tableView:UITableView!
    weak var delegate: FacturaViewDelegate?
    
    fileprivate var doctorPropertiesModel: DoctorProperties?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //self.didTapButton()
        
        setupUI()
        loadData()
        
         tableView.reloadData()
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
        presenter.getInfoDoctor(token: userProperties)
            .subscribeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: {result in
                
                //self.fillInfoTop(result.data)
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
        let profileListaCellNib = UINib(nibName: FacturaListaViewCell.reuseIdentifier, bundle: nil)
        tableView.register(profileListaCellNib, forCellReuseIdentifier: FacturaListaViewCell.reuseIdentifier)
    }
    func fillInfoTop(_ info:DoctorProperties){
        
        DispatchQueue.main.async {
            self.doctorPropertiesModel = info
            print(" infoooo >>::", info)
            print(" self.doctorPropertiesModel >>", self.doctorPropertiesModel as Any)
           
            let fileNamePerfil = info.first_name!
            let fileArrayName = fileNamePerfil.components(separatedBy: " ")
            let firstFileNamePerfil = fileArrayName.first
            
        //    self.lblNameDoctor.text = "Hola Dr(a) \(String(firstFileNamePerfil!))"
            //self.lblNameEspecialidate.text = info.speciality!.uppercased()
         //   self.lblNameCMP.text = info.number_record!
            
            // First of all remove the old image (required for images in cells)
            
            let fileName = info.photo!
            let fileArray = fileName.components(separatedBy: "/")
            let finalFileName = fileArray.last
            print("finalFileName::",String(finalFileName!))
            
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("num:::",self.doctorPropertiesModel?.services.count as Any)
      
                 return self.doctorPropertiesModel?.services.count ?? 0
          
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         //let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "ServicesTableView", for: indexPath) as? ServicesTableView
        
       
                  return sectionOneCell(tableView, cellForRowAt: indexPath)
          
                  
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
        
         return 95.0
        
        /*switch indexPath.section {
        case 0:
            return 450.0
        default:
              return 112.0
        }*/
    }
     
    
    // MARK: Cell
      func sectionOneCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "FacturaListaViewCell", for: indexPath) as? FacturaListaViewCell, let categoryValue = self.doctorPropertiesModel?.services[indexPath.row] else {
                         return UITableViewCell()
                     }
            tableViewCell.selectionStyle = .none
            tableViewCell.loadWith(services: categoryValue)
                     
            return tableViewCell
        
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
         let categories = self.doctorPropertiesModel?.services[indexPath.row]
        let category = categories?.service_code
      //  if !category.isExpensesEmpty {
        print("category::",category as Any)

        DispatchQueue.main.async {
            self.router.show(view: .facturaDetail, sender: self)
        }
        
        if category == "001" {
            //Chat
        }
        
        if category == "002" {
            //Chat
            
            DispatchQueue.main.async {
              //  self.router.show(view: .detailNovedades, sender: self)
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
      //  self.delegate?.onClickCategory(categoryId: category!)
        
           
        
       // }
    }
    
}
