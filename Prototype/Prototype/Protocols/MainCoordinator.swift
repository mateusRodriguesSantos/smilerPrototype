//
//  MainCoordinator.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let sessionVC = SettingsViewController()
        sessionVC.coordinator = self
        navigationController.pushViewController(sessionVC, animated: true)
    }
}

//MARK: Functins
extension MainCoordinator{
    func navigateToCameraViewController(expressionForDetection:[facialExpressions],numberCall:String){
        let cameraVC = CameraViewController()
        cameraVC.coordinator = self
        cameraVC.numberCall = numberCall
        cameraVC.expressionInDetection = expressionForDetection
        navigationController.pushViewController(cameraVC, animated: true)
    }
    
    func navigateToHappyViewController(_ settingsViewController:SettingsViewController){
        let happyVC = HappyViewController()
        happyVC.coordinator = self
        happyVC.delegate = settingsViewController
        navigationController.pushViewController(happyVC, animated: true)
    }
    
    func navigateToSadViewController(_ settingsViewController:SettingsViewController){
        let sadVC = SadViewController()
        sadVC.coordinator = self
        sadVC.delegate = settingsViewController
        navigationController.pushViewController(sadVC, animated: true)
    }
    
    func navigateToScareViewController(_ settingsViewController:SettingsViewController){
        let scareVC = ScareViewController()
        scareVC.coordinator = self
        scareVC.delegate = settingsViewController
        navigationController.pushViewController(scareVC, animated: true)
    }

}

