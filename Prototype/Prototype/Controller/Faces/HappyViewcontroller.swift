//
//  File.swift
//  Prototype
//
//  Created by Mateus Augusto M Ferreira on 30/11/20.
//

import Foundation
import UIKit

class HappyViewController: UIViewController {
    
    
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
