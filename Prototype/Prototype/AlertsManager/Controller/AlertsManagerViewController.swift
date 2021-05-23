//
//  AlertsManagerViewController.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit

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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
        //Check if already exists alerts
        if viewBase.tableDataSource.hours.isEmpty == false{
            //Add edit button in navBar
            let edit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(playTappedEditAction))
            navigationItem.rightBarButtonItems = [edit]
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
        self.viewBase.addHourAlert.addTarget(self, action: #selector(self.addHourToTableViewAction), for: .touchUpInside)
    }
}

//MARK: System Alerts
extension AlertsManagerViewController{
    func alertFactory(_ title:String,_ menssage:String){
        let alert = UIAlertController(title: title, message: menssage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { alertAction in
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: Actions NavBar
extension AlertsManagerViewController{
    
    func addButtonInNavBar(_ buttonType: UIBarButtonItem.SystemItem?){
        guard let type = buttonType else { return  }
        
        if type == .edit{
            let edit = UIBarButtonItem(barButtonSystemItem: type, target: self, action: #selector(playTappedEditAction))
            navigationItem.rightBarButtonItems = [edit]
        }else{
            let edit = UIBarButtonItem(barButtonSystemItem: type, target: self, action: #selector(playTappedTrashAction))
            navigationItem.rightBarButtonItems = [edit]
        }
    }
    
    @objc func addHourToTableViewAction(){
        //Add edit button in navBar
        addButtonInNavBar(.edit)
        self.viewBase.tableDataSource.date = self.viewBase.pickerAlarmView.date.dateStringWith(strFormat: "HH:mm")
        self.viewBase.tableView.reloadData()
    }
    
    @objc func playTappedEditAction(){
        //Transform the button that add alarm in unavailable
        viewBase.backAddHourAlert.alpha = 0.8
        viewBase.addHourAlert.isUserInteractionEnabled = false
        
        //Add delete button in navBar
        addButtonInNavBar(.trash)
        
        //Notify all observers
        ObserverDelete.share.notifyEdition()
    }
    
    @objc func playTappedTrashAction(){
        //Transform the button that add alarm in available
        viewBase.backAddHourAlert.alpha = 0.2
        viewBase.addHourAlert.isUserInteractionEnabled = true
        
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
            navigationItem.rightBarButtonItems = []
        }
    }
}
