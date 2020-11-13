//
//  UIDate.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

extension Date {
    
    public var monthName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        dateFormatter.locale = Locale(identifier: "es")
        return dateFormatter.string(from: self)
    }
    
    public func getDayTextString()->String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EEEE"
           dateFormatter.locale = Locale(identifier: "es")
           return dateFormatter.string(from: self)
    }
    
    public func getDayString()->String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "dd"
           dateFormatter.locale = Locale(identifier: "es")
           return dateFormatter.string(from: self)
    }
    
    public func getMonthNameString()->String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MMMM"
           dateFormatter.locale = Locale(identifier: "es")
           return dateFormatter.string(from: self)
    }
    
    public func getYearString()->String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy"
           dateFormatter.locale = Locale(identifier: "es")
           return dateFormatter.string(from: self)
    }
    
    public func getMonthDate(adding: Bool = true) -> Date? {
        var dateComponent = DateComponents()
        dateComponent.month = adding ? 1 : -1
        return Calendar.current.date(byAdding: dateComponent, to: self)
    }

    public func getDaysNumberOfMonth() -> Int {
        let calendar = Calendar.current
        let days = calendar.range(of: .day, in: .month, for: self)
        return days?.count ?? 0
    }
    
    public func getWeeksNumberOfMonth() -> Int {
        let calendar = Calendar.current
        let days = calendar.range(of: .weekOfMonth, in: .month, for: self)
        return days?.count ?? 0
    }
    
    public func getNumberFromDate(component: Calendar.Component) -> Int {
        let calendar = Calendar.current
        return calendar.component(component, from: self)
    }
    

    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }

    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
    func getStringFromDate(format: String = "dd/MM/yyyy") -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = format
        return dateFormatterPrint.string(from: self)
    }
    
    public func subtractionOrAddingDay(number: Int, calendarComponent: Calendar.Component = .day) -> Date? {
        return Calendar.current.date(byAdding: calendarComponent, value: number, to: self)
    }
    
    func isBetween(date date1: Date?, andDate date2: Date?) -> Bool {
        guard let date1 = date1, let date2 = date2 else {
            return false
        }
        return date1.compare(self).rawValue * self.compare(date2).rawValue >= 0
    }

    public func getFirstDayOfMonthStr()-> String {
        let currentDate = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))
        
        guard let newDate = currentDate else {
            return ""
        }
        
        return newDate.getStringFromDate()
    }
    
    public func getLastDayOfMonthStr()-> String {
        let currentDate = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())
        
        guard let newDate = currentDate else {
            return ""
        }
        
        return newDate.getStringFromDate()
    }

    
    public func getCurrentDaySubstractOneDay() -> String {
       let modifiedDate = Calendar.current.date(byAdding: .day, value: -1, to: self)
       guard let currentDate = modifiedDate else {
          return self.getStringFromDate()
       }
        return currentDate.getStringFromDate()
    }
    
    func getStringFromDateFormaterAdvanced(format: String = "ddHHmm") -> String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = format
        return dateFormatterPrint.string(from: self)
    }
    
    public func monthNumberName()-> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MM"
           dateFormatter.locale = Locale(identifier: "es")
           return dateFormatter.string(from: self)
    }
    
    public func getMonthActualNameString()->String {
           let date = Date()
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MM"
           dateFormatter.locale = Locale(identifier: "es")
           return dateFormatter.string(from: date)
    }
    
    
    
    public func formatDate(date: String) -> String {
       let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

       let dateFormatter = DateFormatter()
       dateFormatter.dateStyle = .medium
       dateFormatter.timeStyle = .none
       //    dateFormatter.locale = Locale(identifier: "en_US") //uncomment if you don't want to get the system default format.

       let dateObj: Date? = dateFormatterGet.date(from: date)

       return dateFormatter.string(from: dateObj!)
    }
    

}
