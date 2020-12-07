//
//  HomeService.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import Foundation

class ReporteFacDiarioService:AuthenticationService {
   
    func getConsumoRefMes(_ token:String,_ codEmp:String,_ completionHandler: @escaping (_ result: [ResponseReferencialMensual]?, _ error: Error?) -> Void){
        
        var request = createConnection(endPoint: "/api/clientes/consumo/referencial/mensual?CodigoEmr=\(codEmp)")
        request.addValue("\(token)", forHTTPHeaderField: "Authorization")
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
             
            typealias ResponseReferencialMensuals = [ResponseReferencialMensual]
            let userDatas = try! JSONDecoder().decode(ResponseReferencialMensuals.self, from: data)
                      
            
            print("userDataA::>>",userDatas)
            
            
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
            UserDefaults.standard.set(encodedData, forKey: "KeyFactura")
            UserDefaults.standard.synchronize()
            //let userData = userDatas
            completionHandler(userDatas,nil)
           // completionHandler(items,nil)
            
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
    
}
