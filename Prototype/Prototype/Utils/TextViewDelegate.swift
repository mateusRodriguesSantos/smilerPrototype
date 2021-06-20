//
//  TextFieldDelegate.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 24/05/21.
//

import UIKit


class TextViewDelegate:NSObject, UITextViewDelegate{
    
    var sizeOriginView:CGFloat?
    var nameKeyUserDefault:String?
    var ownerView:UIViewController?
    var typeText:UITextView.TextBase?

    init(_ typeText:UITextView.TextBase,_ sizeOriginView:CGFloat,_ nameKeyUserDefault:String,_ ownerView:UIViewController) {
        self.sizeOriginView = sizeOriginView
        self.nameKeyUserDefault = nameKeyUserDefault
        self.ownerView = ownerView
        self.typeText = typeText
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if let text = UserDefaults.standard.value(forKey: nameKeyUserDefault ?? "Error") as? String{
            textView.text = text
            textView.alpha = 1
        }else if textView.text == UITextView.textBase(self.typeText ?? .error){
            textView.text = ""
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
            textView.text = UITextView.textBase(self.typeText ?? .error)
            textView.alpha = 0.5
        }
        
        if textView.text != UITextView.textBase(self.typeText ?? .error){
            UserDefaults.standard.setValue(textView.text, forKey: nameKeyUserDefault ?? "Error")
        }
        
        textView.resignFirstResponder()
        
        guard let menuViewController = self.ownerView as? MenuViewController else{return}
        menuViewController.constraintTopAnchorViewBase?.constant = 0
        
        UIView.animate(withDuration: 0.2) {
            menuViewController.view.layoutIfNeeded()
        }
    }
}
