//
//  UserData.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
 
struct ResponseEventData: Codable {
    var Id:String!
    var Titulo:String!
    var FechaInicioVigencia:String!
    var IdTipoEvento:String!
    var Resumen:String!
    var RutaImagen:String!
    var SeguirPaginanado:Bool!
}
