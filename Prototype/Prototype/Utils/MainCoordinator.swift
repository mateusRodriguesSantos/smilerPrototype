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
        let viewController = ShakeViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

//MARK: Functins
extension MainCoordinator{
    
    func navigateToShakeViewController(){
        let viewController = ShakeViewController()
        viewController.coordinator = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func navigateToMenuViewController(){
        let viewController = MenuViewController()
        viewController.coordinator = self
        viewController.modalPresentationStyle = .overFullScreen
//        navigationController.present(viewController, animated: true, completion: nil)
        self.navigationController.viewControllers = [viewController]
    }

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

