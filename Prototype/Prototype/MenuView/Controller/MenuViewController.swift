//
//  MenuViewController.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 31/03/21.
//

import UIKit

class MenuViewController: UIViewController{
    weak var coordinator:MainCoordinator?
    
    let viewBase = MenuView()
    
    var constraintTopAnchorViewBase:NSLayoutConstraint?

    lazy var textFieldDelegate1:TextFieldDelegate = {
        let delegate = TextFieldDelegate(.name,0, "Name", self)
        return delegate
    }()
    lazy var textFieldDelegate2:TextFieldDelegate = {
        let delegate = TextFieldDelegate(.number,-100, "Number", self)
        return delegate
    }()
    lazy var textFieldDelegate3:TextFieldDelegate = {
        let delegate = TextFieldDelegate(.menssage,-350, "Mensage", self)
        return delegate
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBase.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(viewBase)
        
        constraintTopAnchorViewBase = viewBase.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0)
        if let constraintTop = constraintTopAnchorViewBase{
            NSLayoutConstraint.activate([
                viewBase.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                viewBase.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                viewBase.heightAnchor.constraint(equalTo: self.view.heightAnchor),
                viewBase.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 0),
                constraintTop,
            ])
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Settings NavBar
        setUpNavBar()
        //Notification if app is on background
        let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didBecomeActiveNotification, object: nil)
        //Get UserDefault data
        userDefaultData()
        //Button Triggers
        addTriggers()
        //TextField Delegate
        viewBase.viewAcessory.delegateEndEditionKeyboard = self
        viewBase.textFieldNameView.delegate = textFieldDelegate1
        viewBase.textFieldNumberView.delegate = textFieldDelegate2
        viewBase.textFieldMensagesView.delegate = textFieldDelegate3
    }
    
}

//MARK: DelegateEndEditionKeyboard
extension MenuViewController:DelegateEndEditionKeyboard{
    func endEditionKeyboard() {
        textFieldDelegate1.textViewDidEndEditing(viewBase.textFieldNameView)
        textFieldDelegate2.textViewDidEndEditing(viewBase.textFieldNumberView)
        textFieldDelegate3.textViewDidEndEditing(viewBase.textFieldMensagesView)
    }
}

//MARK: Set Ups View
extension MenuViewController{
    func setUpNavBar(){
        let apperance = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        _ = navigationController?.navigationBar.layer.addBorder(edge: .bottom, color: UIColor.black, thickness: 0.28)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "Menu"
        navigationController?.navigationBar.titleTextAttributes = apperance as [NSAttributedString.Key : Any]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .black
    }
    
    func userDefaultData(){
        if UserDefaults.standard.value(forKey: "Name") != nil {
            viewBase.textFieldNameView.alpha = 1
            viewBase.textFieldNameView.text = UserDefaults.standard.value(forKey: "Name") as? String
        }
        if UserDefaults.standard.value(forKey: "Number") != nil {
            viewBase.textFieldNumberView.alpha = 1
            viewBase.textFieldNumberView.text = UserDefaults.standard.value(forKey: "Number") as? String
        }
        if UserDefaults.standard.value(forKey: "Mensage") != nil {
            viewBase.textFieldMensagesView.alpha = 1
            viewBase.textFieldMensagesView.text = UserDefaults.standard.value(forKey: "Mensage") as? String
        }
        
        viewBase.switchShareLocationView.isOn = UserDefaults.standard.value(forKey: "switch_location") as? Bool ?? true
    }
}

//MARK: Triggers
extension MenuViewController{
    func addTriggers(){
        viewBase.setUpsViewButton1.addTarget(self, action: #selector(self.alertViewAction), for: .touchUpInside)
        
        viewBase.setUpsViewButton2.addTarget(self, action: #selector(self.contactsViewAction), for: .touchUpInside)
        
        viewBase.switchShareLocationView.addTarget(self, action: #selector(switchShareLocationAction), for: .touchUpInside)
    }
}

//MARK: Actions
extension MenuViewController{
    @objc func alertViewAction(){
        coordinator?.navigateToAlertsViewController()
    }
    
    @objc func contactsViewAction(){
        coordinator?.navigateToContactsManagerViewController()
    }
    
    @objc func switchShareLocationAction(){
        UserDefaults.standard.setValue(viewBase.switchShareLocationView.isOn, forKey: "switch_location")
    }
    
    @objc func appMovedToBackground() {
        print("App return of background!")
        coordinator?.navigateToShakeViewController()
    }
}
