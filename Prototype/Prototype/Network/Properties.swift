//
//  Propertys.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 08/05/21.
//

import Foundation

struct Properties {
    
    static var path:String = {
        return "https://api.smsdev.com.br/v1/send"
    }()
    
    func getApiKey() -> String{
        return "?key=\(apiKey)"
    }
    
    static var param:[String:Any] =
        [
         "type":"&type=9",
         "number":"&number=61982115779",
         "msg":"&msg= Oi professor Lindo, estamos testando o envio de sms pelo acelerometro do iPhone. Se essa mensagem chegou, saiba que ela está funcionando. Desculpe por ontem 🥰 😍  - Grupo do Mineirinho",
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
