//
//  DoctorImage.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

class CaliddaImage {
    
    enum SmartImagesIdentifier: String {
        case iconClose = "ic_close"
        case iconBackWhite = "ic_back_white"
        case iconNextBlack = "ic_next_black"
        
        
        case icon_ListaHome1 = "icon_ListaHome1"
        case icon_ListaHome2 = "icon_ListaHome2"
        case icon_ListaHome3 = "icon_ListaHome3"
        case img_atention_home = "img_atention_home-1"
        case img_schedule_home = "img_schedule_home-1"
        
        
        case iconConnection = "ic_connection"
        case iconWarning = "ic_warning"
        case iconError = "ic_error"
        
        
        case icon_ConsumoBlue = "icon_ConsumoBlue"
        
        case icon_LogoCalidda = "LogoCalidda"
        case icon_AlertaBlue = "icon_AlertaBlue"
    }
    
    
    
    static func getImage(named: SmartImagesIdentifier) -> UIImage? {
        return UIImage(named: named.rawValue, in: Bundle(identifier: "Doctor.App"), compatibleWith: .none)
    }
}
