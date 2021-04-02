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
    
    lazy var pickerDelegate:PickerDelegate = {
        let delegate = PickerDelegate()
        return delegate
    }()
    
    lazy var pickerDataSource:PickerDataSource = {
        let dataSource = PickerDataSource()
        return dataSource
    }()

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

    }
    
}
