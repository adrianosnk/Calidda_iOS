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
    init(homeService:HomeService) {
        service = homeService
    }
   /* func getMyUser() -> ResponseUserData {
        return service.getUser()
    }*/

    func getInfoDoctor(token:String) -> Observable<ResponseResuData>{
        

      
        return Observable<ResponseResuData>.create { observer in
            //consumimos el servicio como tal
            self.service.getInfoDoctor(token){ ResponseResuData, error in
                
             
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
    
}





