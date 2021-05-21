//
//  Date.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 04/04/21.
//

import Foundation

extension Date {
    
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
    
    static func dateAtual() -> DateComponents{
        //Atual date
        let atualDate = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: atualDate)
        let month = calendar.component(.month, from: atualDate)
        let day = calendar.component(.day, from: atualDate)
        let hour = calendar.component(.hour, from: atualDate)
        let minute = calendar.component(.minute, from: atualDate)
        
        
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.timeZone = TimeZone(identifier: TimeZone.current.identifier)
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        return dateComponents
    }
    
    static func dateAtualWithTime(_ hour:Int,_ minute:Int) -> DateComponents{
        //Atual date
        let atualDate = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: atualDate)
        let month = calendar.component(.month, from: atualDate)
        let day = calendar.component(.day, from: atualDate)
        
        
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.timeZone = TimeZone(identifier: TimeZone.current.identifier)
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        return dateComponents
    }
    
    func dateStringWith(strFormat: String) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.timeZone = Calendar.current.timeZone
           dateFormatter.locale = Calendar.current.locale
           dateFormatter.dateFormat = strFormat
           return dateFormatter.string(from: self)
       }
   }
