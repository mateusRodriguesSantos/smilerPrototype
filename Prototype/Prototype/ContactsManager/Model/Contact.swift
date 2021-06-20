//
//  ContactsModel.swift
//  Smiler
//
//  Created by Mateus Augusto Moraes Ferreira on 20/06/21.
//

import Foundation
import RealmSwift

class Contact: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var isEnable: String = ""
    
    ///Identifier of notification
    @objc dynamic var identifier: String = ""
}
