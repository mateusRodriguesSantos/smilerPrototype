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
    
    var numberCall:String = ""
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
//        navigationController?.navigationBar.isHidden = true
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
        
        //Go To Sad View Controller
        self.baseView.sadFaceButton.addTarget(self, action: #selector(goToSadViewController(_:)), for: .touchUpInside)
        
        //Go To Scare View Controller
        self.baseView.scareFaceButton.addTarget(self, action: #selector(goToScareViewController(_:)), for: .touchUpInside)
    }
    
}

extension SettingsViewController:delegateSadVC{
    func delegateSad(_ numCell: String) {
        numberCall = numCell
    }
    
    
}

extension SettingsViewController:delegateScareVC{
    func delegateScare(_ numCell: String) {
        numberCall = numCell
    }
}

extension SettingsViewController:delegateHappyVC{
    func delegateHappy(_ numCell: String) {
        numberCall = numCell
    }
}

// MARK: - Action Buttons
extension SettingsViewController{
    @objc func actionButtonCamera(_ sender: Any) {
        coordinator?.navigateToCameraViewController(expressionForDetection: [.fear,.smile,.sadness], numberCall: numberCall)
    }
    
    @objc func goToHappyViewController(_ sender: Any) {
        coordinator?.navigateToHappyViewController(self)
    }
    
    @objc func goToSadViewController(_ sender: Any) {
        coordinator?.navigateToSadViewController(self)
    }
    
    @objc func goToScareViewController(_ sender: Any) {
        coordinator?.navigateToScareViewController(self)
    }
}
