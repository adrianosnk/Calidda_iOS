//
//  RegisterView.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import Charts
import TinyConstraints

import UIKit
import RxSwift
import Alamofire

class CellClass:UITableViewCell{
    
}

class ConsumoView: UIViewController , ChartViewDelegate{
    //var style: Style = Style.myApp
    var router:Router!
    
    @IBOutlet var viwBackContent:UIView!
    @IBOutlet var viwBackUser:UIView!
    @IBOutlet var emailTexfield:UITextField!
    
    
    @IBOutlet var titleRefLabel:UILabel!
    @IBOutlet var titleFacLabel:UILabel!
    @IBOutlet var viewInfo:UIView!
     
    @IBOutlet var viwBackContentRef:UIView!
    @IBOutlet var viwBackContentHoraSubRef:UIView!
    @IBOutlet var viwBackContentDiaSubRef:UIView!
    @IBOutlet var viwBackContentMesSubRef:UIView!
    
    
    @IBOutlet var btnDownloadRef:UIButton!
    @IBOutlet var btnDownloadFac:UIButton!

    
    @IBOutlet var viewBackDayMontRef:UIView!
    @IBOutlet var viwBackChartRef:UIView!
    @IBOutlet var viewBackChartDiarioRef:UIView!
    @IBOutlet var viewBackChartMesRef:UIView!
    @IBOutlet var viewConsuFac_Ref:UIView!
    @IBOutlet var viewMaxDem_Ref:UIView!
    @IBOutlet var viewInfoRef:UIView!
    @IBOutlet var viewLinerRef:UIView!
    @IBOutlet var fechaRefLabel:UILabel!
    @IBOutlet var horaRefLabel:UILabel!
    @IBOutlet var demandaRefLabel:UILabel!
    @IBOutlet var presionRefLabel:UILabel!
    //Ref Diario
    @IBOutlet var viewDiarioContent:UIView!
    @IBOutlet var demanDiarioRefLabel:UILabel!
    @IBOutlet var presionDiarioRefLabel:UILabel!
    @IBOutlet var fechaDiarioRefLabel:UILabel!
    @IBOutlet var maxiDemanDiarioRefLabel:UILabel!
    @IBOutlet var horaPicoDiarioRefLabel:UILabel!
    //Ref Mensual
    @IBOutlet var viewMesContent:UIView!
    @IBOutlet var demanMesRefLabel:UILabel!
    @IBOutlet var presionMesRefLabel:UILabel!
    @IBOutlet var fechaMesRefLabel:UILabel!
    @IBOutlet var maxiDemanMesRefLabel:UILabel!
    @IBOutlet var horaPicoMesRefLabel:UILabel!
    
    //Factura
    var buttonFecha:Bool!

    private let ITEM_COUNT = 12
    @IBOutlet var viewBackChartDiarioFac:UIView!
    @IBOutlet var viewBackChartMesFac:UIView!
    
    //Diario
    @IBOutlet var consumoAntFacDiarioLabel:UILabel!
    @IBOutlet var consumoFacDiarioLabel:UILabel!
    @IBOutlet var variacionFacDiarioLabel:UILabel!
    @IBOutlet var fechaFacDiarioLabel:UILabel!
    @IBOutlet var maximaFacDiarioLabel:UILabel!
    @IBOutlet var horaPicoFacDiarioLabel:UILabel!
     
    //Mensual
    @IBOutlet var consumoAntFacMesLabel:UILabel!
    @IBOutlet var consumoFacMesLabel:UILabel!
    @IBOutlet var variacionFacMesLabel:UILabel!
    @IBOutlet var fechaFacMesLabel:UILabel!
    @IBOutlet var maximaFacMesLabel:UILabel!
    @IBOutlet var horaPicoFacMesLabel:UILabel!
    
    @IBOutlet var viwBackContentFac:UIView!
    @IBOutlet var viwBackContentSubDiarioFac:UIView!
    @IBOutlet var viwBackContentSubMesFac:UIView!
    
    @IBOutlet var viewBackDayMontFac:UIView!
    @IBOutlet var viwBackChart:UIView!
    @IBOutlet var viewConsuFac_Fac:UIView!
    @IBOutlet var viewMaxDem_Fac:UIView!
    @IBOutlet var viewInfoFac:UIView!
    @IBOutlet var viewInfoMesFac:UIView!
    @IBOutlet var viewLinerFac:UIView!
    
    
    
    @IBOutlet var btnDownloadExcelFac:UIButton!
    @IBOutlet var btnDownloadExcelRef:UIButton!
    
    
    let menuFooter = MenuFooter()
    let disposebag = DisposeBag()
    
    var barChart = BarChartView()
    
    var days:[String]!
    var barChartRef = BarChartView()
    
    
    @IBOutlet var titleHorarioLabel:UILabel!
    @IBOutlet var titleDiarioLabel:UILabel!
    @IBOutlet var titleMensualRefLabel:UILabel!

    @IBOutlet var titleFacDiarioLabel:UILabel!
    @IBOutlet var titleFacMensualLabel:UILabel!
    
    //Componente fecha combo
    @IBOutlet weak var btnSelectFruit:UIButton!
    var selectButton = UIButton()
    let transparentView = UIView()
    let tablewView = UITableView()
    var dataSource = [String]()
    
    
    var boolHoraRef:Bool!
    var boolDiaRef:Bool!
    var boolMesRef:Bool!
    var boolDiaFac:Bool!
    var boolMesFac:Bool!

    var base64String:String = ""
    
    lazy var barChartRefView: BarChartView = {
        let chartView = BarChartView()
        chartView.backgroundColor = .white
        chartView.rightAxis.enabled = false
        chartView.scaleYEnabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .darkGray
        yAxis.axisLineColor = .darkGray
        yAxis.labelPosition = .outsideChart
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = .darkGray
        chartView.xAxis.axisLineColor = .systemBlue
        
        chartView.animate(xAxisDuration: 2.5)
        
        return chartView
    }()
    
       lazy var barChartDiarioRefView: BarChartView = {
           let chartView = BarChartView()
           chartView.backgroundColor = .white
           chartView.rightAxis.enabled = false
           chartView.scaleYEnabled = false
           
           let yAxis = chartView.leftAxis
           yAxis.labelFont = .boldSystemFont(ofSize: 12)
           yAxis.setLabelCount(6, force: false)
           yAxis.labelTextColor = .darkGray
           yAxis.axisLineColor = .darkGray
           yAxis.labelPosition = .outsideChart
           
    
           chartView.xAxis.labelPosition = .bottom
           chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
           chartView.xAxis.setLabelCount(6, force: false)
           chartView.xAxis.labelTextColor = .darkGray
           chartView.xAxis.axisLineColor = .systemBlue
           
           chartView.animate(xAxisDuration: 2.5)
           
           
           return chartView
       }()
    
       lazy var barChartMesRefView: BarChartView = {
           let chartView = BarChartView()
           chartView.backgroundColor = .white
           chartView.rightAxis.enabled = false
           
           let yAxis = chartView.leftAxis
           yAxis.labelFont = .boldSystemFont(ofSize: 12)
           yAxis.setLabelCount(6, force: false)
           yAxis.labelTextColor = .darkGray
           yAxis.axisLineColor = .darkGray
           yAxis.labelPosition = .outsideChart
           
    
           
           
           chartView.xAxis.labelPosition = .bottom
           chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
           chartView.xAxis.setLabelCount(6, force: false)
           chartView.xAxis.labelTextColor = .darkGray
           chartView.xAxis.axisLineColor = .systemBlue
           
           chartView.animate(xAxisDuration: 2.5)
           
           
           return chartView
       }()
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemBlue
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.axisLineColor = .systemBlue
        
