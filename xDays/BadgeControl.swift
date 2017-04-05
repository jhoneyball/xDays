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
    
        
        notificationHelper.ClearCurrentNotifications()

        for badgeUpdateItem in updateTimes.allItems {
            
            
            notificationHelper.addNotification(time: badgeUpdateItem.notificationTime,
                                               badge: badgeUpdateItem.badgeNumber)
        }
        
    }
}
