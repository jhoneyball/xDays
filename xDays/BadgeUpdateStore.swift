//
//  BadgeUpdateStore.swift
//  xDays
//
//  Created by James Honeyball on 03/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class BadgeUpdateStore {
    
    var allItems: [BadgeUpdateItem]
    
    
    init (today dateToday: Date, target dateTarget: Date, with specialDays: SpecialDays) {
        allItems = []
        let SecondsIn1Day: TimeInterval = 86400
        let dateTarget = SimpleDate(dateTarget).date
        var dayIterator = SimpleDate(dateTarget).date
        
        
        var badgeNumberToShow = 1
        
        while dayIterator > dateToday {
            if (SpecialDaysTools.countDay(day: dayIterator,
                                          specialDays: specialDays)) {
                
                let badgeUpdateItem = BadgeUpdateItem(notificationTime: dayIterator, badgeNumber: badgeNumberToShow)
                allItems.append(badgeUpdateItem)
            badgeNumberToShow += 1
            }
            dayIterator.addTimeInterval(0 - SecondsIn1Day)
        }
    }
    
}
