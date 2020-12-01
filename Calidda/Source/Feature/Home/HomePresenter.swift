//
//  HomePresenter.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import RxSwift

struct HomePresenter {
    private var service:HomeService!
    private var serviceEventos:EventService!
    init(homeService:HomeService,eventosService:EventService) {
    //init(homeService:HomeService) {
        service = homeService
        serviceEventos = eventosService
    }
   /* func getMyUser() -> ResponseUserData {
        return service.getUser()
    }*/
    func getInfoDoctor(token:String,idUser:String) -> Observable<ResponseResuData>{
       // CustomLoader.instance.showLoaderView()
        return Observable<ResponseResuData>.create { observer in
            //consumimos el servicio como tal
            self.service.getInfoDoctor(token,idUser){ ResponseResuData, error in
                guard let result:ResponseResuData = ResponseResuData else {
                    observer.onError(error!)
                    return
                }
                observer.onNext(result)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    func getEventos(token:String) -> Observable<[ResponseEventData]>{
        
        
       // CustomLoader.instance.showLoaderView()
      
        return Observable<[ResponseEventData]>.create { observer in
            //consumimos el servicio como tal
            self.serviceEventos.getEventos(token){ responseEventData, error in
                guard let result:[ResponseEventData] = responseEventData else {
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





