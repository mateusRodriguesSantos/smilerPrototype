//
//  ViewController.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit
import CoreLocation

class ShakeViewController: UIViewController{
    
    weak var coordinator:MainCoordinator?
    
    let baseView = ShakeView()
    
    let child = SpinnerViewController()
    
    override func loadView() {
        super.loadView()
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTriggers()
        LocationService.share.delegateAuthorization = self
        LocationService.share.delegateLocation = self
        LocationService.share.locationManager.startUpdatingLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        runSpinnerView()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            //Envio de mensagem para todos
            if UserDefaults.standard.value(forKey: "Mensage") != nil && UserDefaults.standard.value(forKey: "Name") != nil &&  UserDefaults.standard.value(forKey: "Number") != nil{
         
                let name = UserDefaults.standard.value(forKey: "Name") as? String
                let number = UserDefaults.standard.value(forKey: "Number") as? String
                let mensage = UserDefaults.standard.value(forKey: "Mensage") as? String
                
                guard let latitude = LocationService.share.coordinates.latitude else{return}
                guard let longitude = LocationService.share.coordinates.longitude else{return}
                
                PropertiesForSMS_SMSDev.number = number ?? "Error"
                PropertiesForSMS_SMSDev.userName = name ?? "Error"
                PropertiesForSMS_SMSDev.userNumber = number ?? "Error"
                PropertiesForSMS_SMSDev.userMensage = mensage ?? "Error"
                PropertiesForSMS_SMSDev.coordinates["Latitude"] = "\(latitude)"
                PropertiesForSMS_SMSDev.coordinates["Longitude"] = "\(longitude)"
                
                APIClient.client.execute()
                
                UIViewController.alertFactory("Aviso", "Mensagens enviadas!!!", self)
            }
        }
    }
}

//MARK: Spinner
extension ShakeViewController{
    func runSpinnerView() {
        // add the spinner view controller
        addChild(child)
        child.view.frame = view.frame
        baseView.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func removeSpinner(){
        // then remove the spinner view controller
        child.mensage.text = "Pronto"
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
//MARK: DelegateLocation
extension ShakeViewController:DelegateLocation{
    func informlocation() {
        print(LocationService.share.coordinates.latitude as Any)
        print(LocationService.share.coordinates.longitude as Any)
        removeSpinner()
    }
}

//MARK: DelegateAuthorizationLocation
extension ShakeViewController:DelegateAuthorizationLocation{
    func authorizationDeniedLocation() {
        UIViewController.alertFactory("Aviso", "Precisamos da sua localização atual, para enviar aos seus contatos de emergência. Vá em configurações e ative a localização para este app.", self)
    }
}

//MARK: Triggers
extension ShakeViewController{
    func addTriggers(){
        baseView.menuButton.addTarget(self, action: #selector(self.playTapped), for: .touchUpInside)
    }
}

//MARK: Action
extension ShakeViewController{
    @objc func playTapped(){
        coordinator?.navigateToMenuViewController()
    }
}
