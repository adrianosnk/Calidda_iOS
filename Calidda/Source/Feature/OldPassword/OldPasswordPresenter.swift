//
//  RegisterPresenter.swift
//  App
//
//  Created by Raul Quispe on 5/31/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import UIKit
import RxSwift

struct OldPasswordPresenter {
    private var service:OldPasswordService!
    init(loginService:OldPasswordService) {
        service = loginService
    }
    
         
    func postChangePassword(cuentaContrato:String) -> Observable<ResponseOldPasswordData>{
     //ProgressView.shared.showProgressView()
        CustomLoader.instance.showLoaderView()
        return Observable<ResponseOldPasswordData>.create { observer in
            //consumimos el servicio como tal
            CustomLoader.instance.hideLoaderView()
            self.service.postChangePassword(cuentaContrato){ responseOldPasswordData, error in
                
                guard let result:ResponseOldPasswordData = responseOldPasswordData else {
                  //  ProgressView.shared.hideProgressView()
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
 
