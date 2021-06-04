//
//  Persistence.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 18/05/21.
//

import RealmSwift

class Persistence{
    static let realm:Realm? = {
        let _realm:Realm?
        do{
            _realm = try Realm()
            return _realm
        }catch{
            NSLog("Error in create a Realm instance")
        }
        return nil
    }()
    
}
