//
//  UserData.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
 
struct ResponseFacDetailData: Codable {
    var IdRecibo:String!
    var Mes:Int!
    var Anio:Int!
    var ImporteTotal:Double!
    
    var FechaVencimiento:String!
    var Estado:String!
    var VolumenConsumoLectura:Double!
    var FactorCorreccionVolumen:Double!
    var VolumenFacturado:Double!
    var CategoriaTarifaria:String!
    
    var PrecioMedioGasNatural:Double!
    var CostoMedioTransporte:Double!
    var CostoFijoComercializacion:Double!
    var CostoFijoDistribucion:Double!
    var CostoVariableDistribucion:Double!
    var TotalConceptoGasNatural:Double!
    var TotalServicioTransporte:Double!
    var TotalCostoFijoDistribucion:Double!
    var TotalCostoVariableDistribucion:Double!
    var TotalCostoFijoComercializacion:Double!
    
    var OtrosConceptos:[getOtrosConceptos]!
    
    var TotalIGV:Double!
    var IdReciboPDF:String!
    }

struct getOtrosConceptos:Codable {
    var Nombre:String!
    var Total:Double!
}
