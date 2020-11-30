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
    func navigateToCameraViewController(){
        let cameraVC = CameraViewController()
        cameraVC.coordinator = self
        navigationController.pushViewController(cameraVC, animated: true)
    }
    
    func navigateToHappyViewController(){
        let happyVC = HappyViewController()
        happyVC.coordinator = self
        navigationController.pushViewController(happyVC, animated: true)
    }
}

