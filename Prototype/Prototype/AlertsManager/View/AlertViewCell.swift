//
//  AlertViewCell.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit

class AlertViewCell: UITableViewCell {
    
    static let reuseIdentiferCell = "AlertCell"
    
    let title:UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchActive:UISwitch = {
        let switch_ = UISwitch(frame: .zero)
        switch_.isUserInteractionEnabled = true
        switch_.translatesAutoresizingMaskIntoConstraints = false
        return switch_
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension AlertViewCell:ViewCodable {
    func setupViewHierarchy() {
        self.addSubview(title)
        self.contentView.addSubview(switchActive)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            switchActive.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            switchActive.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
