//
//  Alert.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 16/05/21.
//

import Foundation
import RealmSwift

class Alert:Object{
    @objc dynamic var id:Int = 0
    @objc dynamic var date:String = ""
    @objc dynamic var isEnable:String = ""
}
