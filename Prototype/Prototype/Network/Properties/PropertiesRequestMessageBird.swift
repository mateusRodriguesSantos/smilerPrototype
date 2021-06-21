//
//  PropertiesRequestMessageBird.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 30/05/21.
//

import Foundation

class Recipients {
    static let share = Recipients()
    
    var numbers: [String] = []

    func getNumbersContacts(_ contacts: [Contact]) -> [String] {
        for item in contacts {
            numbers.append(item.phone)
        }
        return numbers
    }
}

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
                                  "recipients" : [\(Recipients.share.getNumbersContacts(PersistenceContacts.share.getContacts()))]
                              }
              """.data(using: .utf8)
    }()
    
    static var parameters:Data? = {
        return """
                              {
                                  "body" : "\(PropertiesForSMS.mensage)",
                                  "originator" : "inbox",
                                  "recipients" : [\(Recipients.share.getNumbersContacts(PersistenceContacts.share.getContacts()))]
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
