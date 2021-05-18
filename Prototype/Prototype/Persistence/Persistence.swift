//
//  Persistence.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 18/05/21.
//

import RealmSwift

class Persistence{
    static let realm:Realm? = {
        let re:Realm?
        do{
            re = try Realm()
            return re
        }catch{
            NSLog("Error in create a Realm instance")
        }
        return nil
    }()
    
}
