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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Customize NavigationBar
        let apperance = [NSAttributedString.Key.foregroundColor : UIColor.black,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)]
        
        navigationController?.navigationBar.titleTextAttributes = apperance
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        self.navigationController?.isNavigationBarHidden = false
        
        //Check if already exists alerts
        if viewBase.tableDataSource.hours.isEmpty == false{
            //Add edit button in navBar
            let edit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(playTappedEditAction))
            navigationItem.rightBarButtonItems = [edit]
        }
    }
}

//MARK: Triggers
extension AlertsManagerViewController{
    func addTriggers() {
        self.viewBase.addHourAlert.addTarget(self, action: #selector(self.addHourToTableViewAction), for: .touchUpInside)
    }
}

//MARK: Target
extension AlertsManagerViewController{
    @objc func addHourToTableViewAction(){
        //Add edit button in navBar
        let edit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(playTappedEditAction))
        navigationItem.rightBarButtonItems = [edit]
        //Add a alert in tableView and tableView
        self.viewBase.tableDataSource.date = self.viewBase.pickerAlarmView.date.dateStringWith(strFormat: "hh:mm a")
        self.viewBase.tableView.reloadData()
    }
    
    @objc func playTappedEditAction(){
        //Transform the button that add alarm in unavailable
        viewBase.backAddHourAlert.alpha = 0.8
        viewBase.addHourAlert.isUserInteractionEnabled = false
        //Add delete button in navBar
        let delete = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(playTappedTrashAction))
        navigationItem.rightBarButtonItems = [delete]
        //Notify all observers
        ObserverDelete.share.notifyEdition()
    }
    
    @objc func playTappedTrashAction(){
        //Transform the button that add alarm in available
        viewBase.backAddHourAlert.alpha = 0.2
        viewBase.addHourAlert.isUserInteractionEnabled = true
        //Add delete button in navBar
        let edit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(playTappedEditAction))
        navigationItem.rightBarButtonItems = [edit]
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
