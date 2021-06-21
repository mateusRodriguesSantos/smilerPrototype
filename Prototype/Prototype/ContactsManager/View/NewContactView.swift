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
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = NatColors.highEmphasis
        textField.backgroundColor = NatColors.surface
        return textField
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome"
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = NatColors.highEmphasis
        textField.backgroundColor = NatColors.surface
        return textField
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
        self.addSubview(cardNewContact)
    }
    
    func setupConstraints() {
        cardNewContact.centerXToSuperview()
        cardNewContact.centerYToSuperview()
        cardNewContact.leadingToSuperview(offset: NatSpacing.small)
        cardNewContact.trailingToSuperview(offset: NatSpacing.small)
    }
    
    func setupAditionalConfiguration() {
        self.backgroundColor = NatColors.background
    }
}
