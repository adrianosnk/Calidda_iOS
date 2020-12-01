//
//  HomeService.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import Foundation

class ConsumoFacDiarioService:AuthenticationService {
    //unarchivedObjectOfClass:fromData:error: instead
 
    
    func getConsumoFacDiario(_ token:String,_ codEmp:String,_ mes:Int,_ anio:Int,_ completionHandler: @escaping (_ result: [ResponseFacturadoDiario]?, _ error: Error?) -> Void){
        
       
        
        //let criptUser = RequestDia.init(CodigoEmr:codEmp, Mes:mes, Anio:anio)
        let criptUser = RequestFacDia.init(cuentaContrato: codEmp, mes: mes, anio: anio)

        let jsonEncoder = JSONEncoder()
        let postData = try! jsonEncoder.encode([criptUser])
        
        var request = createConnection(endPoint: "/api/clientes/consumo/facturado/diario")
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
            print(">>ZZ>>:",String(data: data, encoding: .utf8)!)
            //semaphore.signal()
            
            
            let jsonString = String(data: data, encoding: String.Encoding.utf8)!
            print (jsonString)
           // let userData = try! JSONDecoder().decode(ResponseFacturaDatas.self, from: data)
             
            typealias ResponseFacturaDatas = [ResponseFacturadoDiario]
            let userDatas = try! JSONDecoder().decode(ResponseFacturaDatas.self, from: data)
                      
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

struct RequestFacDia : Codable{
    var CuentaContrato: String
    var Mes: Int
    var Anio: Int
    init(cuentaContrato:String,
         mes:Int,
         anio:Int) {
        self.CuentaContrato = cuentaContrato
        self.Mes = mes
        self.Anio = anio
    }
}
