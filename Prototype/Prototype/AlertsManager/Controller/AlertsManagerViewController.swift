//
//  AlertsManagerViewController.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit

class AlertsManagerViewController: UIViewController {
    
    weak var coordinator:MainCoordinator?
    
    let viewBase = AlertsView()
    
    override func loadView() {
        super.loadView()
        self.view = viewBase
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTriggers()
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
        self.viewBase.tableDataSource.date = self.viewBase.pickerAlarmView.date.dateStringWith(strFormat: "hh:mm a")
        self.viewBase.tableView.reloadData()
    }
}
