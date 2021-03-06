//
//  UserData.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit


struct ResponseUserData: Codable {
    var Id:String?
    var RazonSocial:String?
    var CuentaContrato:String?
    var TokenAcceso:String? // si este viene distinto de nil Success
    //body de error
    var IdOperacion: String?
    var Codigo:String?
    var Mensaje:String?
}
