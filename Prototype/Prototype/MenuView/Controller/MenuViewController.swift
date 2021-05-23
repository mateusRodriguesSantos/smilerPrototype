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
    
    var border = CALayer()
    
    var isInOtherView:Bool = false
    
    override func loadView() {
        super.loadView()
        self.view = viewBase
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isInOtherView = false
        let apperance = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        border = navigationController?.navigationBar.layer.addBorder(edge: .bottom, color: UIColor.black, thickness: 0.28) ?? CALayer()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "Menu"
        navigationController?.navigationBar.titleTextAttributes = apperance as [NSAttributedString.Key : Any]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .black

        let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didBecomeActiveNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        if UserDefaults.standard.value(forKey: "menssage") != nil {
            viewBase.textFieldMensagesView.alpha = 1
            viewBase.textFieldMensagesView.text = UserDefaults.standard.value(forKey: "menssage") as? String
        }
        
        
        viewBase.switchShareLocationView.isOn = UserDefaults.standard.value(forKey: "switch_location") as? Bool ?? true
        

        addTriggers()
        
        viewBase.textFieldMensagesView.delegate = self
    }
    @objc func appMovedToBackground() {
        print("App return of background!")
        coordinator?.navigateToShakeViewController()
    }
}

//MARK: UITextFielDelegate
extension MenuViewController:UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if UserDefaults.standard.value(forKey: "menssage") == nil {
            textView.text = ""
            textView.alpha = 1
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        UserDefaults.standard.setValue(textView.text, forKey: "menssage")
    }
}

//MARK: Keyboard
extension MenuViewController{
    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height * 0.2
//                navigationController?.navigationBar.topItem?.title = ""
//            }
//        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if isInOtherView == false{
//            if view.frame.origin.y != 0 {
//                self.view.frame.origin.y = 0
//                navigationController?.navigationBar.topItem?.title = "Menu"
//            }
        }
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

//MARK: Target
extension MenuViewController{
    @objc func alertViewAction(){
        isInOtherView = true
        coordinator?.navigateToAlertsViewController()
    }
    @objc func contactsViewAction(){
        isInOtherView = true
        coordinator?.navigateToContactsManagerViewController()
    }
    @objc func switchShareLocationAction(){
        UserDefaults.standard.setValue(viewBase.switchShareLocationView.isOn, forKey: "switch_location")
    }
}
