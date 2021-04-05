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
            hours.append(date)
            
        }
    }
    
    private var hours:[String] = []

    override init() {
        self.date = ""
    }
    
    @objc func addNotification(_ sender:UISwitch) {
        //Add Notification
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
        
        cell.isUserInteractionEnabled = true
        cell.selectionStyle = .none
        cell.title.text = hour
        cell.backgroundColor = .white
        cell.switchActive.addTarget(self, action: #selector(addNotification), for: .touchUpInside)
        return cell
    }
    
 
    
}
