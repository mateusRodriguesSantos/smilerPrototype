//
//  APIRequest.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 08/05/21.
//

import Foundation
import Alamofire

protocol ExecuteRequestURLSession{
    func execute_MessageBird(completion: @escaping (ReturnSMS_MessageBird?,Error?) -> Void)
    func execute_SMSDev(completion: @escaping (ReturnSMS_SMSDev?,Error?) -> Void)
}

extension ExecuteRequestURLSession {
    func sendSMS_SMSDev(completion: @escaping (Data?,Error?) -> Void) {
        let urlString = PropertiesRequestSMSDev.urlString()
        
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
    
    func sendSMS_MessageBird(completion: @escaping (Data?,Error?) -> Void) {
        guard let url = URL(string: PropertiesRequestMessageBird.endPoint),
              let parameters = PropertiesRequestMessageBird.parametersTest
        else{return}
 
        print(PropertiesRequestMessageBird.parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("AccessKey \(PropertiesRequestMessageBird.apiKeyTest)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = parameters

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(nil,error)
                print(error!.localizedDescription); return }
            guard let data = data else { print("Empty data"); return }

//            if let str = String(data: data, encoding: .utf8) {
//                print(str)
//            }
            completion(data,error)
        }.resume()
    }
}

protocol ExecuteRequestAlamo{
    func execute(completion: @escaping (ReturnSMS_SMSDev?,Error?) -> Void)
}

extension ExecuteRequestAlamo {
    func sendSMS(completion: @escaping (Data?,Error?) -> Void) {
        let urlString = PropertiesRequestSMSDev.urlString()
        
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


