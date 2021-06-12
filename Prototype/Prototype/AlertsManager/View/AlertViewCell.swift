//
//  AlertViewCell.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit

class AlertViewCell: UITableViewCell {
    
    var id_tableView:Int?
    
    var id_observer:Int = 0
    
    static let reuseIdentiferCell = "AlertCell"
    
    var isForDropping:Bool? = false
    
    var removeAlertButtonLeading:NSLayoutConstraint?
    var titleTrailing:NSLayoutConstraint?
    
    lazy var removeAlertButton:UIButton = {
        let button = UIButton(frame: .zero)
        button.isHidden = true
        button.contentMode = .scaleAspectFill
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        button.addTarget(self, action: #selector(addForDrop), for: .touchUpInside)
        button.tintColor = .systemBlue
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let hour:UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: Fonts.RobotoRegular, size: 30)
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
    
    let separatorView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.contentView.addSubview(removeAlertButton)
        self.addSubview(hour)
        self.contentView.addSubview(switchActive)
        self.addSubview(separatorView)
    }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            removeAlertButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            removeAlertButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            hour.trailingAnchor.constraint(equalTo: self.removeAlertButton.leadingAnchor, constant: 100),
            hour.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            switchActive.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            switchActive.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            separatorView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.93),
            separatorView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.01),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

extension AlertViewCell{
    @objc func addForDrop(){
        if self.isForDropping == false {
            self.isForDropping = true
            self.removeAlertButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        }else{
            self.isForDropping = false
            self.removeAlertButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        }
    }
}

extension AlertViewCell:ObserverDeleteButton {
    func notifyEdition() {
        removeAlertButton.isHidden = false
    }
    
    func notifyDeletion() {
        removeAlertButton.isHidden = true
        isForDropping = false
        removeAlertButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
    }
}
