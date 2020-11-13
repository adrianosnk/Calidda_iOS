//
//  AuthenticationService.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import Foundation
import Firebase
 
class AuthenticationService {
  //  let URL_BASE:String = "https://devapi.smartdoctor.pe/v1"
   // let URL_BASE:String = "https://64ef6ff3-71e0-4823-9ef8-1635d2400e38.mock.pstmn.io"
    let URL_BASE:String = "http://127.0.0.1:3001"
    let OS:String = "iOS"
    func createConnection(endPoint:String) -> URLRequest {
        print("url:","\(URL_BASE)\(endPoint)")
        let request = URLRequest(url: URL.init(string: "\(URL_BASE)\(endPoint)")!)
        return request
    }
    func auth(_ email:String,_ password:String,_ completionHandler: @escaping (_ result: ResponseUserData?, _ error: Error?) -> Void){
        
        //        let semaphore = DispatchSemaphore (value: 0)
        let parameters = ["Cuenta": email,
                          "Password": password] as [String : Any]
        
        /*

         let parameters = ["email": email,
                           "password": password,
                           "is_app_doctor": true,
                           "is_doctor":true,
                           "application":"sd",
                           "platform":OS] as [String : Any]
         */
        let postData = parameters.toJsonData()!
        
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
            //            print (jsonString)
            return jsonData
            
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
