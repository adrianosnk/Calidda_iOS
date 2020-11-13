//
//  UserData.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
 

struct ResponseReferencialDiario: Codable {
    var CodigoEmr:String!
    var FechaConsumo:String!
    var Demanda:Double!
    var PresionPromedio:Double!
    var DemandaMax:Double!
    var HoraDemandaMax:Int!
}

