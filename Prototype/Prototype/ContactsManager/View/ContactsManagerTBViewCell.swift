//
//  ContactsManagerTBViewCell.swift
//  Smiler
//
//  Created by Mateus Augusto Moraes Ferreira on 28/05/21.
//

import Foundation
import TinyConstraints
import NatDS
import NatDSIcons

public class ContactsManagerTBViewCell: UITableViewCell {
        
    
    //MARK: Identifier
    static let identifier = "ContactsManagerTBViewCell"
    
    //MARK: Variables
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .regular)
        label.textColor = NatColors.highEmphasis
        return label
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .regular)
        label.textColor = NatColors.highEmphasis
        return label
    }()
    
    //MARK: -Initializer
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactsManagerTBViewCell: ViewCodable {
    func setupViewHierarchy() {
        self.addSubview(nameLabel)
        self.addSubview(phoneLabel)
    }
    
    func setupConstraints() {
        nameLabel.centerYToSuperview()
        nameLabel.leadingToSuperview(offset: NatSpacing.tiny)
     
        phoneLabel.centerYToSuperview()
        phoneLabel.trailingToSuperview(offset: NatSpacing.tiny)

    }
    
    func setupAditionalConfiguration() {
        self.selectionStyle = .none
        self.backgroundColor = NatColors.lowEmphasis
    }
}

extension ContactsManagerTBViewCell {
    func setupCell(_ contact: Contact){
        self.nameLabel.text = contact.name
        self.phoneLabel.text = contact.phone
    }
}
