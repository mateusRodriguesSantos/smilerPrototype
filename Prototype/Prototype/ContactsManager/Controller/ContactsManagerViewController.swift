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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
