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
        NotificationService.share.authorizeNotification()
        LocationService.share.requestAuthorization()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTriggers()
        LocationService.share.delegateAuthorization = self
        LocationService.share.delegateLocation = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        LocationService.share.locationManager.startUpdatingLocation()
        runSpinnerView()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            //Envio de mensagem para todos
            if UserDefaults.standard.value(forKey: "Mensage") != nil && UserDefaults.standard.value(forKey: "Name") != nil &&  UserDefaults.standard.value(forKey: "Number") != nil{

                setUpRequest()

                APIClient.client.execute()
                
                UIViewController.alertFactory("Aviso", "Mensagens enviadas!!!", self)
            }else{
                UIViewController.alertFactory("Aviso", "Configure os dados de envio, no Menu.", self)
            }
        }
    }
}

//MARK: Set Up Request
extension ShakeViewController{
    func setUpRequest(){
        let name = UserDefaults.standard.value(forKey: "Name") as? String
        let number = UserDefaults.standard.value(forKey: "Number") as? String
        let mensage = UserDefaults.standard.value(forKey: "Mensage") as? String
        
        guard let latitude = LocationService.share.coordinates.latitude else{return}
        guard let longitude = LocationService.share.coordinates.longitude else{return}
        
        PropertiesForSMS.number = number ?? "Error"
        PropertiesForSMS.userName = name ?? "Error"
        PropertiesForSMS.userNumber = number ?? "Error"
        PropertiesForSMS.userMensage = mensage ?? "Error"
        PropertiesForSMS.coordinates["Latitude"] = "\(latitude)"
        PropertiesForSMS.coordinates["Longitude"] = "\(longitude)"
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
//        guard let latitude = LocationService.share.coordinates.latitude else{return}
//        guard let longitude = LocationService.share.coordinates.longitude else{return}
//        print("Latitude: \(latitude) Longitude: \(longitude)")

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
