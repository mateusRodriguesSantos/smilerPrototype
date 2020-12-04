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
    var items = [UIBarButtonItem]()
    var happyNumber =  String()
    var scareNumber = String()
    var sadNumber = String()
    
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
        items.append(baseView.cameraBarButtonItem)
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Smiler"
        navigationController?.isToolbarHidden = false
        self.toolbarItems = items
        
    }
    
}


// MARK: - Triggers
extension SettingsViewController{
    func addTriggers() {
        
        //Activate Camera
        self.baseView.cameraOptionBarButton.addTarget(self, action: #selector(actionButtonCamera(_:)), for: .touchUpInside)
        
        //Go To Happy View Controller
        self.baseView.happyFaceButton.addTarget(self, action: #selector(goToHappyViewController(_:)), for: .touchUpInside)
        
        //Go To Sad View Controller
        self.baseView.sadFaceButton.addTarget(self, action: #selector(goToSadViewController(_:)), for: .touchUpInside)
        
        //Go To Scare View Controller
        self.baseView.scareFaceButton.addTarget(self, action: #selector(goToScareViewController(_:)), for: .touchUpInside)
    }
    
}

// MARK: - Action Buttons
extension SettingsViewController{
    @objc func actionButtonCamera(_ sender: Any) {
        
        coordinator?.navigateToCameraViewController(expressionForDetection: [.fear,.smile,.sadness], numberCall: 21223923)
    }
    
    @objc func goToHappyViewController(_ sender: Any) {
        coordinator?.navigateToHappyViewController()
    }
    
    @objc func goToSadViewController(_ sender: Any) {
        coordinator?.navigateToSadViewController()
    }
    
    @objc func goToScareViewController(_ sender: Any) {
        coordinator?.navigateToScareViewController()
    }
}

extension SettingsViewController: SendHappyDataDelegate{
    func sendHappyData(_ number: String) {
        self.happyNumber = number
    }
}

extension SettingsViewController: SendSadDataDelegate{
    func sendSadData(_ number: String) {
        self.sadNumber = number
    }
}

extension SettingsViewController: SendScareDataDelegate{
    func sendScareData(_ number: String) {
        self.scareNumber = number
    }
}
