//
//  KeyboardNotification.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 24/05/21.
//

import UIKit
import UserNotifications

enum KeyboardStates {
    case firstKeyboard
    case secondKeyboard
    case thirdKeyboard
}

protocol DelegateSetHeightView:AnyObject {
    func showKeyboardView(_ heightKeyboard:CGFloat)
    func hiddenKeyboardView(_ heightKeyboard:CGFloat)
}

class KeyboardNotification{
    
    weak var delegateKeyboard:DelegateSetHeightView?
    
    var observer:DelegateSetHeightView?
    
    var origin:CGFloat?
    
    var isShowed:Bool?
    
    init(_ observerNotification:DelegateSetHeightView) {
        isShowed = false
        observer = observerNotification
        addNotification()
    }
    
    func addNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {

            delegateKeyboard?.showKeyboardView(keyboardSize.height)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            delegateKeyboard?.hiddenKeyboardView(keyboardSize.height)
        }
    }
}
