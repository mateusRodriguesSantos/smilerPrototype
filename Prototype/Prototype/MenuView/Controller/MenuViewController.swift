//
//  MenuViewController.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 31/03/21.
//

import UIKit

class MenuViewController: UIViewController {
    
    weak var coordinator:MainCoordinator?
    
    let viewBase = MenuView()
    
    override func loadView() {
        super.loadView()
        self.view = viewBase
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let apperance = [NSAttributedString.Key.foregroundColor : UIColor.black,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)]
        navigationController?.navigationBar.topItem?.title = "Menu"
        navigationController?.navigationBar.titleTextAttributes = apperance
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.view.backgroundColor = .clear
        
        addTriggers()
    }
}

//MARK: Triggers
extension MenuViewController{
    func addTriggers(){
        viewBase.setUpsViewButton1.addTarget(self, action: #selector(self.alertViewAction), for: .touchUpInside)
        
        viewBase.setUpsViewButton2.addTarget(self, action: #selector(self.contactsViewAction), for: .touchUpInside)
    }
}

//MARK: Target
extension MenuViewController{
    @objc func alertViewAction(){
        coordinator?.navigateToAlertsViewController()
    }
    @objc func contactsViewAction(){
        coordinator?.navigateToContactsManagerViewController()
    }
}
