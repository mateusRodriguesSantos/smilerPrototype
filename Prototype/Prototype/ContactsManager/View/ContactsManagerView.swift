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

    //NavigationBar
    public var navigationBar: AppNavigationBar = {
        let icon = NatIconButton(style: .standardDefault)
        icon.configure(icon: getIcon(.filledActionAdd))
        let navBar = AppNavigationBar(title: .text("Contatos"), leftButton: .back, rightButtons: [icon])
        return navBar
    }()
    
    //Contacts
    private var contact: [Contact] = []
    
    //Header
    private let header: UIView = {
        let view = UIView()
        return view
    }()
    
    private let contactsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(ContactsManagerTBViewCell.self, forCellReuseIdentifier: ContactsManagerTBViewCell.identifier)
        return tableView
    }()
    
    init(){
        super.init(frame: .zero)
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
        self.addSubview(header)
        self.addSubview(contactsTableView)
    }
    
    func setupConstraints() {
        header.topToBottom(of: navigationBar)
        header.leadingToSuperview()
        header.trailingToSuperview()
        header.height(NatSizes.semiX) //height: 40
        
        contactsTableView.topToBottom(of: header)
        contactsTableView.leadingToSuperview()
        contactsTableView.trailingToSuperview()
        contactsTableView.bottomToSuperview()
    }
    
    func setupAditionalConfiguration() {
        header.backgroundColor = .red
        contactsTableView.backgroundColor = .yellow
    }
}

extension ContactsManagerView: UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PersistenceContacts.share.getContacts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = contactsTableView.dequeueReusableCell(withIdentifier: ContactsManagerTBViewCell.identifier, for: indexPath) as? ContactsManagerTBViewCell else{
            return UITableViewCell()
        }
        return cell
    }
    
    
}
