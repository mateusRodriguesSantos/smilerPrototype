//
//  APIRequest.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 08/05/21.
//

import Foundation
import Alamofire

protocol ExecuteRequestURLSession{
    func execute(completion: @escaping (ReturnSMS?,Error?) -> Void)
}

extension ExecuteRequestURLSession {
    func sendSMS(completion: @escaping (Data?,Error?) -> Void) {
        
        let type = PropertiesRequest.param["type"] as? String ?? "Error"
        let number = PropertiesRequest.param["number"] as? String ?? "Error"
        let msg = PropertiesRequest.param["msg"] as? String ?? "Error"
        let apiKey = PropertiesRequest().getApiKey()
        let urlString = "\(PropertiesRequest.path)\(apiKey)\(type)\(number)\(msg)"
        
        //1. Create URL
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded){
            //2.Create URL Session
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if error != nil {
                    completion(nil,error)
                }
                if let safeData = data {
                    completion(safeData,nil)
                }
            }
            //4. Start the task
            task.resume()
        }
    }
}

protocol ExecuteRequestAlamo{
    func execute(completion: @escaping (ReturnSMS?,Error?) -> Void)
}

extension ExecuteRequestAlamo {
    func sendSMS(completion: @escaping (Data?,Error?) -> Void) {
        
        let type = PropertiesRequest.param["type"] as? String ?? "Error"
        let number = PropertiesRequest.param["number"] as? String ?? "Error"
        let msg = PropertiesRequest.param["msg"] as? String ?? "Error"
        let apiKey = PropertiesRequest().getApiKey()
        let urlString = "\(PropertiesRequest.path)\(apiKey)\(type)\(number)\(msg)"
        
        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded){
            AF.request(url, method: .post).response { response in
                
                if response.error != nil {
                    completion(nil,response.error)
                    AF.cancelAllRequests()
                }
                if let data = response.data {
                    completion(data,nil)
                    AF.cancelAllRequests()
                }
            }
        }
    }
}


