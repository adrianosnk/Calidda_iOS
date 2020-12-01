//
//  RegisterPresenter.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import UIKit
import RxSwift
 
struct DetailNovedadesPresenter {
    private var serviceEventDetail:EventDetailService!
    init(eventDetailService:EventDetailService) {
        serviceEventDetail = eventDetailService
    }
  
        
    func getDetailEventos(token:String) -> Observable<[ResponseEventDetailData]>{
        
       // CustomLoader.instance.showLoaderView()
      
        return Observable<[ResponseEventDetailData]>.create { observer in
            //consumimos el servicio como tal
            self.serviceEventDetail.getDetailEventos(token){ responseEventDetailData, error in
                guard let result:[ResponseEventDetailData] = responseEventDetailData else {
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
