//
//  UserData.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
 
struct ResponseFacturadoMes: Codable {
    var CuentaContrato:String!
    var Mes:Int!
    var Anio:Int!
    var DemandaMaxima:Double!
    var DiaDemandaMaxima:Int!
    var ConsumoFacturado:Double!
    var ConsumoAnioAnterior:[ConsumoMesAnioAnteriors]!
}
struct ConsumoMesAnioAnteriors:Codable {
    var Mes:Int!
    var Anio:Int!
    var ConsumoFacturado:Double!
}
