//
//  UITextView.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 19/06/21.
//

import UIKit

extension UITextView: UITextViewDelegate{
    
    enum TextBase{
        case name
        case number
        case menssage
        case error
    }
    
    static func textBase(_ typeText:TextBase) -> String{
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
