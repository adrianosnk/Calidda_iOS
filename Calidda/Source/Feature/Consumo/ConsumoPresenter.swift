//
//  RegisterPresenter.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import UIKit
import RxSwift
 
struct ConsumoPresenter {
   
     private var service:ConsumoRefHoraService!
     private var serviceRefDiario:ConsumoRefDiarioService!
     private var serviceRefMes:ConsumoRefMesService!
     
     private var serviceFacDiario:ConsumoFacDiarioService!
     private var serviceFacMes:ConsumoFacMesService!
    
     private var serviceReportRefHora:ReporteRefHoraService!
     private var serviceReportRefDia:ReporteRefDiarioService!
     private var serviceReportRefMes:ReporteRefMesService!
     private var serviceReportFacDia:ReporteFacDiarioService!
     private var serviceReportFacMes:ReporteFacMesService!
    
    init(consumoService:ConsumoRefHoraService,consumoRefDiarService:ConsumoRefDiarioService,consumoRefMesService:ConsumoRefMesService,consumoFacDiarioService:ConsumoFacDiarioService,consumoFacMesService:ConsumoFacMesService,reporteRefHoraService:ReporteRefHoraService,reporteRefDiarioService:ReporteRefDiarioService,reporteRefMesService:ReporteRefMesService,reporteFacDiarioService:ReporteFacDiarioService,reporteFacMesService:ReporteFacMesService) {
            service = consumoService
            serviceRefDiario = consumoRefDiarService
            serviceRefMes = consumoRefMesService
            serviceFacDiario = consumoFacDiarioService
            serviceFacMes = consumoFacMesService
        
            serviceReportRefHora = reporteRefHoraService
            serviceReportRefDia = reporteRefDiarioService
            serviceReportRefMes = reporteRefMesService
            serviceReportFacDia = reporteFacDiarioService
            serviceReportFacMes = reporteFacMesService
        }
    
     func getConsumoRefHora(token:String,userEmp:String,hora:String) -> Observable<[ResponseReferencialHorario]>{
            return Observable<[ResponseReferencialHorario]>.create { observer in
                //consumimos el servicio como tal
                self.service.getConsumoRefHora(token,userEmp,hora){ responseReferencialHorario, error in
                    
                    guard let result:[ResponseReferencialHorario] = responseReferencialHorario else {
                        observer.onError(error!)
                        return
                    }
                    observer.onNext(result)
                    observer.onCompleted()
                }
                return Disposables.create()
            }
     }
      
    func getReporteRefHora(token:String,userEmp:String,hora:String) -> Observable<[ResponseReporteRefHora]>{
            return Observable<[ResponseReporteRefHora]>.create { observer in
                //consumimos el servicio como tal
                self.serviceReportRefHora.getReporteRefHora(token,userEmp,hora){ responseReporteRefHora, error in
                    
                    guard let result:[ResponseReporteRefHora] = responseReporteRefHora else {
                        observer.onError(error!)
                        return
                    }
                    observer.onNext(result)
                    observer.onCompleted()
                }
                return Disposables.create()
            }
     }
    
 
   
    func getConsumoRefDiario(token:String,codEmp:String,mes:Int,anio:Int) -> Observable<[ResponseReferencialDiario]>{
           return Observable<[ResponseReferencialDiario]>.create { observer in
               //consumimos el servicio como tal
               self.serviceRefDiario.getConsumoRefDiario(token,codEmp,mes,anio){ responseReferencialDiario, error in
                   
                   guard let result:[ResponseReferencialDiario] = responseReferencialDiario else {
                       observer.onError(error!)
                       return
                   }
                   observer.onNext(result)
                   observer.onCompleted()
               }
               return Disposables.create()
           }
    }
     
        
    func getConsumoRefMes(token:String,codEmp:String) -> Observable<[ResponseReferencialMensual]>{
           return Observable<[ResponseReferencialMensual]>.create { observer in
               //consumimos el servicio como tal
               self.serviceRefMes.getConsumoRefMes(token,codEmp){ responseReferencialMensual, error in
                
                   guard let result:[ResponseReferencialMensual] = responseReferencialMensual else {
                       observer.onError(error!)
                       return
                   }
                   observer.onNext(result)
                   observer.onCompleted()
               }
               return Disposables.create()
           }
    }
    func getConsumoFacDiario(token:String,codEmp:String,mes:Int,anio:Int) -> Observable<[ResponseFacturadoDiario]>{
            return Observable<[ResponseFacturadoDiario]>.create { observer in
                //consumimos el servicio como tal
                self.serviceFacDiario.getConsumoFacDiario(token,codEmp,mes,anio){ responseFacturadoDiario, error in
                    
                    guard let result:[ResponseFacturadoDiario] = responseFacturadoDiario else {
                        observer.onError(error!)
                        return
                    }
                    observer.onNext(result)
                    observer.onCompleted()
                }
                return Disposables.create()
            }
     }
    
     func getConsumoFacMes(token:String,cuentaContrato:String) -> Observable<[ResponseFacturadoMes]>{
            return Observable<[ResponseFacturadoMes]>.create { observer in
                //consumimos el servicio como tal
                self.serviceFacMes.getConsumoFacMes(token,cuentaContrato){ responseFacturadoMes, error in
                    
                    guard let result:[ResponseFacturadoMes] = responseFacturadoMes else {
                        observer.onError(error!)
                        return
                    }
                    observer.onNext(result)
                    observer.onCompleted()
                }
                return Disposables.create()
            }
     }
}
