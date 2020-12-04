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
        return button
    }()
    
    let textInputNumber: UITextField = {
        let input = UITextField()
        input.placeholder = "Número de Telefone com DDD"
        if let text = input.text {
            input.text = text.applyPatternOnNumbers(pattern: "(##) ###-####", replacmentCharacter: "#")
        }
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
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            //Bacground Settings Constraints
            backgroundSettings.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backgroundSettings.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundSettings.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundSettings.heightAnchor.constraint(equalTo: self.heightAnchor),
            
        ])
    }
    
    func setupBackground(){
        self.addSubview(backgroundSettings)
    }
}

