//
//  HomeService.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//


import UIKit
import Foundation
 
class EventDetailService:AuthenticationService {
    //unarchivedObjectOfClass:fromData:error: instead
 
    func getDetailEventos(_ token:String,_ completionHandler: @escaping (_ result: [ResponseEventDetailData]?, _ error: Error?) -> Void){
        
       
        var request = createConnection(endPoint: "/api/clientes/eventos/detalle?Id=IdEvento")
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
             
            typealias ResponseDetailEventos = [ResponseEventDetailData]
            let userDatas = try! JSONDecoder().decode(ResponseDetailEventos.self, from: data)
                      
            
                           
            
           // print("userData::>>",userDatas.first!)
            print("userDataA::>>",userDatas)
            
           // var responseFactura = ResponseFacturaData()
 
 
           
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
    
}
