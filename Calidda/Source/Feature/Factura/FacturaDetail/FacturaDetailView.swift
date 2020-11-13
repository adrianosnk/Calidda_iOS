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

protocol FacturaDetailViewDelegate: class {
    func onClickCategory(categoryId: String)
}

class FacturaDetailView: UIViewController {

    
   // var style: Style = Style.myApp
    var router:Router!
    let disposeBag = DisposeBag()
    private let presenter = FacturaDetailPresenter(facturaDetailService: FacturaDetailService())
     
    
    @IBOutlet var lblNameDoctor:UILabel!
    @IBOutlet var lblNameEspecialidate:UILabel!
    @IBOutlet var lblNameCMP:UILabel!
    @IBOutlet var imgIconPerfil:UIImageView!
    @IBOutlet var viwBackHome:UIView!
    @IBOutlet var viwBack:UIView!
    @IBOutlet var viwBackHeader:UIView!
    @IBOutlet var tableView:UITableView!
    weak var delegate: FacturaDetailViewDelegate?
    
    
    @IBOutlet var lblImporte:UILabel!
    @IBOutlet var lblFecha:UILabel!
    @IBOutlet var lblEstado:UILabel!
    @IBOutlet var viewEstado:UIView!
     
    fileprivate var doctorPropertiesModel: DoctorProperties?
    
    
        var IdRecibo:String = ""
        var Mes:Int = 0
        var Anio:Int = 0
        var ImporteTotal:Double = 0.0
        
        var FechaVencimiento:String = ""
        var Estado:String = ""
        var VolumenConsumoLectura:Double = 0.0
        var FactorCorreccionVolumen:Double = 0.0
        var VolumenFacturado:Double = 0.0
        var CategoriaTarifaria:String = ""
        
        var PrecioMedioGasNatural:Double = 0.0
        var CostoMedioTransporte:Double = 0.0
        var CostoFijoComercializacion:Double = 0.0
        var CostoFijoDistribucion:Double = 0.0
        var CostoVariableDistribucion:Double = 0.0
        var TotalConceptoGasNatural:Double = 0.0
        var TotalServicioTransporte:Double = 0.0
        var TotalCostoFijoDistribucion:Double = 0.0
        var TotalCostoVariableDistribucion:Double = 0.0
        var TotalCostoFijoComercializacion:Double = 0.0
        
    
        var TotalIGV:Double = 0.0
        var IdReciboPDF:String = ""
    
    
        var Nombre:String = ""
        var Total:Double = 0.0

    
    
    

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
       // let userProperties = presenter.getMyUser().TokenAcceso!
        
        let userProperties =  UserDefaults.standard.string(forKey: "KeyToken")!
        presenter.getInfoDetailFactura(token: userProperties)
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
        let profileCellNib = UINib(nibName: FacturaDetailInfoViewCell.reuseIdentifier, bundle: nil)
        tableView.register(profileCellNib, forCellReuseIdentifier: FacturaDetailInfoViewCell.reuseIdentifier)
        
