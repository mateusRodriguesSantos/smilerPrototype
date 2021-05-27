//
//  APIResponse.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 08/05/21.
//

import Alamofire

class APIResponse:ExecuteRequestAlamo {
    func execute(completion: @escaping (ReturnSMS?,Error?) -> Void) {
        sendSMS { data, erro in
            let decoder = JSONDecoder()
            guard let returnSMS = try? decoder.decode(ReturnSMS.self, from: data ?? Data()) else{
                completion(nil,erro)
                return
             }
            completion(returnSMS,nil)
        }
    }
}
