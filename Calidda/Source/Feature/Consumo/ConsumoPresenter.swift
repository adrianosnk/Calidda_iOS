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
    
    init(consumoService:ConsumoRefHoraService,consumoRefDiarService:ConsumoRefDiarioService,consumoRefMesService:ConsumoRefMesService,consumoFacDiarioService:ConsumoFacDiarioService,consumoFacMesService:ConsumoFacMesService) {
            service = consumoService
            serviceRefDiario = consumoRefDiarService
            serviceRefMes = consumoRefMesService
            serviceFacDiario = consumoFacDiarioService
            serviceFacMes = consumoFacMesService
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
