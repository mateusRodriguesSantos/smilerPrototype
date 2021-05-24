//
//  PickerHourDataSource.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit
import Foundation

class TableHourDataSource:NSObject,UITableViewDataSource {
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
                PersistenceAlerts.share.saveAlert(alert)
                //create notification
                createAlertNotification(hours.count - 1)
            }
        }
    }
    
    var hours:[Alert] = []

    override init() {
        self.date = ""
        //Check if already exists hours in realm
        let alerts = PersistenceAlerts.share.getAlerts()
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
        
        if indexPath.row == PersistenceAlerts.share.getAlerts().count - 1{
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
            if hours.isEmpty {
                createAlertNotification(cell.id_tableView ?? -1)
            }
        }else{
            cell.switchActive.isOn = false
        }
       
        cell.switchActive.addAction(UIAction(handler: {[weak self] _ in
            let state = cell.switchActive.isOn
            self?.updateAlert(cell.id_tableView ?? -1,state)

            if state{
                self?.createAlertNotification(cell.id_tableView ?? -1)
            }else{
                NotificationService.share.disableNotification(self?.hours[cell.id_tableView ?? -1].identifier ?? "Error")
            }
        }),for: .touchUpInside)
        
        return cell
    }
}

extension TableHourDataSource{
    func createAlertNotification(_ indexAlert:Int){
        //DatePicker date
        //Get Minutes and hours
        let selectedHour = self.hours[indexAlert]
        let selectedDate = selectedHour.date
        let dateSplit = selectedDate.split(separator: ":")
        let hour = String(dateSplit.first ?? "Error")
        let minute = String(dateSplit.last ?? "Error")
        
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.hour = Int(hour) ?? 0
        dateComponents.minute = Int(minute) ?? 0
        
        let identifier = NotificationService.share.requestDateNotification(repeatedly: true, on: dateComponents)
        //Save identifier
        PersistenceAlerts.share.updateAlertIdentifier(indexAlert, selectedHour, identifier)
        print("Marcado: \(String(describing: dateComponents.hour ?? 0)) Hrs :\(String(describing: dateComponents.minute ?? 0)) Min \(identifier)"as Any)
    }
    
    func updateAlert(_ indexAlert:Int,_ switchState:Bool){
        let selectedHour = self.hours[indexAlert]
        if switchState{
            PersistenceAlerts.share.updateAlertState(indexAlert, selectedHour, "true")
        }else{
            PersistenceAlerts.share.updateAlertState(indexAlert, selectedHour, "false")
        }
    }
    
    func deleteAlert(_ id_tableView:Int){
        NotificationService.share.disableNotification(self.hours[id_tableView].identifier)
        PersistenceAlerts.share.deleteAlert(id_tableView)
        self.hours.remove(at: id_tableView)
    }
}
