//
//  HomePresenter.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import RxSwift

struct FacturaPresenter {
    private var service:FacturaService!
    init(facturaService:FacturaService) {
        service = facturaService
    }
   /* func getMyUser() -> ResponseUserData {
        return service.getUser()
    }
*/
    func getInfoFactura(token:String) -> Observable<[ResponseFacturaData]>{
        return Observable<[ResponseFacturaData]>.create { observer in
            //consumimos el servicio como tal
            self.service.getInfoFactura(token){ responseFacturaDatas, error in
                
                guard let result:[ResponseFacturaData] = responseFacturaDatas else {
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





