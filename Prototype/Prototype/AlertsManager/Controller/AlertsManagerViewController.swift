//
//  AlertsManagerViewController.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit

class AlertsManagerViewController: UIViewController {
    
    weak var coordinator:MainCoordinator?
    
    let viewBase = AlertsView()
    
    override func loadView() {
        super.loadView()
        self.view = viewBase
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
