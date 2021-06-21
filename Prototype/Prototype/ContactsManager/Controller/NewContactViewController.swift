//
//  NewContactViewController.swift
//  Smiler
//
//  Created by Mateus Augusto Moraes Ferreira on 20/06/21.
//

import Foundation
import UIKit

protocol NewContactDelegate {
    func addContact(_ contact: Contact)
    
}

class NewContactViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    let viewBase = NewContactView()
    
    override func loadView() {
        super.loadView()
        self.view = viewBase
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewBase.delegate = self
        self.viewBase.navigationBar.setLeftButtonAction({ [weak self] in
            self?.coordinator?.navigateToContactsManagerViewController()
        })
    }
}

extension NewContactViewController: NewContactDelegate {
    func addContact(_ contact: Contact) {
        let alertOk = UIAlertController(title: "Adicionado", message: "Contato adicionado com sucesso.", preferredStyle: .alert)
        let alertNot = UIAlertController(title: "Não Adicionado", message: "Contato não adicionado. Verifique os campos a serem preenchidos.", preferredStyle: .alert)
        
        if !contact.name.isEmpty && !contact.phone.isEmpty {
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alertOk.addAction(ok)
            DispatchQueue.main.async(execute: {
                self.present(alertOk, animated: true)
            })
            PersistenceContacts.share.saveContact(contact)
            PersistenceContacts.share.fetchContact()
        } else {
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alertNot.addAction(ok)
            DispatchQueue.main.async(execute: {
                self.present(alertNot, animated: true)
            })
            return
        }
    }
}
