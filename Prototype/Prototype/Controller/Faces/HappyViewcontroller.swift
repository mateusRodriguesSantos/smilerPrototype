//
//  File.swift
//  Prototype
//
//  Created by Mateus Augusto M Ferreira on 30/11/20.
//

import Foundation
import UIKit

class HappyViewController: UIViewController {
    
    
    //MARK: - Variables
    let baseView = ExpressionView()
    weak var coordinator: MainCoordinator?
    
    override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewDidLoad() {
        
    }
    
    
}
