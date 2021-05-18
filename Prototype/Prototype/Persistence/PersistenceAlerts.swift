//
//  PersistenceAlerts.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 18/05/21.
//

import Foundation
import RealmSwift

class PersistenceAlerts{
    
    private var alerts:Results<Alert>?
    
    func getAlerts() -> [Alert]{
        fetchAlert()
        return alerts?.toArray(ofType: Alert.self) ?? []
    }
    
    init() {
        alerts = nil
    }
    
    func saveAlert(_ object:Alert){
        do {
            try Persistence.realm?.write{
                Persistence.realm?.add(object)
            }
        } catch {
            NSLog("Error in save Alert")
        }
    }
    
    func fetchAlert(){
        alerts = Persistence.realm?.objects(Alert.self)
    }
    
    func updateAlert(_ index:Int,_ newObject:Alert){
        do {
            try Persistence.realm?.write{
                let alert = alerts?[index]
                alert?.date = newObject.date
                alert?.isEnable = newObject.isEnable
            }
        } catch {
            NSLog("Error in Update")
        }
    }
    
    func deleteAlert(_ index:Int){
        fetchAlert()
        do {
            try Persistence.realm?.write{
                if let alert = alerts?[index] {
                    Persistence.realm?.delete(alert)
                }
            }
        } catch {
            NSLog("Error in Update")
        }
    }
    
    func deleteAllAlert(){
        fetchAlert()
        alerts?.forEach({ alert in
            do {
                try Persistence.realm?.write{
                    Persistence.realm?.delete(alert)
                }
            } catch {
                NSLog("Error in Delete All")
            }
        })
    }
}
