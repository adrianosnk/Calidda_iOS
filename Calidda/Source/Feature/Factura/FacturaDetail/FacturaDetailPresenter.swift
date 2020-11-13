//
//  HomePresenter.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import RxSwift

struct FacturaDetailPresenter {
    private var service:FacturaDetailService!
    init(facturaDetailService:FacturaDetailService) {
        service = facturaDetailService
    }
   /* func getMyUser() -> ResponseUserData {
        return service.getUser()
    }
*/ 
    func getInfoDetailFactura(token:String) -> Observable<ResponseFacDetailData>{
        return Observable<ResponseFacDetailData>.create { observer in
            //consumimos el servicio como tal
            self.service.getInfoDetailFactura(token){ ResponseFacDetailData, error in
                
                guard let result:ResponseFacDetailData = ResponseFacDetailData else {
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





