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
    let URL_BASE:String = "https://devapi.smartdoctor.pe/v1"
    let OS:String = "iOS"
    func createConnection(endPoint:String) -> URLRequest {
        print("url:","\(URL_BASE)\(endPoint)")
        let request = URLRequest(url: URL.init(string: "\(URL_BASE)\(endPoint)")!)
        return request
    }
    func auth(_ email:String,_ password:String,_ completionHandler: @escaping (_ result: UserData?, _ error: Error?) -> Void){
        
        //        let semaphore = DispatchSemaphore (value: 0)
        let parameters = ["email": email,
                          "password": password,
                          "is_app_doctor": true,
                          "is_doctor":true,
                          "application":"sd",
                          "platform":OS] as [String : Any]
        let postData = parameters.toJsonData()!
        
        var request = createConnection(endPoint: "/account/signin/")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                
                completionHandler(nil,error!)
                
                return
            }
            let userData = try! JSONDecoder().decode(UserData.self, from: data)
           // self.authFirebase(email, password)
            
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
            UserDefaults.standard.set(encodedData, forKey: "users")
            UserDefaults.standard.synchronize()
            completionHandler(userData,nil)
            
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
