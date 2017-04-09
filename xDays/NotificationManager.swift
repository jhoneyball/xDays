//
//  NotificationManager.swift
//  xDays
//
//  Created by James Honeyball on 09/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation
import UIKit

class NotificationManager {
    func update(from fromDate: Date, to toDate: Date, with specialDays: SpecialDays) {
        
        
        let application = UIApplication.shared
        
        let settings = application.currentUserNotificationSettings
        if (settings?.types.contains(.badge) != true) {
            application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
            print("Have registered for notifcations")
        }
        
        let daysToGo = DaysToGo(from: fromDate, to: toDate, with: specialDays).days
        var badgeNumber: Int
        if (daysToGo > 0 && daysToGo < 9999) {
            badgeNumber = daysToGo
        } else {
            badgeNumber = 0
        }
        application.applicationIconBadgeNumber = badgeNumber
        
        let badgeUpdateStore = BadgeUpdateStore(today: Date(), target: toDate, with: specialDays)
        
        let badgeControl = BadgeControl()
        let notificationHelper = LocalNotificationHelper()
        
        badgeControl.updateBadgeNotifications(with: badgeUpdateStore, using: notificationHelper)
    }
    func clearAllNotifications() {
        let application = UIApplication.shared
        application.cancelAllLocalNotifications()
    }
}

