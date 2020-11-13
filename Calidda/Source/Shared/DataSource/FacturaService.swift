//
//  HomeService.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import Foundation

class FacturaService:AuthenticationService {
    //unarchivedObjectOfClass:fromData:error: instead
  /*  func getUser() -> ResponseUserData {
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.data(forKey: "users")
        let data = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Data
        //let userData = try! JSONDecoder().decode(UserData.self, from: data)
        let userData = try! JSONDecoder().decode(ResponseUserData.self, from: data)
       
        return userData
         
        
    }*/
    
    func getDoctorInfo() -> DoctorInfo {
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.data(forKey: "KeyFactura")
        let data = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Data
        let doctorInfo = try! JSONDecoder().decode(DoctorInfo.self, from: data)
        return doctorInfo
    }
    
    func getInfoFactura(_ token:String,_ completionHandler: @escaping (_ result: [ResponseFacturaData]?, _ error: Error?) -> Void){
        
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = createConnection(endPoint: "/api/facturacion?Id=IdCliente")
        request.addValue("token \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                
                completionHandler(nil,error!)
                
                return
            }
            print(">>ZZ>>:",String(data: data, encoding: .utf8)!)
            //semaphore.signal()
            
            
            let jsonString = String(data: data, encoding: String.Encoding.utf8)!
            print (jsonString)
           // let userData = try! JSONDecoder().decode(ResponseFacturaDatas.self, from: data)
             
            typealias ResponseFacturaDatas = [ResponseFacturaData]
            let userDatas = try! JSONDecoder().decode(ResponseFacturaDatas.self, from: data)
                      
           // print("userData::>>",userDatas.first!)
            print("userDataA::>>",userDatas)
            
           // var responseFactura = ResponseFacturaData()
 

            var responseFactura = [ResponseFacturaData]()
            
            var items = [[String: Any]]()
             
            for userItem in userDatas{
            //for userItem in jsonString{
                //var item:[String:Any] = [:]
                var item = [ResponseFacturaData]()
                print("userItemM:>>",userItem.Id)
                
               // responseFactura = userItem
                /*
                item["Id"] = userItem.Id
                item["Mes"] = userItem.Mes
                item["Anio"] = userItem.Anio
                item["ImporteTotal"] = userItem.ImporteTotal
                item["FechaVencimiento"] = userItem.FechaVencimiento

               // items.append(item)
                responseFactura.append(item)
                 */
                
            }

             print("responseFactura:>>",items)
            
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
            UserDefaults.standard.set(encodedData, forKey: "KeyFactura")
            UserDefaults.standard.synchronize()
            //let userData = userDatas
            completionHandler(userDatas,nil)
           // completionHandler(items,nil)
            
            print(String(data: data, encoding: .utf8)!)
        }
        
        //semaphore.wait()
        task.resume()
    }
    
    func postPreferenceInfo(_ area_interest:String,_ about_me:String,_ token:String,_ completionHandler: @escaping (_ result: PreferenceInfoData?, _ error: Error?) -> Void){
        
       
        let parameters = ["area_interest": area_interest,"about_me": about_me] as [String : Any]
             let postData = parameters.toJsonData()!
             
        var request = createConnection(endPoint: "/pro/doctor/info")
        request.addValue("token \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                
                completionHandler(nil,error!)
                
                return
            }
            let jsonString = String(data: data, encoding: String.Encoding.utf8)!
            print ("PrintJsonnnDate:",jsonString)
            let userData = try! JSONDecoder().decode(PreferenceInfoData.self, from: data)
            
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
            UserDefaults.standard.set(encodedData, forKey: "KeyPreferenceInfoData")
            UserDefaults.standard.synchronize()
            completionHandler(userData,nil)
            
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
}
