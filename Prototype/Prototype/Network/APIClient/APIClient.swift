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
        response.execute_MessageBird { retorno, error in
            retorno?.recipients?.items?.forEach({ item in
                print("Número: \(item.recipient ?? 0) - Status: \(item.status ?? "Error")")
            })
        }
    }
}
