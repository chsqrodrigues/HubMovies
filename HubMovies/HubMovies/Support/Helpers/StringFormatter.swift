//
//  File.swift
//  POCDaycoval
//
//  Created by Daycoval on 24/01/17.
//  Copyright © 2017 DEV. All rights reserved.
//

import Foundation

public class StringFormatter {
    public static func stringToDate(_ date: String) -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        
        // Format 1
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let parsedDate = formatter.date(from: date) {
            return parsedDate
        }
        
        // Format 2
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SSSZ"
        if let parsedDate = formatter.date(from: date) {
            return parsedDate
        }
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:SS"
        if let parsedDate = formatter.date(from: date) {
            return parsedDate
        }
        
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss.SSS"
        if let parsedDate = formatter.date(from: date) {
            return parsedDate
        }
        
        formatter.dateFormat = "dd/MM/yyyy"
        if let parsedDate = formatter.date(from: date) {
            return parsedDate
        }
        
        // Couldn't parsed with any format. Just get the date
        let splitedDate = date.components(separatedBy: "T")
        if splitedDate.count > 0 {
            formatter.dateFormat = "yyyy-MM-dd"
            if let parsedDate = formatter.date(from: splitedDate[0]) {
                return parsedDate
            }
        }
        
        // Nothing worked!
        return Date()
    }
    
    public static func formatDateToJsonString(_ value: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        return formatter.string(from: value)
    }
    
    public static func formatDateToStringFormatFull(_ value: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:SS"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        return formatter.string(from: value)
    }
    
    public static func formatDateToString(_ value: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        return formatter.string(from: value)
    }
    
    public static func formatHourToString(_ value: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        
        return formatter.string(from: value)
    }
    
    public static func formatFloatToCurrencyString(_ value: Float) -> String {
        
        var ret: String = ""
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencySymbol = "\(formatter.currencySymbol.replacingOccurrences(of: " ", with: "")) "
        if let value = formatter.string(from: value as NSNumber) {
            ret = value
        }
        return ret
    }
    
    public static func formatDoubleToCurrencyStringWithoutSimbol(_ value: Float) -> String {
        
        var ret: String = ""
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.locale = Locale(identifier: "pt_BR")
        if let value = formatter.string(from: value as NSNumber) {
           ret = value
        }

        return ret
    }
}
