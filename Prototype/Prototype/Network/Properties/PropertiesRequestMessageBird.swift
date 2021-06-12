//
//  PropertiesRequestMessageBird.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 30/05/21.
//

import Foundation

struct PropertiesRequestMessageBird {
    
    static var endPoint:String = {
        return "https://rest.messagebird.com/messages"
    }()

    static var location:String = {
       return
        "http://www.google.com/maps/place/\(PropertiesForSMS.coordinates["Latitude"] ?? "Error"),\(PropertiesForSMS.coordinates["Longitude"] ?? "Error")"
    }()
    
    static var parametersTest:Data? = {
        return """
                              {
                                  "body" : "\(PropertiesForSMS.userMensage) - Quem Enviou: \(PropertiesForSMS.userName) - Número: \(PropertiesForSMS.userNumber) - Localização: ",
                                  "originator" : "inbox",
                                  "recipients" : ["+5561999685719","+5561983793588"]
                              }
              """.data(using: .utf8)
    }()
    
    static var parameters:Data? = {
        return """
                              {
                                  "body" : "\(PropertiesForSMS.mensage)",
                                  "originator" : "inbox",
                                  "recipients" : ["+5561999685719","+5561982115779","+5561983793588"
                                      ,"+5561996245457"
                                      ,"+5561996819685"
                                      ,"+5561996186192"
                                      ,"+5561999701307"]
                              }
              """.data(using: .utf8)
    }()
    
    static var apiKeyLive: String {
        get {
            // 1
            guard let filePath = Bundle.main.path(forResource: "API_Info", ofType: "plist") else {
                fatalError("Couldn't find file 'API_Info.plist'.")
            }
            // 2
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY_MessageBird_live") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'API_Info.plist'.")
            }
            return value
        }
    }
    
    static var apiKeyTest: String {
        get {
            // 1
            guard let filePath = Bundle.main.path(forResource: "API_Info", ofType: "plist") else {
                fatalError("Couldn't find file 'API_Info.plist'.")
            }
            // 2
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY_MessageBird_test") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'API_Info.plist'.")
            }
            return value
        }
    }
}
