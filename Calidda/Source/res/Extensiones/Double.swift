//
//  Double.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

extension Double {
    
    func convertToString(withSymbol: Bool = true) -> String {
           let numberFormatter = NumberFormatter()
           numberFormatter.numberStyle = .decimal
           numberFormatter.minimumFractionDigits = 2
           numberFormatter.maximumFractionDigits = 2
           numberFormatter.roundingMode = .down
        
           if #available(iOS 13.0, *) {
             numberFormatter.groupingSize = 3
             numberFormatter.locale = NSLocale(localeIdentifier: "en_US") as Locale
           }

           let formattedNumber = numberFormatter.string(from: NSNumber(value:self))

           var numberFinalStr = ""
           if let formatted = formattedNumber {
               numberFinalStr = formatted
           } else {
               numberFinalStr = String(format: "%.2f", self)
           }

          return "\(withSymbol ? "S/" : "") \(numberFinalStr)"
     }
    
    func convertToStringNoDecimals(withSymbol: Bool = true) -> String {
          let numberFormatter = NumberFormatter()
          numberFormatter.numberStyle           = .decimal
          numberFormatter.minimumFractionDigits = 0
          numberFormatter.maximumFractionDigits = 0
          numberFormatter.roundingMode          = .down

          let formattedNumber = numberFormatter.string(from: NSNumber(value:self))

          var numberFinalStr = ""
          if let formatted = formattedNumber {
              numberFinalStr = formatted
          } else {
              numberFinalStr = String(format: "%.2f", self)
          }

       return "\(withSymbol ? "S/" : "") \(numberFinalStr)"
    }
        
}

extension Int {
    
    func convertToStringWithNoDecimals(withSymbol: Bool = true) -> String {
           let numberFormatter = NumberFormatter()
           numberFormatter.numberStyle = .decimal
           numberFormatter.minimumFractionDigits = 0
           numberFormatter.maximumFractionDigits = 0
           numberFormatter.roundingMode = .down

           let formattedNumber = numberFormatter.string(from: NSNumber(value:self))

           var numberFinalStr = ""
           if let formatted = formattedNumber {
               numberFinalStr = formatted
           } else {
               numberFinalStr = "\(self)"
               //numberFinalStr = String(format: "%.2f", self)
           }

        return "\(withSymbol ? "S/" : "") \(numberFinalStr)"
     }
    
    
    
}