        //Celda Home Lista
        let profileListaFirstCellNib = UINib(nibName: FacturaListaFirstDetailInfoViewCell.reuseIdentifier, bundle: nil)
        tableView.register(profileListaFirstCellNib, forCellReuseIdentifier: FacturaListaFirstDetailInfoViewCell.reuseIdentifier)
        
        
        //Celda Home Lista
        let profileListaCellNib = UINib(nibName: FacturaListaDetailInfoViewCell.reuseIdentifier, bundle: nil)
        tableView.register(profileListaCellNib, forCellReuseIdentifier: FacturaListaDetailInfoViewCell.reuseIdentifier)
    }
   // func fillInfoTop(_ info:DoctorProperties){

        func fillInfoTop(_ info:ResponseFacDetailData){
            
        DispatchQueue.main.async {
            //self.doctorPropertiesModel = info
            print(" infoooo >>::", info)
            print(" self.doctorPropertiesModel >>", self.doctorPropertiesModel as Any)
           
            let fileNamePerfil = info.IdRecibo!
            print(" fileNameTTPerfil >>::", fileNamePerfil)
            let fileArrayName = fileNamePerfil.components(separatedBy: " ")
            let firstFileNamePerfil = fileArrayName.first
            
          //  self.lblImporte.text = "S/ \(info.ImporteTotal ?? 0.0)"
            self.lblImporte.text = info.ImporteTotal.convertToString(withSymbol: true)
            
            
            
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            let date = dateFormatter.date(from: info.FechaVencimiento)
            // change to a readable time format and change to local time zone
            dateFormatter.dateFormat = "dd / MM"
            dateFormatter.timeZone = NSTimeZone.local
            let timeStamp = dateFormatter.string(from: date!)
            
            
            self.lblFecha.text = timeStamp
            self.lblEstado.text = info.Estado
            self.viewEstado.layer.cornerRadius = 5
            self.viewEstado.backgroundColor = CaliddaColors.purple
            
            
            self.IdRecibo = info.IdRecibo!
            self.Mes = info.Mes
            self.Anio = info.Anio
            self.ImporteTotal = info.ImporteTotal
            self.FechaVencimiento = info.FechaVencimiento
            self.Estado = info.Estado
            self.VolumenConsumoLectura = info.VolumenConsumoLectura
            self.FactorCorreccionVolumen = info.FactorCorreccionVolumen
            self.VolumenFacturado = info.VolumenFacturado
            self.CategoriaTarifaria = info.CategoriaTarifaria
            self.PrecioMedioGasNatural = info.PrecioMedioGasNatural
            self.CostoMedioTransporte = info.CostoMedioTransporte
            self.CostoFijoComercializacion = info.CostoFijoComercializacion
            self.CostoFijoDistribucion = info.CostoFijoDistribucion
            self.CostoVariableDistribucion = info.CostoVariableDistribucion
            self.TotalConceptoGasNatural = info.TotalConceptoGasNatural
            self.TotalServicioTransporte = info.TotalServicioTransporte
            self.TotalCostoFijoDistribucion = info.TotalCostoFijoDistribucion
            self.TotalCostoVariableDistribucion = info.TotalCostoVariableDistribucion
            self.TotalCostoFijoComercializacion = info.TotalCostoFijoComercializacion
                   
               
            self.TotalIGV = info.TotalIGV
            self.IdReciboPDF = info.IdReciboPDF
               
            self.Nombre = info.OtrosConceptos[0].Nombre
            self.Total = info.OtrosConceptos[0].Total

            
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
     
}
   



// MARK: - Table view datasource
extension FacturaDetailView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("num:::",self.doctorPropertiesModel?.services.count as Any)
        return 1
        /*
        switch section {
                    case 0:
                    return self.doctorPropertiesModel?.services.count ?? 0
                    case 1:
                        return 1
                   default:
                        return 1
               }*/
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
                    return sectionOneCell(tableView, cellForRowAt: indexPath)
          
    }
    // MARK: UITableViewDelegate
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
       
              return 1022.0
        
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
    /*  func sectionOneCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "FacturaDetailInfoViewCell", for: indexPath) as? FacturaDetailInfoViewCell, let categoryValue = self.doctorPropertiesModel?.services[indexPath.row] else {
                         return UITableViewCell()
                     }
            tableViewCell.selectionStyle = .none
            tableViewCell.loadWith(services: categoryValue)
            return tableViewCell
      }*/
    
    
    // MARK: Cell
         func sectionOneCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = tableView.dequeueReusableCell(withIdentifier: FacturaDetailInfoViewCell.reuseIdentifier, for: indexPath)
             if let cell = cell as? FacturaDetailInfoViewCell {
               cell.selectionStyle = .none
                 //cell.loadWithData(info: presenter.getDoctorInfo())
                
              //  cell.idReciboLabel.text = self.IdRecibo
             //   cell.mesLabel.text = "\(self.Mes)"
             //   cell.anioLabel.text = "\(self.Anio)"
             //   cell.importeTotalLabel.text = "\(self.ImporteTotal)"
             //   cell.fechaVencimientoLabel.text = "\(self.FechaVencimiento)"
             //   cell.estadoLabel.text = "\(self.Estado)"
                cell.volumenConsumoLecturaLabel.text = "\(self.VolumenConsumoLectura)"
                cell.factorCorreccionVolumenLabel.text = "\(self.FactorCorreccionVolumen)"
                cell.volumenFacturadoLabel.text = "\(self.VolumenFacturado)"
                
                //cell.categoriaTarifariaLabel.text = "\(self.CategoriaTarifaria)"
                
                cell.precioMedioGasNaturalLabel.text = "\(self.PrecioMedioGasNatural)"
                cell.costoMedioTransporteLabel.text = "\(self.CostoMedioTransporte)"
                cell.costoFijoComercializacionLabel.text = "\(self.CostoFijoComercializacion)"
                
               // cell.costoFijoDistribucionLabel.text = "\(self.CostoFijoDistribucion)"
                cell.costoVariableDistribucionLabel.text = "\(self.CostoVariableDistribucion)"
                cell.totalConceptoGasNaturalLabel.text = "\(self.TotalConceptoGasNatural)"
                
                cell.totalServicioTransporteLabel.text = "\(self.TotalServicioTransporte)"
                //cell.totalCostoFijoDistribucionLabel.text = "\(self.TotalCostoFijoDistribucion)"
                cell.totalCostoVariableDistribucionLabel.text = "\(self.TotalCostoVariableDistribucion)"
                //cell.totalCostoFijoComercializacionLabel.text = "\(self.TotalCostoFijoComercializacion)"
                
                
                
                cell.otrosConceptosNombreLabel.text = "\(self.Nombre)"
                cell.otrosConceptosTotalLabel.text = "\(self.Total)"
                
                cell.totalIGVLabel.text = "\(self.TotalIGV)"
               // cell.idReciboPDFLabel.text = "\(self.IdReciboPDF)"
                   
                            
                        
                        

                
                
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
           
           guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "FacturaListaFirstDetailInfoViewCell", for: indexPath) as? FacturaListaFirstDetailInfoViewCell, let categoryValue = self.doctorPropertiesModel?.services[indexPath.row] else {
                      return UITableViewCell()
                  }
                  tableViewCell.selectionStyle = .none
                  tableViewCell.loadWith(services: categoryValue)
                  
           return tableViewCell
           
           
         }
}

// MARK: - Table view delegate
extension FacturaDetailView: UITableViewDelegate {
    
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
         //   self.router.show(view: .detailNovedades, sender: self)
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
