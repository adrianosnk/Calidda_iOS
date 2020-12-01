//
//  UserData.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

struct ResponseResuData: Codable {
    
       var Id:String!
       var RazonSocial:String!
       var CuentaContrato:String!
       var CodigoEmr:String!
       var DemandaMesAnterior:Double!
       var DemandaActual:Double!
    
      var Recibos:[RecibosProperties]?
      var Boletines:[BoletinesProperties]?
      var Mantenimientos:[MantenimientosProperties]?
}

struct RecibosProperties:Codable {
    var Anio:Int?
    var Mes:Int?
    var VolumenFacturado:Double?
    var ImporteTotal:Double?
    var FechaVencimiento:String?
    var Estado:String?
}

struct BoletinesProperties:Codable {
    var Nombre:String?
    var Fecha:String?
    var Id:String?
    /*
    init(Nombre:String,
           Fecha:String,
           Id:String) {
          self.Nombre = Nombre
          self.Fecha = Fecha
          self.Id = Id
      }*/
}







struct MantenimientosProperties:Codable {
    var Id:String?
    var Nombre:String?
    var IdTipo:String?
    var Tipo:String?
    var FechaMantenimiento:String?
    /*
    init(Id:String,
           Nombre:String,
           IdTipo:String,
           Tipo:String,
           FechaMantenimiento:String) {
          self.Id = Id
          self.Nombre = Nombre
          self.IdTipo = IdTipo
          self.Tipo = Tipo
          self.FechaMantenimiento = FechaMantenimiento
      }*/
}
