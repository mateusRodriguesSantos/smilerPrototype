//
//  APIResponse.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 08/05/21.
//

import Alamofire

class APIResponse:ExecuteRequestURLSession {
    func execute_MessageBird(completion: @escaping (ReturnSMS_MessageBird?, Error?) -> Void) {
        sendSMS_MessageBird { data, error in
            
            let decoder = JSONDecoder()
            
            do{
                let returnSMS = try decoder.decode(ReturnSMS_MessageBird.self , from: data ?? Data())
                
                NSLog("Sucesso !")
                completion(returnSMS,nil)
            }catch{
                completion(nil,error)
                NSLog("Error no decode MessageBird: \(String(describing: error))")
            }
        }
    }
    
    func execute_SMSDev(completion: @escaping (ReturnSMS_SMSDev?,Error?) -> Void) {
        sendSMS_SMSDev { data, erro in
            let decoder = JSONDecoder()
            guard let returnSMS = try? decoder.decode(ReturnSMS_SMSDev.self, from: data ?? Data()) else{
                completion(nil,erro)
                return
             }
            completion(returnSMS,nil)
        }
    }
}
