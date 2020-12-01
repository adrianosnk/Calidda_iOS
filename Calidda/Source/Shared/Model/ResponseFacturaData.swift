//
//  UserData.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

struct ResponseGetFacturaData: Codable {
    var getFacturaData:[ResponseFacturaData]!
}

struct ResponseFacturaData: Codable {
    var Id:String!
    var Mes:Int!
    var Anio:Int!
    var ImporteTotal:Double!
    var FechaVencimiento:String!
    var AlertaVencimiento:Bool!
    var CuentaContrato:String!
    var IdEstado:String!
} 
