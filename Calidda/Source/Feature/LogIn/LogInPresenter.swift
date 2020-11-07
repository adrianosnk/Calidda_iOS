//
//  LogInPresenter.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import RxSwift
struct LogInPresenter {
    private var service:AuthenticationService!
    init(loginService:AuthenticationService) {
        service = loginService
    }
  /*  func auth(email:String,password:String) -> Observable<UserData>{
        return Observable<UserData>.create { observer in
            //consumimos el servicio como tal
            self.service.auth(email, password){ userData, error in
                
                guard let result:UserData = userData else {
                    observer.onError(error!)
                    return
                }
                observer.onNext(result)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    */
    func auth(email:String,password:String) -> Observable<ResponseUserData>{
        return Observable<ResponseUserData>.create { observer in
            //consumimos el servicio como tal
            self.service.auth(email, password){ UsuarioData, error in
                
                guard let result:ResponseUserData = UsuarioData else {
                    observer.onError(error!)
                    return
                }
                print("result::=>>",result)
                observer.onNext(result)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
}

