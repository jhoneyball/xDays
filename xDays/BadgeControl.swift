//
//  BadgeControl.swift
//  xDays
//
//  Created by James Honeyball on 03/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class BadgeControl {
    
    func updateBadgeNotifications(with updateTimes: BadgeUpdateStore,
                                  using notificationHelper: LocalNotificaitonHelperProtocol) {

        notificationHelper.clearCurrentNotifications()
        for badgeUpdateItem in updateTimes.allItems {
            let applicationBadgeNumber: Int
            let alertBody: String
    
            if badgeUpdateItem.badgeNumber == 0 {
                applicationBadgeNumber = 0 - 1
                alertBody = "0 Days To Go!"
            } else {
                applicationBadgeNumber = badgeUpdateItem.badgeNumber
                alertBody = "Only \(badgeUpdateItem.badgeNumber) Days To Go"
            }
            
            notificationHelper.addNotification(fireDate: badgeUpdateItem.notificationTime,
                                               alertBody: alertBody,
                                               alertAction: "Edit",
                                               applicationBadgeNumber: applicationBadgeNumber)
        }
        notificationHelper.printNotifications()
    }
}
