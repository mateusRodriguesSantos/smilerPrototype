//
//  NewContactView.swift
//  Smiler
//
//  Created by Mateus Augusto Moraes Ferreira on 20/06/21.
//

import Foundation
import TinyConstraints
import UIKit
import NatDS
import NatDSIcons


class NewContactView: UIView {
    
    //NavigationBar
    lazy var navigationBar: AppNavigationBar = {
        let navBar = AppNavigationBar(title: .text("Novo Contato"), leftButton: .back)
        return navBar
    }()
    
    lazy var cardNewContact: NatCard = {
        let view = NatCard()
        view.configure(borderRadius: true)
        view.configure(elevation: true)
        return view
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome"
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .regular)
        label.textAlignment = .left
        label.textColor = NatColors.highEmphasis
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = NatColors.highEmphasis
        textField.backgroundColor = NatColors.lowEmphasis
        textField.cornerRadius = NatSizes.micro
        textField.clipsToBounds = true
        return textField
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Telefone"
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .regular)
        label.textColor = NatColors.highEmphasis
        label.textAlignment = .left
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = NatColors.highEmphasis
        textField.backgroundColor = NatColors.lowEmphasis
        textField.cornerRadius = NatSizes.micro
        textField.clipsToBounds = true
        return textField
    }()
    
    lazy var buttonAddContact: NatButton = {
        let button = NatButton(style: .contained)
        button.backgroundColor = NatColors.success
        button.setTitleColor(NatColors.surface, for: .normal)
        button.configure(title: "Adicionar Contato")
        button.configure(icon: getIcon(.filledActionCheck), position: .left)
        return button
    }()
    
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NewContactView: ViewCodable {
    func setupViewHierarchy() {
        self.addSubview(navigationBar)
        self.cardNewContact.addSubview(nameLabel)
        self.cardNewContact.addSubview(nameTextField)
        self.cardNewContact.addSubview(phoneLabel)
        self.cardNewContact.addSubview(phoneTextField)
        self.cardNewContact.addSubview(buttonAddContact)
        self.addSubview(cardNewContact)
    }
    
    func setupConstraints() {
        cardNewContact.height(NatSizes.veryHuge)
        cardNewContact.centerXToSuperview()
        cardNewContact.centerYToSuperview()
        cardNewContact.leadingToSuperview(offset: NatSpacing.small)
        cardNewContact.trailingToSuperview(offset: NatSpacing.small)
        
        nameLabel.topToSuperview(offset: NatSpacing.tiny)
        nameLabel.leadingToSuperview(offset: NatSpacing.tiny)
        nameLabel.trailingToSuperview()
        
        nameTextField.topToBottom(of: nameLabel, offset: NatSpacing.tiny)
        nameTextField.leadingToSuperview(offset: NatSpacing.tiny)
        nameTextField.trailingToSuperview(offset: NatSpacing.tiny)
        nameTextField.height(NatSizes.semi)
        
        phoneLabel.topToBottom(of: nameTextField, offset: NatSpacing.small)
        phoneLabel.leadingToSuperview(offset: NatSpacing.tiny)
        phoneLabel.trailingToSuperview()

        phoneTextField.topToBottom(of: phoneLabel, offset: NatSpacing.tiny)
        phoneTextField.leadingToSuperview(offset: NatSpacing.tiny)
        phoneTextField.trailingToSuperview(offset: NatSpacing.tiny)
        phoneTextField.height(NatSizes.semi)

        buttonAddContact.topToBottom(of: phoneTextField, offset: NatSpacing.large)
        buttonAddContact.leadingToSuperview(offset: NatSpacing.semi)
        buttonAddContact.trailingToSuperview(offset: NatSpacing.semi)
        buttonAddContact.height(NatSizes.semiX)
    }
    
    func setupAditionalConfiguration() {
        self.backgroundColor = NatColors.background
    }
}
