//
//  loginService.swift
//  Calidda
//
//  Created by MacAdrian on 11/5/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
import Foundation


class loginService: NSObject {

    func callService(){
        var semaphore = DispatchSemaphore (value: 0)

           let parameters = "{\n    \"Cuenta\": \"15831296\",\n    \"Password\": \"123456\"\n}"
           let postData = parameters.data(using: .utf8)

           
           var request = URLRequest(url: URL(string: "https://64ef6ff3-71e0-4823-9ef8-1635d2400e38.mock.pstmn.io/api/login/clientes")!,timeoutInterval: Double.infinity)
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")

           request.httpMethod = "POST"
           request.httpBody = postData

           let task = URLSession.shared.dataTask(with: request) { data, response, error in
             guard let data = data else {
               print(String(describing: error))
               return
             }
             print(String(data: data, encoding: .utf8)!)
             semaphore.signal()
           }

           task.resume()
           semaphore.wait()
    }
   

}

