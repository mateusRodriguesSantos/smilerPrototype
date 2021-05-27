//
//  Propertys.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 08/05/21.
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
        return """
\(userMensage)

Mensagem Enviada por:

\(userName)

Número:
\(userNumber)




Localização: https://www.google.com/maps/search/?api=1&query=\(coordinates["Latitude"] ?? "Error"),\(coordinates["Longitude"] ?? "Error")
"""
        
    }()
}

struct PropertiesRequest {
    static var path:String = {
        return "https://api.smsdev.com.br/v1/send"
    }()
    
    func getApiKey() -> String{
        return "?key=\(apiKey)"
    }
    
    static var param:[String:Any] =
        [
         "type":"&type=9",
            "number":"&number=\(PropertiesForSMS.number)",
            "msg":"&msg=\(PropertiesForSMS.mensage)",
        ]

    private var apiKey: String {
        get {
            // 1
            guard let filePath = Bundle.main.path(forResource: "SMSDevAPI_Info", ofType: "plist") else {
                fatalError("Couldn't find file 'SMSDevAPI_Info.plist'.")
            }
            // 2
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'SMSDevAPI_Info.plist'.")
            }
            return value
        }
    }
}
