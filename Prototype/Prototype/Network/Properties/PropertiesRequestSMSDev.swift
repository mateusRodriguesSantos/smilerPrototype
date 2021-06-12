//
//  Propertys.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 08/05/21.
//

import Foundation

struct PropertiesRequestSMSDev {
    
    private var path:String = {
        return "https://api.smsdev.com.br/v1/send"
    }()
    
    private func getApiKey() -> String{
        return "?key=\(apiKey)"
    }
    
    private func getMessage() -> String{
        return "&msg=\(PropertiesForSMS.mensage)"
    }
    
    private func getAtualDate() -> String{
        let atualDate = Date.dateAtual()
        let month = atualDate.month ?? 0
        if month < 10{
            return "\(atualDate.day ?? 0)/0\(month)/\(atualDate.year ?? 0)"
        }
        return "\(atualDate.day ?? 0)/\(month)/\(atualDate.year ?? 0)"
    }
    
    private lazy var param:[String:Any] =
        [
            "type":"&type=9",
            "flash":"&flash=1",
            "number":"&number=+55\(PropertiesForSMS.number)",
            "jobdate":"&jobdate=\(self.getAtualDate())",
            "jobtime":"&jobtime=\(Date.dateAtual().hour ?? 0):\(Date.dateAtual().minute ?? 0)",
        ]
    
    static func urlString() -> String{
        var propertRequest = PropertiesRequestSMSDev()
        var endPoint = "\(propertRequest.path)"
        
        endPoint.append(propertRequest.getApiKey())
        
        propertRequest.param.forEach { key,value in
            endPoint.append(propertRequest.param[key] as? String ?? "Error")
        }
        
        endPoint.append(propertRequest.getMessage())
        return endPoint
    }

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
