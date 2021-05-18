//
//  PickerHourDataSource.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit
import Foundation

class TableHourDataSource:NSObject,UITableViewDataSource {
    let persistAlert = PersistenceAlerts()
    
    var date:String {
        didSet{
            //create a Alert object
            let alert = Alert()
            alert.date = date
            alert.isEnable = "true"
            //verify if the choice hour is available
            let result = hours.contains { alert in
                alert.date == date
            }
            if result == false{
                hours.append(alert)
                alert.id = hours.count - 1
                //save in realm
                persistAlert.saveAlert(alert)
            }
        }
    }
    
    var hours:[Alert] = []

    override init() {
        self.date = ""
        //Check if already exists hours in realm
        let alerts = persistAlert.getAlerts()
        if alerts.isEmpty == false{
            hours = alerts
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlertViewCell.reuseIdentiferCell) as? AlertViewCell else{return UITableViewCell()}
        
        //Set Up layout cell
        if  indexPath.row == 0 && hours.count <= 1{
            cell.separatorView.isHidden = true
        }else{
            cell.separatorView.isHidden = false
        }
        
        if indexPath.row == persistAlert.getAlerts().count - 1{
            cell.separatorView.isHidden = true
        }else{
            cell.separatorView.isHidden = false
        }
        
        cell.isUserInteractionEnabled = true
        cell.selectionStyle = .none
        cell.backgroundColor = .white
        
        //Get the hour object of cell
        let hour = self.hours[indexPath.row]
        
        //Set Up ids
        cell.id_tableView = indexPath.row
        cell.id_observer = ObserverDelete.share.addObserver(cell)
        
        //Set Up data
        cell.title.text = hour.date
        
        if hour.isEnable == "true"{
            cell.switchActive.isOn = true
        }else{
            cell.switchActive.isOn = false
        }
       
        cell.switchActive.addAction(UIAction(handler: {[weak self] _ in
            let state = cell.switchActive.isOn
            self?.updateAlert(cell.id_tableView ?? -1,state)
        }),for: .touchUpInside)
        
        return cell
    }
    
    func updateAlert(_ indexAlert:Int,_ switchState:Bool){
        do{
            let selectedHour = self.hours[indexAlert]
            if switchState{
                try Persistence.realm?.write{
                    selectedHour.isEnable = "true"
                }
            }else{
                try Persistence.realm?.write{
                    selectedHour.isEnable = "false"
                }
            }
        }catch{
            NSLog("Error in update alert: \(error)")
        }
    }
    
    func deleteAlert(_ id_tableView:Int){
        persistAlert.deleteAlert(id_tableView)
        self.hours.remove(at: id_tableView)
    }
}
