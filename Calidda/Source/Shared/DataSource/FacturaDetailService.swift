//
//  HomeService.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

class FacturaDetailService:AuthenticationService {
    //unarchivedObjectOfClass:fromData:error: instead
  /*  func getUser() -> ResponseUserData {
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.data(forKey: "users")
        let data = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Data
        //let userData = try! JSONDecoder().decode(UserData.self, from: data)
        let userData = try! JSONDecoder().decode(ResponseUserData.self, from: data)
       
        return userData
         
        
    }
    func getDoctorInfo() -> DoctorInfo {
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.data(forKey: "KeyFactura")
        let data = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Data
        let doctorInfo = try! JSONDecoder().decode(DoctorInfo.self, from: data)
        return doctorInfo
    }
    */
     //Diner club 
    func getInfoDetailFactura(_ token:String,_ completionHandler: @escaping (_ result: ResponseFacDetailData?, _ error: Error?) -> Void){
        
        var request = createConnection(endPoint: "/api/clientes/facturacion/detalle?Id=IdRecibo")
        request.addValue("token \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                
                completionHandler(nil,error!)
                
                return
            }
            let jsonString = String(data: data, encoding: String.Encoding.utf8)!
            print (jsonString)
           // let userData = try! JSONDecoder().decode(ResponseFacturaDatas.self, from: data)
            
            typealias ResponseFacturaDetailDatas = [ResponseFacDetailData]
            let userDatas = try! JSONDecoder().decode(ResponseFacturaDetailDatas.self, from: data)
                      
            print("userData::>>",userDatas.first!)
            
           // var responseFactura = ResponseFacturaData()
 

            var responseFactura = [ResponseFacDetailData]()
            
            var items = [[String: Any]]()
             
            for userItem in userDatas{
                //var item:[String:Any] = [:]
                var item = [ResponseFacDetailData]()
                print("userItemM:>>",userItem)
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
            let userData = userDatas[0]
            completionHandler(userData,nil)
           // completionHandler(items,nil)
            
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
    
   
}
