//
//  File.swift
//  Prototype
//
//  Created by Mateus Augusto M Ferreira on 30/11/20.
//

import Foundation
import UIKit

protocol delegateHappyVC:class {
    func delegateHappy(_ numCell:String)
}


class HappyViewController: UIViewController, UINavigationControllerDelegate {
    
    weak var delegate:delegateHappyVC?
    
    //MARK: - Variables
    let baseView = ExpressionView()
    weak var coordinator: MainCoordinator?
    var delegate: SendHappyDataDelegate?
    var getText = String()
    
    override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.textInputNumber.delegate = self
        navigationController?.delegate = self
        addTriggers()
    }
    
    override func willMove(toParent parent: UIViewController?)
    {
        super.willMove(toParent: parent)
        if parent == nil
        {
            self.delegate?.sendHappyData(self.getText)
        }
    }
}



extension HappyViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 11
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}

extension HappyViewController{
    func addTriggers() {
        self.baseView.buttonValidatePhone.addTarget(self, action: #selector(validatePhoneNumber(_:)), for: .touchUpInside)
    }
    
    @objc func validatePhoneNumber(_ sender: Any) {
        
        delegate?.delegateHappy(baseView.textInputNumber.text ?? " ")
        // Create new Alert
        let dialogMessage = UIAlertController(title: "Sucesso!", message: "Número Registrado.", preferredStyle: .alert)
        
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         
        
        guard let text = self.baseView.textInputNumber.text else {
            print(Error.self)
            return
        }
        self.getText = text
        self.delegate?.sendHappyData(self.getText)
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
