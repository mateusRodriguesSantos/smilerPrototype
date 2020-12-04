//
//  SadViewController.swift
//  Smiler
//
//  Created by Mateus Augusto M Ferreira on 03/12/20.
//

import Foundation
import UIKit

protocol delegateSadVC:class {
    func delegateSad(_ numCell:String)
}

class SadViewController: UIViewController {
    
    weak var delegate:delegateSadVC?
    
    //MARK: - Variables
    let baseView = ExpressionView()
    weak var coordinator: MainCoordinator?
    
    override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.textInputNumber.delegate = self
        addTriggers()
    }
    
}

extension SadViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 11
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}


extension SadViewController{
    func addTriggers() {
        self.baseView.buttonValidatePhone.addTarget(self, action: #selector(validatePhoneNumber(_:)), for: .touchUpInside)
    }
    
    @objc func validatePhoneNumber(_ sender: Any) {
        delegate?.delegateSad(baseView.textInputNumber.text ?? " ")
    }
}


