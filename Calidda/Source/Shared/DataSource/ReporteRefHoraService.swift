//
//  HomeService.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import Foundation

class ReporteRefHoraService:AuthenticationService {
   
    func getReporteRefHora(_ token:String,_ codEmp:String,_ hora:String,_ completionHandler: @escaping (_ result: [ResponseReporteRefHora]?, _ error: Error?) -> Void){
        
         
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
        let dateString = dateFormatter.string(from: date as Date)
        
        //let hora =  "2020-11-30T15:09:21.88Z"
        let hora =  dateString
        
        let criptUser = RequestReporteHora.init(codigoEmr: codEmp, fechaConsumo: hora)
        let jsonEncoder = JSONEncoder()
        let postData = try! jsonEncoder.encode([criptUser])
             
        var request = createConnection(endPoint: "/api/clientes/reporte/consumo/referencial/horario")
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
              
            typealias ResponseReferencialMensuals = [ResponseReporteRefHora]
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

struct RequestReporteHora : Codable{
    var CodigoEmr: String
    var FechaConsumo: String
    init(codigoEmr:String,
         fechaConsumo:String) {
        self.CodigoEmr = codigoEmr
        self.FechaConsumo = fechaConsumo
    }
}