        chartView.animate(xAxisDuration: 2.5)
        
        
        return chartView
    }()
    
    @IBOutlet var barChartFacDiarioView: CombinedChartView!
    @IBOutlet var barChartFacMesView: CombinedChartView!
    /*
    lazy var barChartFacDiarioView: CombinedChartView = {
                 let chartView = BarChartView()
                 chartView.backgroundColor = .white
                 chartView.rightAxis.enabled = false
                 
                 let yAxis = chartView.leftAxis
                 yAxis.labelFont = .boldSystemFont(ofSize: 12)
                 yAxis.setLabelCount(6, force: false)
                 yAxis.labelTextColor = .darkGray
                 yAxis.axisLineColor = .darkGray
                 yAxis.labelPosition = .outsideChart
                 
                 chartView.xAxis.labelPosition = .bottom
                 chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
                 chartView.xAxis.setLabelCount(6, force: false)
                 chartView.xAxis.labelTextColor = .darkGray
                 chartView.xAxis.axisLineColor = .systemBlue
                 chartView.animate(xAxisDuration: 2.5)
                 
               //  return chartView
        }()
    
    
    lazy var barChartFacMesView: BarChartView = {
              let chartView = BarChartView()
              chartView.backgroundColor = .white
              chartView.rightAxis.enabled = false
              
              let yAxis = chartView.leftAxis
              yAxis.labelFont = .boldSystemFont(ofSize: 12)
              yAxis.setLabelCount(6, force: false)
              yAxis.labelTextColor = .darkGray
              yAxis.axisLineColor = .darkGray
              yAxis.labelPosition = .outsideChart
              
       
              
              
              chartView.xAxis.labelPosition = .bottom
              chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
              chartView.xAxis.setLabelCount(6, force: false)
              chartView.xAxis.labelTextColor = .darkGray
              chartView.xAxis.axisLineColor = .systemBlue
              
              chartView.animate(xAxisDuration: 2.5)
              
              
              return chartView
          }()
     */
    var newGroupSections = [ResponseReferencialHorario]()
    var newGroupSectionsDiario = [ResponseReferencialDiario]()
    var newGroupSectionsMes = [ResponseReferencialMensual]()
    
    
    var newGroupSectionsFacDiario = [ResponseFacturadoDiario]()
    var newGroupSectionsFacMes = [ResponseFacturadoMes]()
    
    
    var apd = UIApplication.shared.delegate as! AppDelegate
     
    
    let disposeBag = DisposeBag()
    private let presenter = ConsumoPresenter(consumoService: ConsumoRefHoraService(),consumoRefDiarService:ConsumoRefDiarioService(), consumoRefMesService: ConsumoRefMesService(), consumoFacDiarioService: ConsumoFacDiarioService(), consumoFacMesService: ConsumoFacMesService(),
        reporteRefHoraService:ReporteRefHoraService(),
        reporteRefDiarioService:ReporteRefDiarioService(),
        reporteRefMesService:ReporteRefMesService(),
        reporteFacDiarioService:ReporteFacDiarioService(),
        reporteFacMesService:ReporteFacMesService())
    
    lazy var dateFormatter: DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.dateStyle = .long
      return dateFormatter
    }()
    
    var item: ChecklistItem?

      init(with item: ChecklistItem) {

        self.item = item
        super.init(nibName: nil, bundle: nil)
      }
    
    public required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         self.item = nil
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // apd.hhTabBarView.toggleShowOrHide()
        
        barChart.delegate = self
        barChartRef.delegate = self
        days = ["Lunes","Martes","Miercoles","Jueves","Viernes","Sábado","Domingo"]
        let tasks = [1.0,2.0,4.5,6.0,8.0,10.0,12.0]
        
        //setChart(days, values:tasks)
        
         barChartRefView.delegate = self
         barChartDiarioRefView.delegate = self
         barChartMesRefView.delegate = self
        
        barChartFacDiarioView.delegate = self
        barChartFacMesView.delegate = self
        
        //Componente fecha combo
        tablewView.delegate = self
        tablewView.dataSource = self
        tablewView.register(CellClass.self, forCellReuseIdentifier: "Cell")
        
        btnSelectFruit.isHidden = false
        
        let today = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        //let dateString = dateFormatter.string(from: date as Date)
        let dateString = dateFormatter.string(from: yesterday as Date)
              
        btnSelectFruit.setTitle(dateString, for: .normal)
        
        setupUI()
        setupRef()
        //Refe Defaul
        //setChart(dataPoints:days, values:tasks)
        self.menuFooter.onClickConsumoView()
       // setupCharLiner()
       // setData()
        
        loadDataHorario()
        //chartValueSelected(ChartViewBase, entry: ChartDataEntry, dataSetIndex: 1, highlight: Highlight)
        
        //Flag FEcha
        self.buttonFecha = true

        self.btnDownloadRef.layer.cornerRadius = 8
        self.btnDownloadFac.layer.cornerRadius = 8
        
        //hide view
        self.viewInfoRef.isHidden = true
        self.viewDiarioContent.isHidden = true
        self.viewMesContent.isHidden = true
        
        
        
        self.boolHoraRef = true
        self.boolDiaRef = false
        self.boolMesRef = false
        self.boolDiaFac = false
        self.boolMesFac = false
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This will be helpful in locking the current tab if we're already in the first view-controller in navigation flow.
        HHTabBarView.shared.lockCurrentTab()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // This will be helpful to unlock the locked tab when we're going forward from the first view-controller in navigation flow.
        HHTabBarView.shared.unlockAllTabs()
    }
    
    func setupCharLiner() {
        
        /*lineChartView.frame = CGRect(x:0 , y:0, width: self.viwBackChartRef.frame.size.width,
                                             height: self.viwBackChartRef.frame.size.height)
        */
//viwBackChartRef
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to:view)
        lineChartView.heightToWidth(of: view)
        
    }
    

    // func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: Highlight) {
        
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("Imprime please please",entry)
        let fileName = "\(entry)"
        let fileArray = fileName.components(separatedBy: "y ")
        let finalFileName = fileArray.last
        print("finalFileName::",String(finalFileName!))
        
        let finalName = "\(String(finalFileName!))"
        
        for userItem in self.newGroupSections{
                print("HoraTT",userItem.Hora!)
                print("DemandaTT",userItem.Demanda!)
            let demanda = "\(userItem.Demanda!)"
            if (finalName == demanda){

                self.viewInfoRef.isHidden = false
                
                print("Entroooo::",userItem.CodigoEmr!)
                print("demandaA::",demanda)
                print("fechaConsumo!::",userItem.FechaConsumo!)
                let dateFormatter = DateFormatter()
                        //dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SS'Z'"
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                        let date = dateFormatter.date(from: userItem.FechaConsumo!)
                dateFormatter.dateFormat = "dd"
                        dateFormatter.timeZone = NSTimeZone.local
                        let timeStamp = dateFormatter.string(from: date!)
                let dateFormatter1 = DateFormatter()
                        dateFormatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                        let date1 = dateFormatter1.date(from: userItem.FechaConsumo!)
                dateFormatter1.dateFormat = "MMMM"
                        dateFormatter1.timeZone = NSTimeZone.local
                        let timeStamp1 = dateFormatter1.string(from: date1!)
                let timeStampFinal = "\(timeStamp) de \(timeStamp1)"
                self.fechaRefLabel.text = timeStampFinal
                if userItem.Hora! < 10{
                    self.horaRefLabel.text = "0\(userItem.Hora!):00"
                }else{
                    self.horaRefLabel.text = "\(userItem.Hora!):00"
                }
                self.demandaRefLabel.text = demanda
                self.presionRefLabel.text = "\(userItem.Presion!)"
            }
        }
        for userItem in self.newGroupSectionsDiario{
                print("DemandaTTDiario",userItem.DemandaMax!)
            var resultSum:Double = 0.0
            var resultSumStr:String = ""
            resultSum = userItem.DemandaMax! + userItem.Demanda!
            resultSumStr = "\(resultSum)"
            let demanda = "\(userItem.DemandaMax!)"
           
           // if (finalName == resultSum){
            //PRUEBA DATE
            if finalName.contains(resultSumStr){

                
              self.viewDiarioContent.isHidden = false
                
              if userItem.FechaConsumo != nil{
                     
                print("FechaConsumo::>>",userItem.FechaConsumo)
                print("EntrooooDiario::",userItem.CodigoEmr!)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                let date = dateFormatter.date(from: userItem.FechaConsumo!)
                dateFormatter.dateFormat = "dd"
                dateFormatter.timeZone = NSTimeZone.local
                let timeStamp = dateFormatter.string(from: date!)
                let dateFormatter1 = DateFormatter()
                dateFormatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                let date1 = dateFormatter1.date(from: userItem.FechaConsumo!)
                dateFormatter1.dateFormat = "MMMM"
                        dateFormatter1.timeZone = NSTimeZone.local
                        let timeStamp1 = dateFormatter1.string(from: date1!)
                let timeStampFinal = "\(timeStamp) de \(timeStamp1)"
                self.fechaDiarioRefLabel.text = timeStampFinal
              }
                if userItem.HoraDemandaMax! < 10{
                    self.horaPicoDiarioRefLabel.text = "0\(userItem.HoraDemandaMax!):00"
                }else{
                    self.horaPicoDiarioRefLabel.text = "\(userItem.HoraDemandaMax!):00"
                }
                self.demanDiarioRefLabel.text = demanda
                self.presionDiarioRefLabel.text = "\(userItem.PresionPromedio!)"
                self.maxiDemanDiarioRefLabel.text = "\(userItem.DemandaMax!)"
                

                
            }
        }
        

        
        var nameMes:String = ""
        
        for userItem in self.newGroupSectionsMes{
                     
            
                       print("DemandaTTDiario",userItem.Demanda!)
                    var resultSum:Double = 0.0
                    var resultSumStr:String = ""
                    resultSum = userItem.DemandaMax! + userItem.Demanda!
                    resultSumStr = "\(resultSum)"
                    let demanda = "\(userItem.DemandaMax!)"
                          
                    // if (finalName == resultSum){
                    if finalName.contains(resultSumStr){
                    

                    self.viewMesContent.isHidden = false
                        
                          if userItem.Mes == 1 {
                               nameMes = "Enero"
                          }
                          if userItem.Mes == 2 {
                               nameMes = "Febrero"
                          }
                          if userItem.Mes == 3 {
                               nameMes = "Marzo"
                          }
                          if userItem.Mes == 4 {
                               nameMes = "Abril"
                          }
                          if userItem.Mes == 5 {
                               nameMes = "Mayo"
                          }
                          if userItem.Mes == 6 {
                               nameMes = "Junio"
                          }
                          if userItem.Mes == 7 {
                               nameMes = "Julio"
                          }
                          if userItem.Mes == 8 {
                               nameMes = "Agosto"
                          }
                          if userItem.Mes == 9 {
                               nameMes = "Setiembre"
                          }
                          if userItem.Mes == 10 {
                               nameMes = "Octubre"
                          }
                          if userItem.Mes == 11 {
                               nameMes = "Noviembre"
                          }
                          if userItem.Mes == 12 {
                               nameMes = "Diciembre"
                          }
                          print("nameMes::>",nameMes)
                          self.fechaMesRefLabel.text = nameMes
                                    
                       print("EntrooooDiario::",userItem.CodigoEmr!)
                  
                       if userItem.Mes! < 10{
                           self.horaPicoMesRefLabel.text = "\(userItem.DiaDemandaMax!)/0\(userItem.Mes!)"
                       }else{
                           self.horaPicoMesRefLabel.text = "\(userItem.DiaDemandaMax!)/\(userItem.Mes!)"
                       }
                       self.demanMesRefLabel.text = demanda
                       self.presionMesRefLabel.text = "\(userItem.Presion!) bar"
                       self.maxiDemanMesRefLabel.text = "\(userItem.DemandaMax!) m3/ día"
                       

                       
                   }
               }
        
        
        
        /*

         @IBOutlet var consumoFacDiarioLabel:UILabel!
         @IBOutlet var variacionFacDiarioLabel:UILabel!
         
           var DemandaMaxima:Double!
           var HoraDemandaMaxima:Int!
           var ConsumoFacturado:Double!
         
         
         struct ResponseFacturadoDiario: Codable {
             var CuentaContrato:String!
             var FechaConsumo:String!
             var DemandaMaxima:Double!
             var HoraDemandaMaxima:Int!
             var ConsumoFacturado:Double!
             var ConsumoAnioAnterior:[ConsumoAnioAnteriors]!
         }
         struct ConsumoAnioAnteriors:Codable {
             var FechaConsumo:String!
             var ConsumoFacturado:Double!
         }
         */
               
        for userItem in self.newGroupSectionsFacDiario{
            var resultSum:Double = 0.0
            var resultSumStr:String = ""
            resultSum = userItem.DemandaMaxima! + userItem.ConsumoFacturado!
            resultSumStr = "\(resultSum)"
            let demanda = "\(userItem.DemandaMaxima!)"
            
          
                       
           // if (finalName == resultSum){
            if finalName.contains(resultSumStr){
                let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                        let date = dateFormatter.date(from: userItem.FechaConsumo!)
                dateFormatter.dateFormat = "dd"
                        dateFormatter.timeZone = NSTimeZone.local
                        let timeStamp = dateFormatter.string(from: date!)
                let dateFormatter1 = DateFormatter()
                        dateFormatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                        let date1 = dateFormatter1.date(from: userItem.FechaConsumo!)
                dateFormatter1.dateFormat = "MMMM"
                        dateFormatter1.timeZone = NSTimeZone.local
                        let timeStamp1 = dateFormatter1.string(from: date1!)
                let timeStampFinal = "\(timeStamp) de \(timeStamp1)"
                self.fechaFacDiarioLabel.text = timeStampFinal
                if userItem.HoraDemandaMaxima! < 10{
                    self.horaPicoFacDiarioLabel.text = "0\(userItem.HoraDemandaMaxima!):00"
                }else{
                    self.horaPicoFacDiarioLabel.text = "\(userItem.HoraDemandaMaxima!):00"
                }
                
                var resultPorcen:Double = 0.0
                 resultPorcen = ((userItem.DemandaMaxima/userItem.ConsumoFacturado) - 1)*100
                
                  let aString = "\(String(format: "%.f", resultPorcen))"
                var resultPorcentage:String = ""
                resultPorcentage = aString.replacingOccurrences(of: "-", with: "")
                
                self.variacionFacDiarioLabel.text = "\(resultPorcentage)%"
                
                self.maximaFacDiarioLabel.text = demanda
                 self.consumoAntFacDiarioLabel.text = "\(userItem.ConsumoAnioAnterior[0].ConsumoFacturado!) sm3 / día"
                 self.consumoFacDiarioLabel.text = "\(userItem.ConsumoFacturado!) sm3 / día"
                
               // self.presionDiarioRefLabel.text = "\(userItem.PresionPromedio!)"
               // self.maxiDemanDiarioRefLabel.text = "\(userItem.DemandaMax!)"
                

                
            }
        }
        
        
        /*
           @IBOutlet var consumoFacMesLabel:UILabel!
           @IBOutlet var variacionFacMesDiarioLabel:UILabel!
           @IBOutlet var fechaFacMesLabel:UILabel!
           @IBOutlet var maximaFacMesLabel:UILabel!
           @IBOutlet var horaPicoFacMesLabel:UILabel!
         */
        
        for userItem in self.newGroupSectionsFacMes{
                   var resultSum:Double = 0.0
                   var resultSumStr:String = ""
                   resultSum = userItem.DemandaMaxima! + userItem.ConsumoFacturado!
                   resultSumStr = "\(resultSum)"
                   let demanda = "\(userItem.DemandaMaxima!)"
                  
                  // if (finalName == resultSum){
                   if finalName.contains(resultSumStr){
                       
                        if userItem.Mes == 1 {
                                nameMes = "Enero"
                        }
                         if userItem.Mes == 2 {
                                nameMes = "Febrero"
                        }
                         if userItem.Mes == 3 {
                                 nameMes = "Marzo"
                         }
                         if userItem.Mes == 4 {
                                  nameMes = "Abril"
                         }
                         if userItem.Mes == 5 {
                                   nameMes = "Mayo"
                         }
                          if userItem.Mes == 6 {
                                   nameMes = "Junio"
                          }
                          if userItem.Mes == 7 {
                                   nameMes = "Julio"
                          }
                          if userItem.Mes == 8 {
                                    nameMes = "Agosto"
                           }
                           if userItem.Mes == 9 {
                                    nameMes = "Setiembre"
                           }
                           if userItem.Mes == 10 {
                                     nameMes = "Octubre"
                           }
                           if userItem.Mes == 11 {
                                     nameMes = "Noviembre"
                            }
                            if userItem.Mes == 12 {
                                     nameMes = "Diciembre"
                            }
                           print("nameMes::>",nameMes)
                    self.fechaFacMesLabel.text = "\(userItem.Mes ?? 0)  \(nameMes)"
                    
                     
                       if userItem.DiaDemandaMaxima! < 10{
                           self.horaPicoFacMesLabel.text = "0\(userItem.DiaDemandaMaxima!)/\(userItem.Mes!)"
                       }else{
                           self.horaPicoFacMesLabel.text = "\(userItem.DiaDemandaMaxima!)/\(userItem.Mes!)"
                       }
                       //self.consumoAntFacMesLabel.text = demanda
                    self.consumoFacMesLabel.text = "\(userItem.ConsumoFacturado ?? 0.0) sm3 / día"
                        self.consumoAntFacMesLabel.text = "\(userItem.ConsumoAnioAnterior[0].ConsumoFacturado!) sm3 / día"
                        self.consumoFacDiarioLabel.text = "\(userItem.ConsumoFacturado!) sm3 / día"
                    self.maximaFacMesLabel.text = "\(userItem.DiaDemandaMaxima!) sm3 / hora"
                      // self.presionDiarioRefLabel.text = "\(userItem.PresionPromedio!)"
                      // self.maxiDemanDiarioRefLabel.text = "\(userItem.DemandaMax!)"
                       

                       
                   }
               }
        /*
        let strSelectedMonth : String = self.newGroupSections[entry.xIndex]
           if strSelectedMonth == "April"
           {
               print(strSelectedMonth)
           }*/
        
    }
    func setData(){
        let set1 = LineChartDataSet(entries: yValues, label: "Subcribers")
        
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 3
        set1.setColor(.white)
        set1.fill = Fill(color: .white)
        set1.fillAlpha = 0.8
        set1.drawFilledEnabled = true
        
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.highlightColor = .systemRed
        
        let data = LineChartData(dataSet: set1)
        lineChartView.data = data
    }
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x:0.0,y:12.0),
        ChartDataEntry(x:1.0,y:5.0),
        ChartDataEntry(x:2.0,y:7.0),
        ChartDataEntry(x:3.0,y:5.0),
        ChartDataEntry(x:4.0,y:10.0),
        ChartDataEntry(x:5.0,y:6.0),
        ChartDataEntry(x:6.0,y:5.0),
        ChartDataEntry(x:7.0,y:7.0),
        ChartDataEntry(x:8.0,y:8.0),
        ChartDataEntry(x:1.0,y:1.0)
    ]
    
    func loadDataHorario(){
           //let userProperties = presenter.getMyUser().TokenAcceso!
             
           let userProperties =  UserDefaults.standard.string(forKey: "KeyToken")!
          // let userEmp =  UserDefaults.standard.string(forKey: "KeyCodEmr")!
        //Adri
           let userEmp =  "123"
          

        let fechaActual = Date()
        
        
        
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateString = dateFormatter.string(from: date as Date)
        
        
        //let hora =  "2020-11-30T15:09:21.88Z"
        let hora =  dateString
        presenter.getConsumoRefHora(token: userProperties,userEmp: userEmp,hora:hora)
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
           
           
         //  registerCell()
       }

    func loadDataDiario(){
              //let userProperties = presenter.getMyUser().TokenAcceso!
              
              let userProperties =  UserDefaults.standard.string(forKey: "KeyToken")!
              let codEmp =  UserDefaults.standard.string(forKey: "KeyCodEmr")!
            
              var mes:Int = 0
              var anio:Int = 0
              mes =  11
              anio =  2020
              presenter.getConsumoRefDiario(token: userProperties,codEmp: codEmp,mes:mes,anio:anio)
                  .subscribeOn(MainScheduler.asyncInstance)
                  .subscribe(onNext: {result in
                      
                      //self.fillInfoTop(result.data)
                      self.fillInfoDiarioTop(result)
                  },
                             onError: {error in
                              
                  },
                             onCompleted: {},
                             onDisposed: {})
                  .disposed(by: self.disposeBag)
              
              
            //  registerCell()
          }
    
    func loadDataMes(){
        //let userProperties = presenter.getMyUser().TokenAcceso!
        let userProperties =  UserDefaults.standard.string(forKey: "KeyToken")!
        let codEmp =  UserDefaults.standard.string(forKey: "KeyCodEmr")!
        presenter.getConsumoRefMes(token: userProperties,codEmp:codEmp)
                  .subscribeOn(MainScheduler.asyncInstance)
                  .subscribe(onNext: {result in
                      //self.fillInfoTop(result.data)
                      self.fillInfoMesTop(result)
                  },
                             onError: {error in
                  },
                             onCompleted: {},
                             onDisposed: {})
                  .disposed(by: self.disposeBag)
            //  registerCell()
    }
    func loadDataFacturaDiario(){
              //let userProperties = presenter.getMyUser().TokenAcceso!
               var mes:Int = 0
               var anio:Int = 0
               mes =  11
               anio =  2020
              let userProperties =  UserDefaults.standard.string(forKey: "KeyToken")!
              let codEmp =  UserDefaults.standard.string(forKey: "KeyCuentaContrato")!
        presenter.getConsumoFacDiario(token: userProperties,codEmp:codEmp,mes:mes,anio:anio)
                  .subscribeOn(MainScheduler.asyncInstance)
                  .subscribe(onNext: {result in
                      
                      //self.fillInfoTop(result.data)
                      self.fillInfoFacDiarioTop(result)
                  },
                             onError: {error in
                              
                  },
                             onCompleted: {},
                             onDisposed: {})
                  .disposed(by: self.disposeBag)
              
              
            //  registerCell()
    }
    func loadDataFacturaMes(){
              //let userProperties = presenter.getMyUser().TokenAcceso!
              
              let userProperties =  UserDefaults.standard.string(forKey: "KeyToken")!
              let cuentaContrato =  UserDefaults.standard.string(forKey: "KeyCuentaContrato")!
        
              presenter.getConsumoFacMes(token: userProperties,cuentaContrato: cuentaContrato)
                  .subscribeOn(MainScheduler.asyncInstance)
                  .subscribe(onNext: {result in
                      
                      //self.fillInfoTop(result.data)
                      self.fillInfoFacMesTop(result)
                  },
                             onError: {error in
                              
                  },
                             onCompleted: {},
                             onDisposed: {})
                  .disposed(by: self.disposeBag)
              
              
            //  registerCell()
    }
    func fillInfoTop(_ info:[ResponseReferencialHorario]){
        
           DispatchQueue.main.async {
               //self.reponseFacturaModel = info
               self.newGroupSections = info
            
            self.days = ["Lunes","Martes","Miercoles","Jueves","Viernes","Sábado","Domingo"]
             let tasks = [1.0,2.0,4.5,6.0,8.0,10.0,12.0]
                   

            self.setChart(dataPoints:self.days, values:tasks)
               print(" infooooConsumHora >>::", info)
           }
       }
    
    func fillInfoDiarioTop(_ info:[ResponseReferencialDiario]){
     
        DispatchQueue.main.async {
            //self.reponseFacturaModel = info
            self.newGroupSectionsDiario = info
         
       
            self.setChartDiaro()
            print(" infooooConsumDiario >>::", info)
        }
    }
    func fillInfoMesTop(_ info:[ResponseReferencialMensual]){
     
        DispatchQueue.main.async {
            //self.reponseFacturaModel = info
            self.newGroupSectionsMes = info
           
            self.setChartMes()
            print(" infooooConsumMes >>::", info)
        }
    }
    
    func fillInfoFacDiarioTop(_ info:[ResponseFacturadoDiario]){
     
        DispatchQueue.main.async {
            //self.reponseFacturaModel = info
            self.newGroupSectionsFacDiario = info
           
           // self.setChartFacDiario()
            self.setChartDataCombined()
            print(" infooooConsumMes >>::", info)
        }
    }
    
    func fillInfoFacMesTop(_ info:[ResponseFacturadoMes]){
     
        DispatchQueue.main.async {
            //self.reponseFacturaModel = info
            self.newGroupSectionsFacMes = info
            
           self.setChartDataMesFacCombined()
            //self.setChartFacMes()
            print(" infooooConsumMes >>::", info)
        }
    }
    func setChart(dataPoints:[String], values:[Double]){
        //barChartRef
        
        barChartRefView.frame = CGRect(x:0 , y:0, width: self.viwBackChartRef.frame.size.width,
                                        height: self.viwBackChartRef.frame.size.height)
               
        viwBackChartRef.addSubview(barChartRefView)
       // barChartRef.rightAxis.enabled = false
      
        barChartRefView.noDataText = "You need to provide data for the chart."
        
        var dataEntries:[BarChartDataEntry] = []
        var counter = 0.0
        
        for userItem in self.newGroupSections{
            print("HoraTT",userItem.Hora!)
            print("DemandaTT",userItem.Demanda!)
         //   let dataEntry = BarChartDataEntry(x: Double(userItem.Hora),y:userItem.Demanda)
            
            let dataEntry = BarChartDataEntry(x: counter,y:userItem.Demanda)
                       dataEntries.append(dataEntry)
            counter += 1
        }
        
        let hoursLabel =  [
                        "7", "8", "9", "10", "11", "12",
                        "13", "14", "15", "16", "17", "18",
                        "19", "20", "21", "22", "23", "0",
                        "1", "2", "3", "4", "5", "6"
                    ]

        //////////////////////////////////
        let xAxis: XAxis = barChartRefView.xAxis
        xAxis.valueFormatter = IndexAxisValueFormatter(values: hoursLabel)
         
        barChartRefView.rightAxis.enabled = false
        /*
        for i in 0..<dataPoints.count{
            counter += 1.0
            let dataEntry = BarChartDataEntry(x: values[i],y:counter)
            dataEntries.append(dataEntry)
        }*/
        
        let charDataSet = BarChartDataSet(entries:dataEntries,label: "Consumo facturado")
        charDataSet.colors =  [CaliddaColors.green]
        charDataSet.drawValuesEnabled = false
        
        let charData = BarChartData()
        charData.addDataSet(charDataSet)
        
        //barChartRef.data = charData
        barChartRefView.data = charData
   //     charDataSet.colors = ChartColorTemplates.colorful()
    //    BarChartView.animate(xAxisDuration:2.0, yAxisDuration:2.0)
        

    }
    func setChartDiaro(){
         //barChartRef
         barChartDiarioRefView.frame = CGRect(x:0 , y:0, width: self.viewBackChartDiarioRef.frame.size.width,
                                         height: self.viewBackChartDiarioRef.frame.size.height)
                
         viewBackChartDiarioRef.addSubview(barChartDiarioRefView)
        // barChartRef.rightAxis.enabled = false
       
         barChartDiarioRefView.noDataText = "You need to provide data for the chart."
         
         var dataEntries:[BarChartDataEntry] = []
         var counter = 0.0
         
        
        //let dataEntry1 = BarChartDataEntry(x: Double(i), yValues:  [yValues1[i], yValues2[i]], label: "Points")
        
         for userItem in self.newGroupSectionsDiario{
            
            print("HoraTT [yValues1[i], yValues2[i]]",counter)
             print("DemandaTT",userItem.Demanda!)
            let dataEntry = BarChartDataEntry(x: counter,yValues:[userItem.Demanda!,userItem.DemandaMax!], data: "Points")
                        dataEntries.append(dataEntry)
            counter += 1
         }
         /*
         let hoursLabel =  [
                         "07", "08", "09", "10", "11", "12",
                         "13", "14", "15", "16", "17", "18",
                         "19", "20", "21", "22", "23", "00",
                         "01", "02", "03", "04", "05", "06"
                     ]
         let xAxis: XAxis = barChartRefView.xAxis
         xAxis.labelPosition = Charts.XAxis.LabelPosition.bothSided
         xAxis.valueFormatter = IndexAxisValueFormatter(values: hoursLabel)
         */
       
         
        
     
         let charDataSet = BarChartDataSet(entries:dataEntries,label: "")
        
         charDataSet.stackLabels = ["Consumo facturado", "Consumo facturado anterior"]
         charDataSet.drawValuesEnabled = false
         let charData = BarChartData()
        charDataSet.colors =  [CaliddaColors.green, UIColor.lightGray]
             
         charData.addDataSet(charDataSet)
         barChartDiarioRefView.data = charData
        
    //     charDataSet.colors = ChartColorTemplates.colorful()
     //    BarChartView.animate(xAxisDuration:2.0, yAxisDuration:2.0)
         

     }
    func setChartMes(){
         //barChartRef
         barChartMesRefView.frame = CGRect(x:0 , y:0, width: self.viewBackChartMesRef.frame.size.width,
                                         height: self.viewBackChartMesRef.frame.size.height)
                
         viewBackChartMesRef.addSubview(barChartMesRefView)
        // barChartRef.rightAxis.enabled = false
       
         barChartMesRefView.noDataText = "You need to provide data for the chart."
         
         var dataEntries:[BarChartDataEntry] = []
         var counter = 0.0
         
        var mounthArray:[String] =  []
         
         for userItem in self.newGroupSectionsMes{
            
             print("counterTTMes",counter)
             print("DemandaTT",userItem.Demanda!)
               let dataEntry = BarChartDataEntry(x: counter,yValues:[userItem.Demanda,userItem.DemandaMax], data: "Points")
            dataEntries.append(dataEntry)
            counter += 1
            
            if userItem.Mes! == 1{
                mounthArray.append("Ene")
            }
            if userItem.Mes! == 2{
                mounthArray.append("Feb")
            }
            if userItem.Mes! == 3{
                mounthArray.append("Mar")
            }
            if userItem.Mes! == 4{
                mounthArray.append("Abr")
            }
            if userItem.Mes! == 5{
                mounthArray.append("May")
            }
            if userItem.Mes! == 6{
                mounthArray.append("Jun")
            }
            if userItem.Mes! == 7{
                mounthArray.append("Jul")
            }
            if userItem.Mes! == 8{
                mounthArray.append("Ago")
            }
            if userItem.Mes! == 9{
                mounthArray.append("Set")
            }
            if userItem.Mes! == 10{
                mounthArray.append("Oct")
            }
            if userItem.Mes! == 11{
                mounthArray.append("Nov")
            }
            if userItem.Mes! == 12{
                mounthArray.append("Dic")
            }
         }
         
        print("mounthArray::>>",mounthArray)
         //let hoursLabel =  [
         //                "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio"
         //            ]

         //////////////////////////////////
         //var hoursLabel = Constants.hoursLabel
       //  let xAxis: XAxis = barChartMesRefView.xAxis
       
        // xAxis.valueFormatter = IndexAxisValueFormatter(values: mounthArray)
    
        
        
        let customFormater = CustomFormatter()
        customFormater.labels = mounthArray

        barChartMesRefView.xAxis.valueFormatter = customFormater
        
        
        
        
         barChartMesRefView.rightAxis.enabled = false
        
         
         let charDataSet = BarChartDataSet(entries:dataEntries,label: "")

         charDataSet.stackLabels = ["Consumo facturado", "Consumo facturado anterior"]
         charDataSet.drawValuesEnabled = false
         charDataSet.colors =  [CaliddaColors.green, UIColor.lightGray]
         let charData = BarChartData()
         charData.addDataSet(charDataSet)
         
         //barChartRef.data = charData
         barChartMesRefView.data = charData
    //     charDataSet.colors = ChartColorTemplates.colorful()
     //    BarChartView.animate(xAxisDuration:2.0, yAxisDuration:2.0)
         

     }
    
    final class CustomFormatter: IAxisValueFormatter {

        var labels: [String] = []

        func stringForValue(_ value: Double, axis: AxisBase?) -> String {

            let count = self.labels.count

            guard let axis = axis, count > 0 else {
                return ""
            }

            let factor = axis.axisMaximum / Double(count)

            let index = Int((value / factor).rounded())

            if index >= 0 && index < count {
                return self.labels[index]
            }

            return ""
        }
    }
    
    func setChartDataCombined() {
        let data = CombinedChartData()
        data.lineData = generateLineData()
        data.barData = generateBarData()
        
        
        //barChartFacDiarioView.xAxis.axisMaximum = data.xMax + 0.25
        
        barChartFacDiarioView.data = data
        barChartFacDiarioView.scaleYEnabled = false
        barChartFacDiarioView.rightAxis.enabled = false
     
    }
    func setChartDataMesFacCombined() {
           let data = CombinedChartData()
           data.lineData = generateLineMesFacData()
           data.barData = generateBarMesFacData()
           
           
           barChartFacMesView.data = data
           barChartFacMesView.scaleYEnabled = false
           barChartFacMesView.rightAxis.enabled = false
         
       }
    
    func generateLineData() -> LineChartData {
         
        
        
        var dataEntries:[BarChartDataEntry] = []
                          var counter = 0.0
            for userItem in self.newGroupSectionsFacDiario{
               
                print("counterTTMes",counter)
                print("DemandaTT",userItem.DemandaMaxima!)
                if userItem.ConsumoAnioAnterior.count > 0{
                    let dataEntry = BarChartDataEntry(x: counter,yValues:[Double(userItem.ConsumoAnioAnterior[0].ConsumoFacturado!)])
                    dataEntries.append(dataEntry)
                    counter += 1
                }
            }
        
           //017108484
           //let set = LineChartDataSet(entries: entries, label: "")
           let set = LineChartDataSet(entries: dataEntries, label: "")
         //  set.setColor(UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1))
           set.setColor(CaliddaColors.blue)
           set.lineWidth = 2.5
           //set.setCircleColor(UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1))
        set.setCircleColor(CaliddaColors.blue)
           set.circleRadius = 5
           set.circleHoleRadius = 2.5
           //set.fillColor = UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1)
           set.fillColor = CaliddaColors.blue
           set.mode = .cubicBezier
           set.drawValuesEnabled = false
           set.valueFont = .systemFont(ofSize: 10)
          // set.valueTextColor = UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1)
           set.valueTextColor =  CaliddaColors.blue
           set.axisDependency = .left
           
           return LineChartData(dataSet: set)
       }
       
       func generateBarData() -> BarChartData {
          
        /*
        let entries1 = (0..<ITEM_COUNT).map { _ -> BarChartDataEntry in
               return BarChartDataEntry(x: 0, y: Double(arc4random_uniform(25) + 25))
           }
           let entries2 = (0..<ITEM_COUNT).map { _ -> BarChartDataEntry in
               return BarChartDataEntry(x: 0, yValues: [Double(arc4random_uniform(13) + 12), Double(arc4random_uniform(13) + 12)])
           }
           
           let set1 = BarChartDataSet(entries: entries1, label: "Bar 1")
           set1.setColor(UIColor(red: 60/255, green: 220/255, blue: 78/255, alpha: 1))
           set1.valueTextColor = UIColor(red: 60/255, green: 220/255, blue: 78/255, alpha: 1)
           set1.valueFont = .systemFont(ofSize: 10)
           set1.axisDependency = .left
           
           let set2 = BarChartDataSet(entries: entries2, label: "")
           set2.stackLabels = ["Stack 1", "Stack 2"]
           set2.colors = [UIColor(red: 61/255, green: 165/255, blue: 255/255, alpha: 1),
                          UIColor(red: 23/255, green: 197/255, blue: 255/255, alpha: 1)
           ]
           set2.valueTextColor = UIColor(red: 61/255, green: 165/255, blue: 255/255, alpha: 1)
           set2.valueFont = .systemFont(ofSize: 10)
           set2.axisDependency = .left
           
           let groupSpace = 0.06
           let barSpace = 0.02 // x2 dataset
           let barWidth = 0.45 // x2 dataset
           // (0.45 + 0.02) * 2 + 0.06 = 1.00 -> interval per "group"
        
           //let data: BarChartData = [set1, set2]
           //let data: BarChartData = [set1]
           let data = BarChartData()
           data.barWidth = barWidth
           // make this BarData object grouped
           data.groupBars(fromX: 0, groupSpace: groupSpace, barSpace: barSpace)
           return data
         */
       
         /*
         barChartFacDiarioView.frame = CGRect(x:0 , y:0, width: self.viewBackChartDiarioFac.frame.size.width,
                                                    height: self.viewBackChartDiarioFac.frame.size.height)
                           
          self.viewBackChartDiarioFac.addSubview(barChartFacDiarioView)
          // barChartRef.rightAxis.enabled = false
          barChartFacDiarioView.noDataText = "You need to provide data for the chart."
           */
                    var dataEntries:[BarChartDataEntry] = []
                    var counter = 0.0

                    for userItem in self.newGroupSectionsFacDiario{
                        print("counterTTMes",counter)
                        print("DemandaTT",userItem.DemandaMaxima!)
                          let dataEntry = BarChartDataEntry(x: counter,yValues:[userItem.ConsumoFacturado,userItem.DemandaMaxima], data: "Points")
                       dataEntries.append(dataEntry)
                       counter += 1
                    }
        

                 barChartFacDiarioView.xAxis.labelPosition = .bottom
                    
                    let hoursLabel =  [
                                    "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio"
                                ]

                    //////////////////////////////////
                   // let xAxis: XAxis = barChartFacDiarioView.xAxis
                   // xAxis.labelPosition = Charts.XAxis.LabelPosition.bothSided
                   // xAxis.valueFormatter = IndexAxisValueFormatter(values: hoursLabel)
               
                   
                    
                    let charDataSet = BarChartDataSet(entries:dataEntries,label: "")
                    charDataSet.drawValuesEnabled = false
                    charDataSet.colors =  [CaliddaColors.green, UIColor.lightGray]
                    let charData = BarChartData()
                    charData.addDataSet(charDataSet)
                    
                    //barChartFacDiarioView.data = charData

               return charData
       }
    
    func generateLineMesFacData() -> LineChartData {
      
     
     
     var dataEntries:[BarChartDataEntry] = []
         var counter = 0.0
 
         for userItem in self.newGroupSectionsFacMes{
             print("counterTTMes",counter)
             print("DemandaTT",userItem.DemandaMaxima!)
            
            if userItem.ConsumoAnioAnterior.count > 0{
                 print("consumoFact",[Double(userItem.ConsumoAnioAnterior[0].ConsumoFacturado!)])
                 let dataEntry = BarChartDataEntry(x: counter,yValues:[Double(userItem.ConsumoAnioAnterior[0].ConsumoFacturado!)])
                 dataEntries.append(dataEntry)
                 counter += 1
             }
         }
     
        //017108484
        let set = LineChartDataSet(entries: dataEntries, label: "")
        set.setColor(CaliddaColors.blue)
        set.lineWidth = 2.5
        set.setCircleColor(CaliddaColors.blue)
        set.circleRadius = 5
        set.circleHoleRadius = 2.5
        set.fillColor = CaliddaColors.blue
        set.mode = .cubicBezier
        set.drawValuesEnabled = false
        set.valueFont = .systemFont(ofSize: 10)
        set.valueTextColor =  CaliddaColors.blue
        //set.axisDependency = .left
        
        return LineChartData(dataSet: set)
    }
    
    func generateBarMesFacData() -> BarChartData {
       
     
                 var dataEntries:[BarChartDataEntry] = []
                 var counter = 0.0
                 var mounthArray:[String] =  []
        
                 for userItem in self.newGroupSectionsFacMes{
                     print("counterTTMes",counter)
                     print("DemandaTT",userItem.DemandaMaxima!)
                       let dataEntry = BarChartDataEntry(x: counter,yValues:[userItem.ConsumoFacturado,userItem.DemandaMaxima], data: "Points")
                    dataEntries.append(dataEntry)
                    counter += 1
                    
                    if userItem.Mes! == 1{
                                   mounthArray.append("Ene")
                               }
                               if userItem.Mes! == 2{
                                   mounthArray.append("Feb")
                               }
                               if userItem.Mes! == 3{
                                   mounthArray.append("Mar")
                               }
                               if userItem.Mes! == 4{
                                   mounthArray.append("Abr")
                               }
                               if userItem.Mes! == 5{
                                   mounthArray.append("May")
                               }
                               if userItem.Mes! == 6{
                                   mounthArray.append("Jun")
                               }
                               if userItem.Mes! == 7{
                                   mounthArray.append("Jul")
                               }
                               if userItem.Mes! == 8{
                                   mounthArray.append("Ago")
                               }
                               if userItem.Mes! == 9{
                                   mounthArray.append("Set")
                               }
                               if userItem.Mes! == 10{
                                   mounthArray.append("Oct")
                               }
                               if userItem.Mes! == 11{
                                   mounthArray.append("Nov")
                               }
                               if userItem.Mes! == 12{
                                   mounthArray.append("Dic")
                               }
                    
                 }
                 
               //  let hoursLabel =  [
              //                   "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio"
               //              ]

                 //////////////////////////////////
                 let xAxis: XAxis = barChartFacMesView.xAxis
                 xAxis.labelPosition = Charts.XAxis.LabelPosition.bothSided
                 xAxis.valueFormatter = IndexAxisValueFormatter(values: mounthArray)

                 barChartFacMesView.rightAxis.enabled = false
                

                 barChartFacMesView.xAxis.labelPosition = .bottom
        
        
        
                 let charDataSet = BarChartDataSet(entries:dataEntries,label: "")
                 charDataSet.drawValuesEnabled = false
                 charDataSet.colors =  [CaliddaColors.green, UIColor.lightGray]
                 let charData = BarChartData()
                 charData.addDataSet(charDataSet)
                 
                 barChartFacMesView.data = charData

            return charData
    }
    
    func setChartFacDiario(){
            //barChartRef
        

       // @IBOutlet var viewBackChartMesFac:UIView!
        
             barChartFacDiarioView.frame = CGRect(x:0 , y:0, width: self.viewBackChartDiarioFac.frame.size.width,
                                             height: self.viewBackChartDiarioFac.frame.size.height)
                    
             viewBackChartDiarioFac.addSubview(barChartFacDiarioView)
            // barChartRef.rightAxis.enabled = false
           
             barChartFacDiarioView.noDataText = "You need to provide data for the chart."
             barChartFacDiarioView.rightAxis.enabled = false
             
             var dataEntries:[BarChartDataEntry] = []
             var counter = 0.0
             
             for userItem in self.newGroupSectionsFacDiario{
                 counter += 1
                 print("counterTTMes",counter)
                 print("DemandaTT",userItem.DemandaMaxima!)
                   let dataEntry = BarChartDataEntry(x: counter,yValues:[userItem.ConsumoFacturado,userItem.DemandaMaxima], data: "Points")
                dataEntries.append(dataEntry)
             }
             
             let hoursLabel =  [
                             "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio"
                         ]

             //////////////////////////////////
            // let xAxis: XAxis = barChartFacDiarioView.xAxis
            
            // xAxis.valueFormatter = IndexAxisValueFormatter(values: hoursLabel)
        
            
             
             let charDataSet = BarChartDataSet(entries:dataEntries,label: "")
             charDataSet.drawValuesEnabled = false
             charDataSet.colors =  [CaliddaColors.green, UIColor.lightGray]
             let charData = BarChartData()
             charData.addDataSet(charDataSet)
             
             barChartFacDiarioView.data = charData
        
        
        /*
            let set1 = LineChartDataSet(entries: yValues, label: "Subcribers")
            set1.mode = .cubicBezier
            set1.drawCirclesEnabled = false
            set1.lineWidth = 3
            set1.setColor(.white)
            set1.fill = Fill(color: .white)
            set1.fillAlpha = 0.8
            set1.drawFilledEnabled = true
            set1.drawHorizontalHighlightIndicatorEnabled = false
            set1.highlightColor = .systemRed
        let data = LineChartData(dataSet: set1)
        let dataC = CombinedChartData()
        dataC.lineData = lineChartView.data as? LineChartData
        dataC.barData = barChartFacDiarioView.data as? BarChartData
        //barChartFacDiarioView.xAxis.axisMaximum = dataC.xMax + 0.25
        barChartFacDiarioView.data = dataC
        */

    }
    func setChartFacMes(){
        //barChartRef
           barChartMesRefView.frame = CGRect(x:0 , y:0, width: self.viewBackChartMesRef.frame.size.width,
                                                height: self.viewBackChartMesRef.frame.size.height)
          viewBackChartMesRef.addSubview(barChartMesRefView)
               // barChartRef.rightAxis.enabled = false
           barChartMesRefView.noDataText = "You need to provide data for the chart."

           barChartFacDiarioView.rightAxis.enabled = false
        
           var dataEntries:[BarChartDataEntry] = []
           var counter = 0.0
                
           for userItem in self.newGroupSectionsMes{
                    counter += 1
                    print("counterTTMes",counter)
                    print("DemandaTT",userItem.Demanda!)
                      let dataEntry = BarChartDataEntry(x: counter,yValues:[userItem.Demanda,userItem.DemandaMax], data: "Points")
                   dataEntries.append(dataEntry)
            }
                
             let hoursLabel =  [
                                "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio"
                            ]

                //////////////////////////////////
                //var hoursLabel = Constants.hoursLabel
                let xAxis: XAxis = barChartMesRefView.xAxis
                //xAxis.position = XAxis.XAxisPosition.BOTTOM
               // xAxis.labelPosition = Charts.XAxis.LabelPosition.bothSided

                xAxis.valueFormatter = IndexAxisValueFormatter(values: hoursLabel)
           
               
                
                let charDataSet = BarChartDataSet(entries:dataEntries,label: "")
                charDataSet.drawValuesEnabled = false
                charDataSet.colors =  [CaliddaColors.green, UIColor.lightGray]
                let charData = BarChartData()
                charData.addDataSet(charDataSet)
                
                //barChartRef.data = charData
                barChartMesRefView.data = charData
           //     charDataSet.colors = ChartColorTemplates.colorful()
            //    BarChartView.animate(xAxisDuration:2.0, yAxisDuration:2.0)
                

    }
    func setupRef(){
        
        
        self.viwBackContentHoraSubRef.isHidden = false
        self.viwBackContentDiaSubRef.isHidden = true
        self.viwBackContentMesSubRef.isHidden = true
        
        
        //Ref Horario
        self.titleHorarioLabel.textColor = CaliddaColors.lightBackCyanBorder
        self.titleHorarioLabel.font = CaliddaFont.bold16
        
        self.viwBackContentRef.isHidden = false
        self.viwBackContentFac.isHidden = true
        self.viewLinerFac.isHidden = true
        self.viewLinerRef.isHidden = false
    }
    func setupUI(){
        //self.viwBackContentFac.layer.cornerRadius = 8
        //self.viwBackContentFac.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
             
        self.titleRefLabel.textColor = CaliddaColors.lightBackCyanBorder
        self.titleFacLabel.textColor = CaliddaColors.lightDark
        
       /* self.viewInfoRef.layer.cornerRadius = 8
        self.viewInfoRef.layer.borderWidth = 2
        self.viewInfoRef.layer.borderColor = CaliddaColors.lightShadowDarkLiner.cgColor
        self.viewInfoRef.backgroundColor = .white
        self.viewInfoRef.layer.shadowColor = CaliddaColors.blackDark.cgColor
        */
        
        
        self.viewInfoRef.layer.cornerRadius = 8
        self.viewInfoRef.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        self.viewInfoRef.layer.shadowOpacity = 8
        self.viewInfoRef.backgroundColor = .white
        self.viewInfoRef.layer.shadowOffset = .zero
        self.viewInfoRef.layer.shadowRadius = 4
        
        self.viewDiarioContent.layer.cornerRadius = 8
        self.viewDiarioContent.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        self.viewDiarioContent.layer.shadowOpacity = 8
        self.viewDiarioContent.backgroundColor = .white
        self.viewDiarioContent.layer.shadowOffset = .zero
        self.viewDiarioContent.layer.shadowRadius = 4
          
        self.viewMesContent.layer.cornerRadius = 8
        self.viewMesContent.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        self.viewMesContent.layer.shadowOpacity = 8
        self.viewMesContent.backgroundColor = .white
        self.viewMesContent.layer.shadowOffset = .zero
        self.viewMesContent.layer.shadowRadius = 4
                 
           
   
      self.viewInfo.layer.cornerRadius = 8
      self.viewBackDayMontFac.layer.cornerRadius = 8
        
      self.viewConsuFac_Fac.layer.cornerRadius = 5
      self.viewMaxDem_Fac.layer.cornerRadius = 5
     
        //Factura Diario
        self.viewInfoFac.layer.cornerRadius = 8
        self.viewInfoFac.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        self.viewInfoFac.layer.shadowOpacity = 8
        self.viewInfoFac.backgroundColor = .white
        self.viewInfoFac.layer.shadowOffset = .zero
        self.viewInfoFac.layer.shadowRadius = 4
        
        //Factura Mes
        self.viewInfoMesFac.layer.cornerRadius = 8
        self.viewInfoMesFac.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        self.viewInfoMesFac.layer.shadowOpacity = 8
        self.viewInfoMesFac.backgroundColor = .white
        self.viewInfoMesFac.layer.shadowOffset = .zero
        self.viewInfoMesFac.layer.shadowRadius = 4
        
             
    }
    //Componente fecha combo
           func addTransparentView(frames:CGRect){
               let window = UIApplication.shared.keyWindow
               transparentView.frame = window?.frame ?? self.view.frame
               self.view.addSubview(transparentView)
               
               tablewView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
               self.view.addSubview(tablewView)
               tablewView.layer.cornerRadius = 5
               
               transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
               
               let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
               transparentView.addGestureRecognizer(tapgesture)
               transparentView.alpha = 0
               UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {self.transparentView.alpha = 0.5
                   self.tablewView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
               }, completion: nil)
               
           }
           
    @IBAction func onCLickSelectFruit(_ sender: Any){
            
        if buttonFecha ==  true{

              let fechaActual = Date()
            //  let item: ChecklistItem
            print("fechaActual:>>",fechaActual)
              //print("item!.date::>>",item!.date)
              let pickerController = CalendarPickerViewController(
                  baseDate: fechaActual,
                 selectedDateChanged: { [weak self] date in
                 guard let self = self else { return }

                  print("date:>>",date)
                 //self.item.date = date
                     
                     let fullName    = "\(date)"

                    let fullNameFecha = fullName.components(separatedBy: " ")
                    let fechString    = fullNameFecha[0]
                    
                     let fullNameArr = fechString.components(separatedBy: "-")
                     let yearString    = fullNameArr[0]
                     let monthString = fullNameArr[1]
                    let dayString = fullNameArr[2]
                     
                    let fchSelect = "\(dayString)/\(monthString)/\(yearString)"

                    print("fchSelect:>>",fchSelect)
                    /*
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS'Z'"
                    let date = dateFormatter.date(from: "\(date)")
                                 
                    dateFormatter.dateFormat = "yyyy"
                    dateFormatter.timeZone = NSTimeZone.local
                    let timeStamp1 = dateFormatter.string(from: date!)
                                 
                   print("timeStamp11:>>",timeStamp1)
                   */
                    
                    self.btnSelectFruit.setTitle(fchSelect, for: .normal)
                    
                    self.loadDataHorario()
                 
                 })

               present(pickerController, animated: true, completion: nil)
              
        }else{
            
               dataSource = ["Julio 2020","Agosto 2020","Septiembre 2020","Octubre 2020","Noviembre 2020"]
                selectButton = btnSelectFruit
                addTransparentView(frames:btnSelectFruit.frame)
                loadDataDiario()
        }

          
    }
           @objc func removeTransparentView(){
               let frames = selectButton.frame
               UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {self.transparentView.alpha = 0
                    self.tablewView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
                      }, completion: nil)
               

           }
           
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        /*
        barChart.frame = CGRect(x:0 , y:0, width: self.viwBackChart.frame.size.width,
                                 height: self.viwBackChart.frame.size.height)
        barChartRef.frame = CGRect(x:0 , y:0, width: self.viwBackChartRef.frame.size.width,
                                 height: self.viwBackChartRef.frame.size.height)
        viwBackChart.addSubview(barChart)
        viwBackChartRef.addSubview(barChartRef)
       
        var entries = [BarChartDataEntry]()
            for x in 0..<10{
              entries.append(BarChartDataEntry(x:Double(x),y:Double(x)))
            }
        let set = BarChartDataSet(entries: entries)
       // set.colors = ChartColorTemplates.joyful()
        
        let data = BarChartData(dataSet: set)
        barChart.data = data
        barChartRef.data = data
        */
    }
     
    @IBAction func btnHoraSubRef(){
        
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: date as Date)
                     
        btnSelectFruit.setTitle(dateString, for: .normal)
        
        //btnSelectFruit.setTitle("24/11/2020", for: .normal)
        self.buttonFecha = true
        
        self.viwBackContentHoraSubRef.isHidden = false
        self.viwBackContentDiaSubRef.isHidden = true
        self.viwBackContentMesSubRef.isHidden = true
        

        self.btnSelectFruit.isHidden = false
        //Ref Horario
        self.titleHorarioLabel.font = CaliddaFont.bold16
        self.titleHorarioLabel.textColor = CaliddaColors.lightBackCyanBorder
        
        self.titleDiarioLabel.font = CaliddaFont.medium16
        self.titleDiarioLabel.textColor = CaliddaColors.lightDark
        self.titleMensualRefLabel.font = CaliddaFont.medium16
        self.titleMensualRefLabel.textColor = CaliddaColors.lightDark

        
        loadDataHorario()
        
        self.boolHoraRef = true
        self.boolDiaRef = false
        self.boolMesRef = false
        self.boolDiaFac = false
        self.boolMesFac = false
        
    }
    @IBAction func btnDiaSubRef(){

        
        btnSelectFruit.setTitle("Noviembre 2020", for: .normal)
        
      self.buttonFecha = false
        self.viwBackContentHoraSubRef.isHidden = true
        self.viwBackContentDiaSubRef.isHidden = false
        self.viwBackContentMesSubRef.isHidden = true
              

        self.btnSelectFruit.isHidden = false
        //Ref Horario
        self.titleHorarioLabel.font = CaliddaFont.medium16
        self.titleHorarioLabel.textColor = CaliddaColors.lightDark
        self.titleDiarioLabel.font = CaliddaFont.bold16
        self.titleDiarioLabel.textColor = CaliddaColors.lightBackCyanBorder
        self.titleMensualRefLabel.font = CaliddaFont.medium16
        self.titleMensualRefLabel.textColor = CaliddaColors.lightDark
        loadDataDiario()
        
        self.boolHoraRef = false
        self.boolDiaRef = true
        self.boolMesRef = false
        self.boolDiaFac = false
        self.boolMesFac = false
    }
    @IBAction func btnMesSubRef(){
        

      self.buttonFecha = false
        self.viwBackContentHoraSubRef.isHidden = true
        self.viwBackContentDiaSubRef.isHidden = true
        self.viwBackContentMesSubRef.isHidden = false
              

              self.btnSelectFruit.isHidden = true
        //Ref Horario
        self.titleHorarioLabel.font = CaliddaFont.medium16
        self.titleHorarioLabel.textColor = CaliddaColors.lightDark
        self.titleDiarioLabel.font = CaliddaFont.medium16
        self.titleDiarioLabel.textColor = CaliddaColors.lightDark
        self.titleMensualRefLabel.font = CaliddaFont.bold16
        self.titleMensualRefLabel.textColor = CaliddaColors.lightBackCyanBorder
        loadDataMes()
        
        self.boolHoraRef = false
        self.boolDiaRef = false
        self.boolMesRef = true
        self.boolDiaFac = false
        self.boolMesFac = false
    }
    //Button Fac
    @IBAction func btnDiarioSubFac(){
        
        
        self.buttonFecha = false
        self.loadDataFacturaDiario()

        self.viwBackContentSubDiarioFac.isHidden = false
        self.viwBackContentSubMesFac.isHidden = true
              

        self.btnSelectFruit.isHidden = false
        //Ref Horario
        self.titleFacDiarioLabel.font = CaliddaFont.bold16
        self.titleFacDiarioLabel.textColor = CaliddaColors.lightBackCyanBorder
        self.titleFacMensualLabel.font = CaliddaFont.medium16
        self.titleFacMensualLabel.textColor = CaliddaColors.lightDark
        loadDataMes()
        
        self.boolHoraRef = false
        self.boolDiaRef = false
        self.boolMesRef = false
        self.boolDiaFac = true
        self.boolMesFac = false
    }
    @IBAction func btnMesSubFac(){
        
        self.loadDataFacturaMes()
        
      self.viwBackContentSubDiarioFac.isHidden = true
      self.viwBackContentSubMesFac.isHidden = false
              

       self.btnSelectFruit.isHidden = true
        //Ref Horario
        self.titleFacDiarioLabel.font = CaliddaFont.medium16
        self.titleFacDiarioLabel.textColor = CaliddaColors.lightDark
        self.titleFacMensualLabel.font = CaliddaFont.bold16
        self.titleFacMensualLabel.textColor = CaliddaColors.lightBackCyanBorder
        loadDataMes()
        
        self.boolHoraRef = false
        self.boolDiaRef = false
        self.boolMesRef = false
        self.boolDiaFac = false
        self.boolMesFac = true
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
    
    @IBAction func btnRefencial(_ sender:UIButton){
        
        self.buttonFecha = true
        
        self.viwBackContentRef.isHidden = false
        self.viwBackContentFac.isHidden = true
        self.viewLinerFac.isHidden = true
        self.viewLinerRef.isHidden = false
        
        self.titleRefLabel.textColor = CaliddaColors.lightBackCyanBorder
        self.titleFacLabel.textColor = CaliddaColors.lightDark
             
        
     }
    
    @IBAction func btnFacturaView(_ sender:UIButton){
        
        
        btnSelectFruit.setTitle("Noviembre 2020", for: .normal)
        
        self.buttonFecha = false
        self.viwBackContentSubDiarioFac.isHidden = false
        self.viwBackContentSubMesFac.isHidden = true
        
        
        self.titleRefLabel.textColor = CaliddaColors.lightDark
        self.titleFacLabel.textColor = CaliddaColors.lightBackCyanBorder
                     
        //Fac Horario
        self.titleFacDiarioLabel.font = CaliddaFont.bold16
        self.titleFacDiarioLabel.textColor = CaliddaColors.lightBackCyanBorder
        self.titleFacMensualLabel.font = CaliddaFont.medium16
        
        self.loadDataFacturaDiario()
        self.viwBackContentRef.isHidden = true
        self.viwBackContentFac.isHidden = false
        self.viewLinerFac.isHidden = false
        self.viewLinerRef.isHidden = true
   }
     
   
    func writeToFile(data: Data, fileName: String){
        // get path of directory
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
            return
        }
        // create file url
        let fileurl =  directory.appendingPathComponent("\(fileName).xlsx")
    // if file exists then write data
        if FileManager.default.fileExists(atPath: fileurl.path) {
            if let fileHandle = FileHandle(forWritingAtPath: fileurl.path) {
                // seekToEndOfFile, writes data at the last of file(appends not override)
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
                print("Grabo")
            }
            else {
                print("Can't open file to write.")
            }
        }
        else {
            // if file does not exist write data for the first time
            do{
                try data.write(to: fileurl, options: .atomic)
            }catch {
                print("Unable to write in new file.")
            }
        }

    }
     
    func loadBoolHoraRef(){
        
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateString = dateFormatter.string(from: date as Date)
              
        //let userProperties = presenter.getMyUser().TokenAcceso!
        let userProperties =  UserDefaults.standard.string(forKey: "KeyToken")!
        let codEmp =  UserDefaults.standard.string(forKey: "KeyCodEmr")!
        presenter.getReporteRefHora(token: userProperties,userEmp:codEmp,hora:dateString)
                  .subscribeOn(MainScheduler.asyncInstance)
                  .subscribe(onNext: {result in
                      //self.fillInfoTop(result.data)
                      self.downloadReporteRefHora(result)
                  },
                             onError: {error in
                  },
                             onCompleted: {},
                             onDisposed: {})
                  .disposed(by: self.disposeBag)
            //  registerCell()
    }
    func downloadReporteRefHora(_ info:[ResponseReporteRefHora]){
        DispatchQueue.main.async {
            print("infoFec::",info[0].FechaConsumo)
            print("infoArch::",info[0].ArchivoBytes)
           // self.newGroupSectionsMes = info
           // self.setChartMes()
           // print(" infooooConsumMes >>::", info)
            
            if let decodeData = Data(base64Encoded: info[0].ArchivoBytes, options: .ignoreUnknownCharacters) {
                          
               let formatter = DateFormatter()
               formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
               let myString = formatter.string(from: Date())
               let yourDate = formatter.date(from: myString)
               formatter.dateFormat = "dd-MMM-yyyy"
               let myStringafd = formatter.string(from: yourDate!)

                print(myStringafd)
                      
                self.writeToFile(data: decodeData, fileName: "Reporte Consumo \(myStringafd)")
            }
        }
    }
    
    @IBAction func btnDownloadExcel(_ sender:UIButton){
        print("butoon excel")
        if self.boolHoraRef == true{
            print("print1")
           
            loadBoolHoraRef()
            
        }
        if self.boolDiaRef == true{
            print("print2")
            
        }
        if self.boolMesRef == true{
            print("print3")
            
        }
        if self.boolDiaFac == true{
            print("print4")
            
        }
        if self.boolMesFac == true{
            print("print5")
            
        }
        //------------------------------------
        
        //---------donwload scv---------------------------
        
        /*
        let sFileName = "test.scv"
        
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        
        let documentURL = URL(fileURLWithPath: documentDirectoryPath).appendingPathComponent(sFileName)
        
        let output = OutputStream.toMemory()
        
        
        let buffer = (output.property(forKey: .dataWrittenToMemoryStreamKey)as? Data)!
        
        do{
            try buffer.write(to: documentURL)
        }
        catch{
            
        }
         */

        self.base64String = "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"
        //-----------------------------------
        
        /*
        if let decodeData = Data(base64Encoded: self.base64String, options: .ignoreUnknownCharacters) {
                
            
                     let formatter = DateFormatter()
                     formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                     let myString = formatter.string(from: Date())
                     let yourDate = formatter.date(from: myString)
                     formatter.dateFormat = "dd-MMM-yyyy"
                     let myStringafd = formatter.string(from: yourDate!)

                     print(myStringafd)
            
                writeToFile(data: decodeData, fileName: "Reporte Consumo \(myStringafd)")
           
            let view = PopUpCloseErrorView()
                 view.setupView(type: .downloadFile, messagin: "")
                 view.delegateError = self
                AlertComponent.shared.setupAlert(controller: self, messasge: nil, externalView: view)
              
        }
         */
        let view = PopUpCloseErrorView()
                       view.setupView(type: .downloadFile, messagin: "")
                       view.delegateError = self
                      AlertComponent.shared.setupAlert(controller: self, messasge: nil, externalView: view)
                    
        /*
       
        let decodeData = Data(base64Encoded: self.base64String, options: .ignoreUnknownCharacters)
        
      
        //let destination = Alamofire.Request.suggestedDownloadDestination(directory: .DocumentDirectory, domain: .UserDomainMask)
        
       // Alamofire.download(.GET, "https://s3-eu-west-1.amazonaws.com/schooly/handasaim/news/f_1312015203355628490.xls", destination)
         
      let destination: DownloadRequest.Destination = { _, _ in
          let documentsURL = FileManager.default.urls(for: .picturesDirectory, in: .userDomainMask)[0]
              let fileURL = documentsURL.appendingPathComponent("f_1312015203355628490.xls")
              return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
      }
      AF.download("https://s3-eu-west-1.amazonaws.com/schooly/handasaim/news/", to: destination).response { response in
          debugPrint(response)
          if response.error == nil, let imagePath = response.fileURL?.path {
              let image = UIImage(contentsOfFile: imagePath)
          }
      } 
        
        
        DispatchQueue.main.async {
             self.router.show(view: .detailConsumoExcel, sender: self)
         }
        */
        /*
        let url = NSURL(string: "https://s3-eu-west-1.amazonaws.com/schooly/handasaim/news/f_1312015203355628490.xls")

        let urlRequest = NSURLRequest(url: url! as URL)

        NSURLConnection.sendAsynchronousRequest(urlRequest as URLRequest, queue: OperationQueue.main, completionHandler: {
            response, data, error in

            if error != nil {
                print("There was an error")

            } else {
                print(data)
            }
        })
        */
     }
    
}
extension ConsumoView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablewView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectButton.setTitle(dataSource[indexPath.row], for: .normal)
        removeTransparentView()
    }
    
}
// MARK: - PopUpErrorView Delegate
extension ConsumoView: PopUpCloseErrorViewDelegate {
    func onClose(type: PopUpCloseErrorType) {
       // if type == .connection {
           // self.goToHome()
        let alert = AlertComponent.shared
        alert.closeAllAlters()
           // router.pop(sender: self)
       // }
    }
    func onAceppt(type: PopUpCloseErrorType) {
           // router.show(view: .home, sender: self)
       
        
        let alert = AlertComponent.shared
        alert.closeAllAlters()
      }
   
}
