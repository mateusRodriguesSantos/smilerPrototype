//
//  Date.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 04/04/21.
//

import Foundation

extension Date {
    func dateStringWith(strFormat: String) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.timeZone = Calendar.current.timeZone
           dateFormatter.locale = Calendar.current.locale
           dateFormatter.dateFormat = strFormat
           return dateFormatter.string(from: self)
       }
   }
