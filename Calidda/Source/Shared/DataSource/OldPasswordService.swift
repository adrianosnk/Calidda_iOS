//
//  AuthenticationService.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import Foundation
import Firebase
 
 
class OldPasswordService:AuthenticationService {
  //  let URL_BASE:String = "https://devapi.smartdoctor.pe/v1"
   // let URL_BASE:String = "https://64ef6ff3-71e0-4823-9ef8-1635d2400e38.mock.pstmn.io"
   // let URL_BASE:String = "http://127.0.0.1:3001"
 
    func postChangePassword(_ cuentaContrato:String,_ completionHandler: @escaping (_ result: ResponseOldPasswordData?, _ error: Error?) -> Void){

        let criptUser = CriptUserChangePassword.init(cuentaContrato: cuentaContrato)

        let jsonEncoder = JSONEncoder()
        let postData = try! jsonEncoder.encode([criptUser])
         
        //var request = createConnection(endPoint: "/api/login/clientes")
        var request = createConnection(endPoint: "/api/clientes/olvidecontrasena")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                
                completionHandler(nil,error!)
                
                return
            }
            print("data::>>",data)
           // let userData = try! JSONDecoder().decode(UserData.self, from: data)
            typealias ResponseUserDatas = [ResponseOldPasswordData]
           
            if let httpresponse = response as? HTTPURLResponse{
                
                if httpresponse.statusCode == 429{
                    completionHandler(nil,error)
                    
                }else if httpresponse.statusCode == 200 {
                    let userDatas = try! JSONDecoder().decode(ResponseUserDatas.self, from: data)
                    
                      
                     // print("userData::>>",userDatas.first!)
                     // self.authFirebase(email, password)
                      
                          let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
                          UserDefaults.standard.set(encodedData, forKey: "users")
                          UserDefaults.standard.synchronize()
                          let userData = userDatas.first!
                      
                          completionHandler(userData,nil)
                }
            }
            
            print(String(data: data, encoding: .utf8)!)
            //            semaphore.signal()
        }
         
        task.resume()
        //        semaphore.wait()
    }
}

struct CriptUserChangePassword : Codable{
    var CuentaContrato: String
    init(cuentaContrato:String) {
        self.CuentaContrato = cuentaContrato.cryptoSwiftAESEncrypt(key: Constan.key, iv: Constan.iv)!
    }
}
