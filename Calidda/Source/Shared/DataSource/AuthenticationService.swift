//
//  AuthenticationService.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import Foundation
import Firebase
 
struct UserLogin: Codable {
             var Password: String
             var Cuenta: String
             var Externo: Bool
}
  
class AuthenticationService {
  //  let URL_BASE:String = "https://devapi.smartdoctor.pe/v1"
   // let URL_BASE:String = "https://64ef6ff3-71e0-4823-9ef8-1635d2400e38.mock.pstmn.io"
    //let URL_BASE:String = "http://127.0.0.1:3001"
    let URL_BASE:String = "http://portalextranet.eastus.cloudapp.azure.com:100"
    let OS:String = "iOS"
    func createConnection(endPoint:String) -> URLRequest {
        print("url:","\(URL_BASE)\(endPoint)")
        let request = URLRequest(url: URL.init(string: "\(URL_BASE)\(endPoint)")!)
        return request
    }
    func auth(_ email:String,_ password:String,_ completionHandler: @escaping (_ result: ResponseUserData?, _ error: Error?) -> Void){

        let criptUser = CriptUser.init(password: password, cuenta: email, extern: true)

        let jsonEncoder = JSONEncoder()
        let postData = try! jsonEncoder.encode([criptUser])
         
        //var request = createConnection(endPoint: "/api/login/clientes")
        var request = createConnection(endPoint: "/api/login")
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
            typealias ResponseUserDatas = [ResponseUserData]
           
            if let httpresponse = response as? HTTPURLResponse{

                print("errorRRR::>>",error)
                print("httpresponseRRR::>>",httpresponse)
                print("responseRRR::>>",response)
                if httpresponse.statusCode == 429{
                    completionHandler(nil,error)
                    
                }else if httpresponse.statusCode == 200   {
                    print(String(data: data, encoding: .utf8)!)
                    let userDatas = try! JSONDecoder().decode(ResponseUserDatas.self, from: data)

                          let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
                          UserDefaults.standard.set(encodedData, forKey: "users")
                          UserDefaults.standard.synchronize()
                          let userData = userDatas.first!
                          completionHandler(userData,nil)
                    
                }else if  httpresponse.statusCode == 400  {
                    print(String(data: data, encoding: .utf8)!)
                    let userErrorBody = try! JSONDecoder().decode(ResponseUserData.self, from: data)

                          let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
                          UserDefaults.standard.set(encodedData, forKey: "users")
                          UserDefaults.standard.synchronize()
                          
                          completionHandler(userErrorBody,nil)
                    
                } 
            }
 
            print(String(data: data, encoding: .utf8)!)
            //            semaphore.signal()
        }
         
        task.resume()
        //        semaphore.wait()
    }
    
    func createAccount(){
        
    }
    
    func authFirebase(_ email:String,_ password:String){
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            print(authResult?.additionalUserInfo?.username ?? "no data")
        }
    }
    
}
extension Dictionary {
    func toJsonData()->Data?{
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
            //            let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)!
                print ("printJsoond:",jsonData)
            return jsonData
            
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
 
struct CriptUser : Codable{
    var Password: String
    var Cuenta: String
    var Externo: Bool
    init(password:String,
         cuenta:String,
         extern:Bool) {
        self.Password = password.cryptoSwiftAESEncrypt(key: Constan.key, iv: Constan.iv)!
        self.Cuenta = cuenta.cryptoSwiftAESEncrypt(key: Constan.key, iv: Constan.iv)!
        self.Externo = extern
    }
}
