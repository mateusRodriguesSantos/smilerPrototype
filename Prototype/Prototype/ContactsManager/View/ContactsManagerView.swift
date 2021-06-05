//
//  ContactsManagerView.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit
import NatDS
import NatDSIcons

class ContactsManagerView: UIView {

    //NavigationBar
    private let navigationBar = AppNavigationBar(title: .text("Contatos"), leftButton: .back)
    
//    private let tableViewContacts: UITableView = {
//       let tableView = UITableView()
//        tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
//        return tableView
//    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ContactsManagerView:ViewCodable {
    func setupViewHierarchy() {
        self.addSubview(navigationBar)
//        self.addSubview(tableViewContacts)
    }
    
    func setupConstraints() {

    }
    
    func setupAditionalConfiguration() {
        self.backgroundColor = NatColors.background
    }
}
