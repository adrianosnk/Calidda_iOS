//
//  UserData.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

struct UserData: Codable {
    var success:Bool
    var data:UserProperties!
}
struct UserProperties:Codable {
    var email:String!
    var first_name:String!
    var last_name:String!
    var full_name:String!
    var photo:String!
    var token:String!
    
}
