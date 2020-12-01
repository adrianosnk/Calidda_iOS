//
//  UserData.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
 
struct ResponseEventDetailData: Codable {
    var Id:String!
    var Titulo:String!
    var FechaInicioVigencia:String!
    var IdTipoEvento:String!
    var Contenido:String!
    var Resumen:String!
    var Imagenes:[ImagenesDetail]!
}
struct ImagenesDetail:Codable {
    var RutaImagen:String!
    var EsPortada:Double!
}
