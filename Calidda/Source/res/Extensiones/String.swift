//
//  String.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

extension String {
    var firstUppercased: String {
        return prefix(1).uppercased() + dropFirst()
    }
    var firstCapitalized: String {
        return String(prefix(1)).capitalized + dropFirst()
    }
    
    public func getDateFromString(format: String = "dd/MM/yyyy") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = .current
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        return date
    }

   
    
//    public func setTextToChange(textToChange: String, font: UIFont?, boldFont: UIFont?) -> NSMutableAttributedString {
//        guard let font = font, let boldFont = boldFont else {
//            return NSMutableAttributedString()
//        }
//        let range = self.range(of: textToChange)
//        let attributedString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font : font])
//        attributedString.bold(textToChange, boldFont: boldFont)
//        return attributedString
//    }
    
    public func formatBoldAttributeString(boldString: String, font: UIFont?, boldFont: UIFont?, boldColor: UIColor? = nil) -> NSAttributedString {
        guard let font = font, let boldFont = boldFont else {
            return NSMutableAttributedString()
        }
        
        let description = NSMutableString(string: self)
        let range : NSRange = description.range(of: boldString, options: .caseInsensitive)
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(.font, value: font, range: NSRange(location: 0, length: attributeString.length))
        if let boldColor = boldColor {
            attributeString.addAttribute(.foregroundColor, value: boldColor, range: range)
        }
        attributeString.addAttribute(.font, value: boldFont, range: range)
        return attributeString
    }

       var html2AttributedString: NSAttributedString? {
              do {
                  return try NSAttributedString(data: data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!,
                                                options: [.documentType: NSAttributedString.DocumentType.html,
                                                          .characterEncoding: String.Encoding.utf8.rawValue],
                                                documentAttributes: nil)
              } catch {
                  print("error: ", error)
                  return nil
              }
          }
          var html2String: String {
              return html2AttributedString?.string ?? ""
          }
}
