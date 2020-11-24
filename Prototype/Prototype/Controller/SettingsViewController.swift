//
//  SettingsViewController.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit

class SettingsViewController: UIViewController {
    
    weak var coordinator:MainCoordinator?
    
    let baseView = SettingsView()
    
    override func loadView() {
        super.loadView()
        self.view = baseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTriggers()
        // Do any additional setup after loading the view.
    }
    
}


// MARK: - Triggers
extension SettingsViewController{
    func addTriggers() {
        self.baseView.buttonCam.addTarget(self, action: #selector(self.actionButtonCamera(_:)), for: .touchUpInside)
    }
    
}

// MARK: - Action Buttons
extension SettingsViewController{
    @objc func actionButtonCamera(_ sender: Any) {
        coordinator?.navigateToCameraViewController()
    }
}
