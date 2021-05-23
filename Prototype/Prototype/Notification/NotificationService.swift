//
//  NotificationService.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 18/05/21.
//

import Foundation
import UserNotifications

protocol DelegateEndNotification:AnyObject{
    func notificationPresented()
}

class NotificationService:NSObject{
    
    weak var delegateEndNotification:DelegateEndNotification?
    
    //Singleton
    private override init() {}
    static let share = NotificationService()
    
    //Option that the user choice for interact with notification
    let options:UNAuthorizationOptions = [.alert,.badge,.sound]
    
    //Got the user shared notification center for your app
    let UNCurrentCenter = UNUserNotificationCenter.current()
    
    func authorizeNotification(){
        UNCurrentCenter.requestAuthorization(options: options) { granted, error in
            guard granted else{
                print("User Denied the permission to receive push")
                return
            }
            self.UNCurrentCenter.delegate = self
        }
    }
}

extension NotificationService:UNUserNotificationCenterDelegate{
    
    //Segundo plano
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
//
//        //Lista de alertas
//        let alerts = PersistenceAlerts.share.getAlerts()
//        //Atualizando alerta para uma nova data
//        let dateAtual = Date()
//        let dateTomorrow = dateAtual.dayAfter
//        let calendar = Calendar.current
//        let year = calendar.component(.year, from: dateTomorrow)
//        let day = calendar.component(.day, from: dateTomorrow)
//        let month = calendar.component(.month, from: dateTomorrow)
//
//        let identifierUsed = response.notification.request.identifier
//
//        alerts.forEach { alert in
//            if alert.identifier == identifierUsed{
//                //PersistenceAlerts.share.updateAlertState(alert, "false")
//                let dateSplit = alert.date.split(separator: ":")
//                let hourAlert = Int(String(dateSplit.first ?? "Error"))
//                let minuteAlert = Int(String(dateSplit.last ?? "Error"))
//
//                var dateComponents = DateComponents()
//                dateComponents.year = year
//                dateComponents.month = month
//                dateComponents.day = day
//                dateComponents.timeZone = TimeZone(identifier: TimeZone.current.identifier)
//                dateComponents.hour = hourAlert
//                dateComponents.minute = minuteAlert
//
//                let newIdentifier = requestDateNotification(repeatedly: false, on: dateComponents)
//                PersistenceAlerts.share.updateAlertIdentifier(alert, newIdentifier)
//                print("Amanhã - Remarcado: \(String(describing: dateComponents.hour ?? 0)):\(String(describing: dateComponents.minute ?? 0)) \(newIdentifier)" as Any)
//            }
//        }

    }
    
    //Primeiro plano
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        let options:UNNotificationPresentationOptions = [.badge,.sound]
        completionHandler(options)
        
//        //Lista de alertas
//        let alerts = PersistenceAlerts.share.getAlerts()
//        //Atualizando alerta para uma nova data
//        let dateAtual = Date()
//        let dateTomorrow = dateAtual.dayAfter
//        let calendar = Calendar.current
//        let year = calendar.component(.year, from: dateTomorrow)
//        let day = calendar.component(.day, from: dateTomorrow)
//        let month = calendar.component(.month, from: dateTomorrow)
//
//        let identifierUsed = notification.request.identifier
//
//        alerts.forEach { alert in
//            if alert.identifier == identifierUsed{
//                //PersistenceAlerts.share.updateAlertState(alert, "false")
//                let dateSplit = alert.date.split(separator: ":")
//                let hourAlert = Int(String(dateSplit.first ?? "Error"))
//                let minuteAlert = Int(String(dateSplit.last ?? "Error"))
//
//                var dateComponents = DateComponents()
//                dateComponents.year = year
//                dateComponents.month = month
//                dateComponents.day = day
//                dateComponents.timeZone = TimeZone(identifier: TimeZone.current.identifier)
//                dateComponents.hour = hourAlert
//                dateComponents.minute = minuteAlert
//
//                let newIdentifier = requestDateNotification(repeatedly: false, on: dateComponents)
//                PersistenceAlerts.share.updateAlertIdentifier(alert, newIdentifier)
//                print("Amanhã - Remarcado: \(String(describing: dateComponents.hour ?? 0)):\(String(describing: dateComponents.minute ?? 0)) \(newIdentifier)" as Any)
//            }
//        }

        
        delegateEndNotification?.notificationPresented()
    }
    
    func requestTimeNotification(repeatedly:Bool,withInterval interval:TimeInterval){
        
        //Conteúdo
        let content = UNMutableNotificationContent()
        content.title = "Estou Aqui"
        content.subtitle = "Avise seus amigos !!!"
        content.body = "Se precisar avisar alguém, abra o app e chaqualhe. Vou enviar a mensagem de emergência para os seus amigos e parentes."
        //content.sound = UNNotificationSound(named: .)
        
        //Trigger for notify after set time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: repeatedly)
        
        //Order for request
        let request = UNNotificationRequest(identifier: "tempo_alerta", content: content, trigger: trigger)
        
        self.UNCurrentCenter.add(request, withCompletionHandler: nil)
    }
    
    func requestDateNotification(repeatedly:Bool,on components:DateComponents) -> String{
        
        //Conteúdo
        let content = UNMutableNotificationContent()
        content.title = "Estou Aqui"
        content.subtitle = "Avise seus amigos !!!"
        content.body = "Se precisar avisar alguém, abra o app e chaqualhe. Vou enviar a mensagem de emergência para os seus amigos e parentes."
        content.sound = UNNotificationSound.default
        
        //Trigger for notify after set time
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: repeatedly)
        
        let notificationUUID:UUID = UUID()
        let identifier = notificationUUID.uuidString
        
        //Order for request
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        self.UNCurrentCenter.add(request, withCompletionHandler: nil)
        
        return identifier
    }
    
    func disableNotification(_ identifier:String){
        self.UNCurrentCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
}
