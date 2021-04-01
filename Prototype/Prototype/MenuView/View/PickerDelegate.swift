//
//  PickerDelegates.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 01/04/21.
//

import UIKit

class PickerDelegate:NSObject,UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return "Contra Violência"
        }else{
            return "Gerenciador de acesso"
        }
    }
}

