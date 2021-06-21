//
//  AlertsManagerViewController.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit
import NatDSIcons

class AlertsManagerViewController: UIViewController{
    ///MainCoordinator
    weak var coordinator:MainCoordinator?
    ///ViewBase
    let viewBase = AlertsView()
    
    override func loadView() {
        super.loadView()
        self.view = viewBase
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTriggers()
        NotificationService.share.delegateEndNotification = self
        viewBase.navBar.setLeftButtonAction { [weak self] in
            self?.coordinator?.navigateToMenuViewController()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        //Check if already exists alerts
        if viewBase.tableDataSource.hours.isEmpty == false{
            viewBase.icon.isHidden = false
            //Add edit button in navBar
            viewBase.icon.configure { [weak self] in
                self?.playTappedEditAction()
            }
        }else{
            viewBase.icon.isHidden = true
        }
    }
}

//MARK: DelegateEndNotification
extension AlertsManagerViewController:DelegateEndNotification{
    func notificationPresented() {
        self.viewBase.tableView.reloadData()
    }
}

//MARK: Triggers
extension AlertsManagerViewController{
    func addTriggers() {
        self.viewBase.addHourAlertButton.addTarget(self, action: #selector(self.addHourToTableViewAction), for: .touchUpInside)
    }
}

//MARK: Actions NavBar
extension AlertsManagerViewController{
    
    func addButtonInNavBar(_ buttonType: UIBarButtonItem.SystemItem?){
        guard let type = buttonType else { return  }
        
        if type == .edit{
            viewBase.icon.configure { [weak self] in
                self?.playTappedEditAction()
            }
        }else if type == .trash{
            viewBase.icon.configure { [weak self] in
                self?.playTappedTrashAction()
            }
        }
    }
    
    @objc func addHourToTableViewAction(){
        //Add edit button in navBar
        viewBase.icon.isHidden = false
        viewBase.icon.configure(icon: getIcon(.outlinedActionEdit))
        addButtonInNavBar(.edit)
        self.viewBase.tableDataSource.date = self.viewBase.pickerAlarmView.date.dateStringWith(strFormat: "HH:mm")
        self.viewBase.tableView.reloadData()
    }
    
    func playTappedEditAction(){
        //Transform the button that add alarm in unavailable
        viewBase.backAddHourAlert.alpha = 0.8
        viewBase.addHourAlertButton.isUserInteractionEnabled = false
        
        viewBase.icon.configure(icon: getIcon(.filledActionDelete))
        
        //Add delete button in navBar
        addButtonInNavBar(.trash)
        
        //Notify all observers
        ObserverDelete.share.notifyEdition()
    }
    
    func playTappedTrashAction(){
        //Transform the button that add alarm in available
        viewBase.backAddHourAlert.alpha = 0.2
        viewBase.addHourAlertButton.isUserInteractionEnabled = true
        
        viewBase.icon.configure(icon: getIcon(.outlinedActionEdit))
        
        //Add delete button in navBar
        addButtonInNavBar(.edit)
        
        //Delete the choice alerts for drop
        let reverse = self.viewBase.tableView.visibleCells.reversed()
        reverse.forEach { cell in
            guard let cell = cell as? AlertViewCell else{return}
            if cell.isForDropping ?? false{
                self.viewBase.tableDataSource.deleteAlert(cell.id_tableView ?? -1)
            }
        }
        
        //Notify all observers and remove all observers from list observers
        ObserverDelete.share.notifyDeletion()
        ObserverDelete.share.dropAllObservers()
        
        //Reload tableView
        self.viewBase.tableView.reloadData()
        //Remove buttons if all alarms is deleted
        if self.viewBase.tableDataSource.hours.isEmpty{
            viewBase.icon.isHidden = true
        }
    }
}
