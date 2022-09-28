//
//  DateCalculater.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/28.
//

import Foundation
import SwiftUI

class DateCalculater {
    
    static func compareAB(A: String, B: String) -> Int {
        let a = changeStrToDate(str: A)
        let b = changeStrToDate(str: B)
        
        let result = Calendar.current.dateComponents([.day], from: a, to: b).day
        return result!
        
    }
    
    static func compareToday(A: String) -> Int {
        let a = changeStrToDate(str: A)
        let result = Calendar.current.dateComponents([.day], from: Date(), to: a).day
        return result!
    }
    
    static func changeStrToDate(str: String) -> Date{
        let tmp = str.components(separatedBy: "/").map { (value: String) -> Int in
            return Int(value)!
        }
        let date = DateComponents(year: tmp[0], month: tmp[1], day: tmp[2])
        return Calendar.current.date(from: date)!
    }
    
    static func calExpireDate(days: Int) -> Date{
        let today = Date()
        let date = Calendar.current.date(byAdding: .day, value: days, to: today)
        return date!
    }
    
    static func changeDateToStr(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM/dd"
        return dateFormatter.string(from: date)
    }
    
    static func ingredientColor(days: Int) -> Color{
        var returnColor = Color.appGreen
        if days < 0 {
            returnColor = Color.appRed
        }else if days < 7 {
            returnColor = Color.appOrange
        }
        return returnColor
    }
    
}
