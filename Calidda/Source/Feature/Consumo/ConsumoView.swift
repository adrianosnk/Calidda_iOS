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
class ConsumoView: UIViewController , ChartViewDelegate{
    //var style: Style = Style.myApp
    var router:Router!
    
    @IBOutlet var viwBackContent:UIView!
    @IBOutlet var viwBackUser:UIView!
    @IBOutlet var emailTexfield:UITextField!
    
    
    @IBOutlet var viewInfo:UIView!
    
    @IBOutlet var viwBackContentRef:UIView!
    @IBOutlet var viewBackDayMontRef:UIView!
    @IBOutlet var viwBackChartRef:UIView!
    @IBOutlet var viewConsuFac_Ref:UIView!
    @IBOutlet var viewMaxDem_Ref:UIView!
    @IBOutlet var viewInfoRef:UIView!
    @IBOutlet var viewLinerRef:UIView!
    
    
    @IBOutlet var viwBackContentFac:UIView!
    @IBOutlet var viewBackDayMontFac:UIView!
    @IBOutlet var viwBackChart:UIView!
    @IBOutlet var viewConsuFac_Fac:UIView!
    @IBOutlet var viewMaxDem_Fac:UIView!
    @IBOutlet var viewInfoFac:UIView!
    @IBOutlet var viewLinerFac:UIView!
    
    
    @IBOutlet var btnDownloadExcelFac:UIButton!
    @IBOutlet var btnDownloadExcelRef:UIButton!
    
    
    let menuFooter = MenuFooter()
    let disposebag = DisposeBag()
    
    var barChart = BarChartView()
    var days:[String]!
    var barChartRef = BarChartView()
    
    
    private let presenter = ConsumoPresenter(consumoService: ConsumoRefHoraService(),consumoRefDiarService:ConsumoRefDiarioService(), consumoRefMesService: ConsumoRefMesService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barChart.delegate = self
        
        days = ["Lunes","Martes","Miercoles","Jueves","Viernes","Sábado","Domingo"]
        let tasks = [1.0,2.0,4.5,6.0,8.0,10.0,12.0]
        
        //setChart(days, values:tasks)
        
        setupUI()
        setupRef()
        //Refe Defaul
        setChart(dataPoints:days, values:tasks)
        self.menuFooter.onClickConsumoView()
    }
    
    func setChart(dataPoints:[String], values:[Double]){
        
        barChartRef.frame = CGRect(x:0 , y:0, width: self.viwBackChart.frame.size.width,
                                        height: self.viwBackChart.frame.size.height)
               
        viwBackChart.addSubview(barChartRef)
        
        barChartRef.noDataText = "You need to provide data for the chart."
        
        var dataEntries:[BarChartDataEntry] = []
        var counter = 0.0
        
        for i in 0..<dataPoints.count{
            counter += 1.0
            let dataEntry = BarChartDataEntry(x: values[i],y:counter)
            dataEntries.append(dataEntry)
        }
        let charDataSet = BarChartDataSet(entries:dataEntries,label: "Time")
        let charData = BarChartData()
        charData.addDataSet(charDataSet)
        barChartRef.data = charData
   //     charDataSet.colors = ChartColorTemplates.colorful()
    //    BarChartView.animate(xAxisDuration:2.0, yAxisDuration:2.0)
        

    }
    func setupRef(){
        self.viwBackContentRef.isHidden = false
        self.viwBackContentFac.isHidden = true
        self.viewLinerFac.isHidden = true
        self.viewLinerRef.isHidden = false
    }
    func setupUI(){
        //self.viwBackContentFac.layer.cornerRadius = 8
        //self.viwBackContentFac.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
             
      self.viewInfo.layer.cornerRadius = 8
      self.viewBackDayMontFac.layer.cornerRadius = 8
        
      self.viewConsuFac_Fac.layer.cornerRadius = 5
      self.viewMaxDem_Fac.layer.cornerRadius = 5
     
      self.viewInfoFac.layer.cornerRadius = 8
      self.viewInfoFac.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
             
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
        self.viwBackContentRef.isHidden = false
        self.viwBackContentFac.isHidden = true
        self.viewLinerFac.isHidden = true
        self.viewLinerRef.isHidden = false
     }
    
    @IBAction func btnFacturaView(_ sender:UIButton){
        self.viwBackContentRef.isHidden = true
        self.viwBackContentFac.isHidden = false
        self.viewLinerFac.isHidden = false
        self.viewLinerRef.isHidden = true
   }
}
