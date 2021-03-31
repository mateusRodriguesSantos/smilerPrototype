//
//  ExpressionView.swift
//  Prototype
//
//  Created by Mateus Augusto M Ferreira on 30/11/20.
//

import Foundation
import UIKit

class ExpressionView: UIView{
    
    //Variables
    //UI components
    
    let backgroundSettings: UIImageView = {
        let background = UIImageView(image: UIImage(named: "background"))
        background.contentMode = .scaleAspectFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    let buttonValidatePhone: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "normalButton"), for: .normal)
        button.setImage(UIImage(named: "pressedButton"), for: .selected)
        button.setImage(UIImage(named: "pressedButton"), for: .disabled)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let textInputNumber: UITextField = {
        let input = UITextField()
        input.attributedPlaceholder = NSAttributedString(string: "Número de Telefone com DDD",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        guard let text = input.text else {
            return input
        }
     
        input.text = text.applyPatternOnNumbers(pattern: "(##) #####-####", replacmentCharacter: "#")
        input.translatesAutoresizingMaskIntoConstraints = false
        input.backgroundColor = .white
        input.keyboardType = .numberPad
        input.clearButtonMode = .whileEditing
        input.borderStyle = .roundedRect
        input.font = UIFont.systemFont(ofSize: 13)
        input.textColor = .black

        return input
    }()
    
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupViews()
        
      
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExpressionView:ViewCodable{
    func setupViewHierarchy() {
        self.setupBackground()
        self.addSubview(textInputNumber)
        self.addSubview(buttonValidatePhone)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            //Bacground Settings Constraints
            backgroundSettings.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backgroundSettings.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundSettings.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundSettings.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            buttonValidatePhone.widthAnchor.constraint(equalToConstant: 300),
            buttonValidatePhone.heightAnchor.constraint(equalToConstant: 100),
            buttonValidatePhone.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            buttonValidatePhone.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            
            textInputNumber.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            textInputNumber.centerYAnchor.constraint(equalTo: buttonValidatePhone.centerYAnchor, constant: -100),
            textInputNumber.widthAnchor.constraint(equalToConstant: 300),
  
            
        ])
    }
    
    func setupBackground(){
        self.addSubview(backgroundSettings)
    }
}

