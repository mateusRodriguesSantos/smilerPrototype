//
//  APIClient.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 08/05/21.
//
import Foundation

protocol ObserverEndRequest {
    func notifyAll()
}

class APIClient {
   
    static let client = APIClient()
    
    let response = APIResponse()
    
    func execute(){
        response.execute { retorno, erro in
            NSLog("Estado -> \(retorno?.descricao as Any)")
            NSLog("Estado -> \(retorno?.situacao as Any)")
        }
    }
}
