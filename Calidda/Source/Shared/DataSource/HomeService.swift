//
//  HomeService.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

class HomeService:AuthenticationService {
    
    func getUser() -> UserData {
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.data(forKey: "users")
        let data = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Data
        let userData = try! JSONDecoder().decode(UserData.self, from: data)
        return userData
    }
    func getDoctorInfo() -> DoctorInfo {
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.data(forKey: "KeyDoctor")
        let data = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Data
        let doctorInfo = try! JSONDecoder().decode(DoctorInfo.self, from: data)
        return doctorInfo
    }
    
    func getInfoDoctor(_ token:String,_ completionHandler: @escaping (_ result: DoctorInfo?, _ error: Error?) -> Void){
        
        var request = createConnection(endPoint: "/pro/doctor")
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
            let userData = try! JSONDecoder().decode(DoctorInfo.self, from: data)
            
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: data)
            UserDefaults.standard.set(encodedData, forKey: "KeyDoctor")
            UserDefaults.standard.synchronize()
            completionHandler(userData,nil)
            
            print(String(data: data, encoding: .utf8)!)
        }
        
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
