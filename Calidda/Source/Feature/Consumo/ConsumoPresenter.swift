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
    
    init(consumoService:ConsumoRefHoraService,consumoRefDiarService:ConsumoRefDiarioService,consumoRefMesService:ConsumoRefMesService) {
            service = consumoService
            serviceRefDiario = consumoRefDiarService
            serviceRefMes = consumoRefMesService
        }
    
     func getConsumoRefHora(token:String) -> Observable<[ResponseReferencialHorario]>{
            return Observable<[ResponseReferencialHorario]>.create { observer in
                //consumimos el servicio como tal
                self.service.getConsumoRefHora(token){ responseReferencialHorario, error in
                    
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
 
    
    func getConsumoRefDiario(token:String) -> Observable<[ResponseReferencialDiario]>{
           return Observable<[ResponseReferencialDiario]>.create { observer in
               //consumimos el servicio como tal
               self.serviceRefDiario.getConsumoRefDiario(token){ responseReferencialDiario, error in
                   
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
    
   
        
    func getConsumoRefMes(token:String) -> Observable<[ResponseReferencialMensual]>{
           return Observable<[ResponseReferencialMensual]>.create { observer in
               //consumimos el servicio como tal
               self.serviceRefMes.getConsumoRefMes(token){ responseReferencialMensual, error in
                   
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
}
