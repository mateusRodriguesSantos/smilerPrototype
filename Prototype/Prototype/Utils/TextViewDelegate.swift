//
//  TextFieldDelegate.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 24/05/21.
//

import UIKit

enum TextBase{
    case name
    case number
    case menssage
    case error
}

class TextViewDelegate:NSObject, UITextViewDelegate{
    
    var sizeOriginView:CGFloat?
    var nameKeyUserDefault:String?
    var ownerView:UIViewController?
    var typeText:TextBase?

    init(_ typeText:TextBase,_ sizeOriginView:CGFloat,_ nameKeyUserDefault:String,_ ownerView:UIViewController) {
        self.sizeOriginView = sizeOriginView
        self.nameKeyUserDefault = nameKeyUserDefault
        self.ownerView = ownerView
        self.typeText = typeText
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if UserDefaults.standard.value(forKey: nameKeyUserDefault ?? "Error") != nil {
            guard let textValue = UserDefaults.standard.value(forKey: nameKeyUserDefault ?? "Error") as? String else{return}
            textView.text = textValue
            textView.alpha = 1
        }else{
            textView.text = ""
            textView.alpha = 1
        }
        
        guard let menuViewController = self.ownerView as? MenuViewController else{return}
        menuViewController.constraintTopAnchorViewBase?.constant = self.sizeOriginView ?? 0
        
        UIView.animate(withDuration: 0.5) {
            menuViewController.view.layoutIfNeeded()
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text.isEmpty{
            textView.text = textBase(self.typeText ?? .error)
            textView.alpha = 0.2
        }
        
        if textView.text != textBase(self.typeText ?? .error){
            UserDefaults.standard.setValue(textView.text, forKey: nameKeyUserDefault ?? "Error")
        }
        
        textView.resignFirstResponder()
        
        guard let menuViewController = self.ownerView as? MenuViewController else{return}
        menuViewController.constraintTopAnchorViewBase?.constant = 0
        
        UIView.animate(withDuration: 0.2) {
            menuViewController.view.layoutIfNeeded()
        }
    }
    
    func textBase(_ typeText:TextBase) -> String{
        switch typeText {
        case .name:
            return "Seu nome"
        case .number:
            return "Seu número com DDD"
        case .menssage:
            return "Digite uma mensagem de emergência"
        case .error:
            return "Error"
        }
    }
}
