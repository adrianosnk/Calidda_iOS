//
//  UserData.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
 
struct ResponseFacturadoDiario: Codable {
    var CuentaContrato:String!
    var FechaConsumo:String!
    var DemandaMaxima:Double!
    var HoraDemandaMaxima:Int!
    var ConsumoFacturado:Double!
    var ConsumoAnioAnterior:[ConsumoAnioAnteriors]!
}
struct ConsumoAnioAnteriors:Codable {
    var FechaConsumo:String!
    var ConsumoFacturado:Double!
}
