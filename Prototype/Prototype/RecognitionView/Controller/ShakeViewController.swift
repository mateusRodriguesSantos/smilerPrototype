//
//  ViewController.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit
import Foundation
import Vision
import AVFoundation

class ShakeViewController: UIViewController{

    weak var coordinator:MainCoordinator?

    let baseView = ShakeView()

    override func loadView() {
        super.loadView()
        self.view = baseView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let apperance = [NSAttributedString.Key.foregroundColor : UIColor.black,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)]
        
        navigationController?.navigationBar.titleTextAttributes = apperance
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.view.backgroundColor = .clear
        
        self.navigationController?.isNavigationBarHidden = false
        
        let setUp = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(playTapped))

        navigationItem.rightBarButtonItems = [setUp]
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            APIClient.client.execute()
        }
    }
}

//MARK: Action
extension ShakeViewController{
    @objc func playTapped(){
        coordinator?.navigateToMenuViewController()
    }
}
