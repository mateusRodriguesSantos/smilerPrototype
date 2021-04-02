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
        let viewController = MenuViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

//MARK: Functins
extension MainCoordinator{
//    func navigateToCameraViewController(expressionForDetection:[facialExpressions],numberCall:String){
//        let cameraVC = CameraViewController()
//        cameraVC.coordinator = self
////        cameraVC.expressionInDetection = expressionForDetection
//        navigationController.pushViewController(cameraVC, animated: true)
//    }
    
    func navigateToAlertsViewController(){
        let viewController = AlertsManagerViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToContactsManagerViewController(){
        let viewController = ContactsManagerViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

