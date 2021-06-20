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
    private var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var accessButton: FeedbackButton = {
        let button = FeedbackButton()
        return button
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
    
    }
    
    func setupConstraints() {
        
    }
    
    func setupAditionalConfiguration() {
        
    }
}
