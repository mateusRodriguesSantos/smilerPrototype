//
//  ContactsManagerViewController.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit

class ContactsManagerViewController: UIViewController {
    
    weak var coordinator:MainCoordinator?
    
    let viewBase = ContactsManagerView()
    
    override func loadView() {
        super.loadView()
        self.view = viewBase
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.viewBase.icon.configure{ [weak self] in
            self?.goToNewContact()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewBase.navigationBar.setLeftButtonAction({ [weak self] in
            self?.coordinator?.navigateToMenuViewController()
        })
    }
}

extension ContactsManagerViewController {
    func goToNewContact(){
        self.coordinator?.navigateToNewContactViewController()
    }
}
