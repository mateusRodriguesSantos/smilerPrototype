//
//  ObserverDeleteButton.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 16/05/21.
//

import Foundation

protocol ObserverDeleteButton {
    var id_observer:Int{get set}
    
    func notifyEdition()
    func notifyDeletion()
}

struct ObserverDelete:ObserverDeleteButton{

    static var share = ObserverDelete()
    
    var id_observer:Int
    
    private var allObservers:[ObserverDeleteButton] = []
    
    private init() {
        id_observer = -1
    }
    
    mutating func addObserver(_ observer:ObserverDeleteButton) -> Int{
        allObservers.append(observer)
        
        return allObservers.count - 1 
    }
    
    mutating func dropObserver(_ id_observer:Int){
        allObservers.remove(at: id_observer)
    }
    
    mutating func dropAllObservers(){
        allObservers.removeAll()
    }
    
    func notifyEdition() {
        allObservers.forEach { observer in
            observer.notifyEdition()
        }
    }
    
    func notifyDeletion() {
        allObservers.forEach { observer in
            observer.notifyDeletion()
        }
    }
}
