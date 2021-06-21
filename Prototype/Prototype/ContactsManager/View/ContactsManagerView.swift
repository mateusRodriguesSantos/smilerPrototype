//
//  ContactsManagerView.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit
import NatDS
import NatDSIcons
import TinyConstraints

class ContactsManagerView: UIView {
    
    //Contact
    lazy var contact = [Contact]()
    
    lazy var icon: NatIconButton = {
        let icon = NatIconButton(style: .standardDefault)
        icon.configure(icon: getIcon(.filledActionAdd))
        return icon
    }()
    
    //NavigationBar
    lazy var navigationBar: AppNavigationBar = {
        let navBar = AppNavigationBar(title: .text("Contatos"), leftButton: .back, rightButtons: [icon])
        return navBar
    }()
    
    var contactsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(ContactsManagerTBViewCell.self, forCellReuseIdentifier: ContactsManagerTBViewCell.identifier)
        tableView.separatorColor = NatColors.lowEmphasis
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ContactsManagerView:ViewCodable {
    func setupViewHierarchy() {
        self.addSubview(navigationBar)
        self.addSubview(contactsTableView)
    }
    
    func setupConstraints() {
        contactsTableView.topToBottom(of: navigationBar)
        contactsTableView.leadingToSuperview()
        contactsTableView.trailingToSuperview()
        contactsTableView.bottomToSuperview()
    }
    
    func setupAditionalConfiguration() {
        contactsTableView.backgroundColor = NatColors.background
        setInformationContact()
    }
}

extension ContactsManagerView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contact.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            PersistenceContacts.share.deleteContact(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            setInformationContact()
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = contactsTableView.dequeueReusableCell(withIdentifier: ContactsManagerTBViewCell.identifier, for: indexPath) as? ContactsManagerTBViewCell else{
            return UITableViewCell()
        }
        cell.setupCell(contact[indexPath.row])
        return cell
    }
}

extension ContactsManagerView {
    func setInformationContact(){
        self.contact = PersistenceContacts.share.getContacts()
        self.contactsTableView.reloadData()
    }
}
