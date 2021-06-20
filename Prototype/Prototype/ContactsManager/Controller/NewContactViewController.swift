//
//  NewContactViewController.swift
//  Smiler
//
//  Created by Mateus Augusto Moraes Ferreira on 20/06/21.
//

import Foundation
import UIKit

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
        self.viewBase.navigationBar.setLeftButtonAction({ [weak self] in
            self?.coordinator?.navigateToContactsManagerViewController()
        })
    }
}
