//
//  SettingsViewController.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - Variables
    weak var coordinator:MainCoordinator?
    let baseView = SettingsView()
    
    //MARK: - Load View
    /// Load View
    override func loadView() {
        super.loadView()
        self.view = baseView
    }

    //MARK: - View Did Load
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        addTriggers()
    }
    
}


// MARK: - Triggers
extension SettingsViewController{
    func addTriggers() {
        
        //Activate Camera
        self.baseView.buttonCam.addTarget(self, action: #selector(self.actionButtonCamera(_:)), for: .touchUpInside)
        
        //Go To Happy View Controller
        self.baseView.happyFaceButton.addTarget(self, action: #selector(goToHappyViewController(_:)), for: .touchUpInside)
    }
    
}

// MARK: - Action Buttons
extension SettingsViewController{
    @objc func actionButtonCamera(_ sender: Any) {
        
        coordinator?.navigateToCameraViewController()
    }
    
    @objc func goToHappyViewController(_ sender: Any) {
        coordinator?.navigateToHappyViewController()
    }
}
