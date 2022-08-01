//
//  DateCalculater.swift
//  Eureka
//
//  Created by 김민령 on 2022/07/28.
//

import Foundation

class DataCalculater {
    
    func compareAB(A: String, B: String) -> Int {
        let a = changeStrToDate(str: A)
        let b = changeStrToDate(str: B)
        
        let result = Calendar.current.dateComponents([.day], from: a, to: b).day
        return result!
        
    }
    
    func compareToday(A: String) -> Int {
        let a = changeStrToDate(str: A)
        let result = Calendar.current.dateComponents([.day], from: Date(), to: a).day
        return result!
    }
    
    func changeStrToDate(str: String) -> Date{
        let tmp = str.components(separatedBy: "/").map { (value: String) -> Int in
            return Int(value)!
        }
        let date = DateComponents(year: tmp[0], month: tmp[1], day: tmp[2])
        return Calendar.current.date(from: date)!
    }
}
