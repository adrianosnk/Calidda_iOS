//
//  HomeService.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import Foundation

class ConsumoRefHoraService:AuthenticationService {
    //unarchivedObjectOfClass:fromData:error: instead
  
  
    func getConsumoRefHora(_ token:String,_ userEmp:String,_ hora:String,_ completionHandler: @escaping (_ result: [ResponseReferencialHorario]?, _ error: Error?) -> Void){
   
        
       
        
        let criptUser = RequestHora.init(codigoEmr: userEmp, fechaConsumo: hora)
        let jsonEncoder = JSONEncoder()
        let postData = try! jsonEncoder.encode([criptUser])
            
        
        var request = createConnection(endPoint: "/api/clientes/consumo/referencial/horario")
        request.addValue("\(token)", forHTTPHeaderField: "Authorization")
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
            print (jsonString)
           // let userData = try! JSONDecoder().decode(ResponseFacturaDatas.self, from: data)
             
            typealias ResponseReferencialHorarios = [ResponseReferencialHorario]
            let userDatas = try! JSONDecoder().decode(ResponseReferencialHorarios.self, from: data)
                      
           // print("userData::>>",userDatas.first!)
            print("userDataA::>>",userDatas)
            
         
            completionHandler(userDatas,nil)
           // completionHandler(items,nil)
            
            print(String(data: data, encoding: .utf8)!)
        }
        
        //semaphore.wait()
        task.resume()
    }
    
}
 

struct RequestHora : Codable{
    var CodigoEmr: String
    var FechaConsumo: String
    init(codigoEmr:String,
         fechaConsumo:String) {
        self.CodigoEmr = codigoEmr
        self.FechaConsumo = fechaConsumo
    }
}
