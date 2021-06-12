//
//  PropertiesForSMS.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 08/06/21.
//

import Foundation

struct PropertiesForSMS {
    static var coordinates:[String:String] = ["Latitude":"","Longitude":""]
    static var userMensage:String = ""
    static var userName:String = ""
    static var userNumber:String = ""
    static var number:String = ""
    static var numbers:[String:String] = [:]
    
    static var mensage:String = {
        var text = ""
        text.append(userMensage)
        text.append(" ")
        text.append("Mensagem Enviada por: ")
        text.append(userName)
        text.append(" ")
        text.append("Número: ")
        text.append(userNumber)
        text.append(" ")
        text.append("Localização:")
        text.append("https://maps.google.com/?ll=\(coordinates["Latitude"] ?? "Error"),\(coordinates["Longitude"] ?? "Error")")
        return text
    }()
}
