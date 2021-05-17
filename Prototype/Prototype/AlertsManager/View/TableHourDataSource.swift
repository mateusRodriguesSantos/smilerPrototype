//
//  PickerHourDataSource.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit
import Foundation

class TableHourDataSource:NSObject,UITableViewDataSource {
    
//    var date:String {
////        didSet{
////            let alert = Alert(date: date, isEnable: true)
////            hours.append(alert)
////            
////        }
//    }
    
    var hours:[Alert] = []

    override init() {
        //self.date = ""
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hours.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlertViewCell.reuseIdentiferCell) as? AlertViewCell else{return UITableViewCell()}
        
        let hour = self.hours[indexPath.row]
        cell.id_tableView = indexPath.row
        
        cell.id_observer = ObserverDelete.share.addObserver(cell)
        
        cell.isUserInteractionEnabled = true
        cell.selectionStyle = .none
        cell.title.text = hour.date
        cell.backgroundColor = .white
        cell.switchActive.isOn = hour.isEnable ?? false
        
        cell.switchActive.addAction(UIAction(handler: {_ in
            let state = cell.switchActive.isOn
            self.hours[cell.id_tableView ?? -1].isEnable = state
        }), for: .touchUpInside)
        
     
        return cell
    }
    
    func deleteAlert(_ id_tableView:Int){
        self.hours.remove(at: id_tableView)
    }
}
