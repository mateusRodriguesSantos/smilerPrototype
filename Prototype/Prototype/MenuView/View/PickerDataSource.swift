//
//  PickerDataSource.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 01/04/21.
//

import UIKit

class PickerDataSource:NSObject,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
}
