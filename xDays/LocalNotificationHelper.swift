//
//  LocalNotificationHelper.swift
//  xDays
//
//  Created by James Honeyball on 03/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation
import UIKit

class LocalNotificationHelper: LocalNotificaitonHelperProtocol {
    
    func addNotification(time alertDate: Date, badge xDays: Int) {
        let taskTypeId = "XDaysToGo"
        let notification = UILocalNotification()
        notification.fireDate = alertDate
        notification.alertBody = "Only \(xDays) days to go"
        notification.alertAction = "Days : \(xDays)"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["taskObjectId": taskTypeId]
        var badge: Int
        if (xDays == 0) {
            badge = -1
        } else {
            badge = xDays
        }
        
        notification.applicationIconBadgeNumber = badge
        
        UIApplication.shared.scheduleLocalNotification(notification)
        
        print("Notification set for taskTypeID: \(taskTypeId) at \(alertDate)")
    }
    
    func ClearCurrentNotifications() {
        
        // loop through the pending notifications
        for notification in UIApplication.shared.scheduledLocalNotifications! as [UILocalNotification] {
            UIApplication.shared.cancelLocalNotification(notification)
            print("Deletd notifcation")
        }
    }
    
    func checkNotificationEnabled() -> Bool {
        // Check if the user has enabled notifications for this app and return True / False
        guard let settings = UIApplication.shared.currentUserNotificationSettings else { return false}
        if settings.types == .none {
            return false
        } else {
            return true
        }
    }
    
    func checkNotificationExists(taskTypeId: String) -> Bool {
        // Loop through the pending notifications
        for notification in UIApplication.shared.scheduledLocalNotifications! as [UILocalNotification] {
            
            // Find the notification that corresponds to this task entry instance (matched by taskTypeId)
            if (notification.userInfo!["taskObjectId"] as? String == String(taskTypeId)) {
                return true
            }
        }
        return false
        
    }
    
    func scheduleLocal(taskTypeId: String, alertDate: NSDate) {
        
        let notification = UILocalNotification()
        notification.fireDate = alertDate as Date
        notification.alertBody = "Task \(taskTypeId)"
        notification.alertAction = "Due : \(alertDate)"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["taskObjectId": taskTypeId]
        
        UIApplication.shared.scheduleLocalNotification(notification)
        
        print("Notification set for taskTypeID: \(taskTypeId) at \(alertDate)")
    }
    
    func removeNotification(taskTypeId: String) {
        
        // loop through the pending notifications
        for notification in UIApplication.shared.scheduledLocalNotifications! as [UILocalNotification] {
            
            // Cancel the notification that corresponds to this task entry instance (matched by taskTypeId)
            if (notification.userInfo!["taskObjectId"] as? String == String(taskTypeId)) {
                UIApplication.shared.cancelLocalNotification(notification)
                
                print("Notification deleted for taskTypeID: \(taskTypeId)")
                
                break
            }
        }
    }
    
    func listNotifications() -> [UILocalNotification] {
        var localNotify:[UILocalNotification]?
        for notification in UIApplication.shared.scheduledLocalNotifications! as [UILocalNotification] {
            localNotify?.append(notification)
        }
        return localNotify!
    }
    
    func printNotifications() {
        
        print("List of notifications currently set:- ")
        
        for notification in UIApplication.shared.scheduledLocalNotifications! as [UILocalNotification] {
            print ("\(notification)")
        }
    }
}
