//
//  ScareViewController.swift
//  Smiler
//
//  Created by Mateus Augusto M Ferreira on 03/12/20.
//

import Foundation
import UIKit

protocol SendScareDataDelegate{
    func sendScareData(_ number: String)
}

class ScareViewController: UIViewController {
    
    //MARK: - Variables
    let baseView = ExpressionView()
    weak var coordinator: MainCoordinator?
    var delegate: SendScareDataDelegate?
    var getText = String()
    
    override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.textInputNumber.delegate = self
        addTriggers()
    }
    
    override func willMove(toParent parent: UIViewController?)
    {
        super.willMove(toParent: parent)
        if parent == nil
        {
            self.delegate?.sendScareData(self.getText)
        }
    }
    
    
}

extension ScareViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 11
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}


extension ScareViewController{
    func addTriggers() {
        self.baseView.buttonValidatePhone.addTarget(self, action: #selector(validatePhoneNumber(_:)), for: .touchUpInside)
    }
    
    @objc func validatePhoneNumber(_ sender: Any) {
        guard let text = self.baseView.textInputNumber.text else {
            print(Error.self)
            return
        }
        self.getText = text
    }
}


