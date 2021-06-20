//
//  PersistenceContacts.swift
//  Smiler
//
//  Created by Mateus Augusto Moraes Ferreira on 20/06/21.
//

import Foundation
import RealmSwift

class PersistenceContacts{
    
    static let share = PersistenceContacts()
    
    private var contacts: Results<Contact>?
    
    func getContacts() -> [Contact]{
        fetchContact()
        return contacts?.toArray(ofType: Contact.self) ?? []
    }
    
    init() {
        contacts = nil
    }
    
    func saveContact(_ object: Contact){
        do {
            try Persistence.realm?.write{
                Persistence.realm?.add(object)
            }
        } catch {
            NSLog("Error in save Contact")
        }
    }
    
    func fetchContact(){
        contacts = Persistence.realm?.objects(Contact.self)
    }
    
    func updateContact(_ index:Int,_ newObject: Contact){
        do {
            try Persistence.realm?.write{
                let contact = contacts?[index]
                contact?.isEnable = newObject.isEnable
                contact?.identifier = newObject.identifier
            }
        } catch {
            NSLog("Error in Update")
        }
    }
    
    func updateContactIdentifier(_ index:Int,_ newObject: Contact,_ identifier:String){
        do {
            try Persistence.realm?.write{
                let contact = contacts?[index]
                contact?.name = newObject.name
                contact?.phone = newObject.phone
                contact?.isEnable = newObject.isEnable
                contact?.identifier = identifier
            }
        } catch {
            NSLog("Error in Update")
        }
    }
    
    func updateContactIdentifier(_ contact: Contact,_ identifier: String){
        do {
            try Persistence.realm?.write{
                contact.identifier = identifier
            }
        } catch {
            NSLog("Error in Update")
        }
    }
    
    func updateContactState(_ index: Int,_ newObject: Contact,_ state: String){
        //fetchAlert()
        do {
            try Persistence.realm?.write{
                let contact = contacts?[index]
                contact?.name = newObject.name
                contact?.phone = newObject.phone
                contact?.isEnable = newObject.isEnable
            }
        } catch {
            NSLog("Error in Update")
        }
    }
    
    func updateAlertState(_ contact: Contact,_ state:String){
        do {
            try Persistence.realm?.write{
                contact.isEnable = state
            }
        } catch {
            NSLog("Error in Update")
        }
    }
    
    func deleteContact(_ index:Int){
        fetchContact()
        do {
            try Persistence.realm?.write{
                if let contact = contacts?[index] {
                    Persistence.realm?.delete(contact)
                }
            }
        } catch {
            NSLog("Error in Update")
        }
    }
    
    func deleteAllContacts(){
        fetchContact()
        contacts?.forEach({ contact in
            do {
                try Persistence.realm?.write{
                    Persistence.realm?.delete(contact)
                }
            } catch {
                NSLog("Error in Delete All")
            }
        })
    }
}
