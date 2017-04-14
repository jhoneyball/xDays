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

        let dateTarget = SimpleDate(dateTarget).date
        var badgeUpdateItem: BadgeUpdateItem

        let dayTomorrow = SimpleDate(Calendar.current.date(byAdding: .day, value: 1, to: dateToday)!).date
        var dayIterator = SimpleDate(dayTomorrow).date //Notificaiton changes begin tomorrow

        var daysToGo: DaysToGo
        var badgeNumberToShow: Int = -1
        while dayIterator <= dateTarget {
            daysToGo = DaysToGo(from: dayIterator, to: dateTarget, with: specialDays)
            if daysToGo.days != badgeNumberToShow {
                badgeNumberToShow = daysToGo.days
                badgeUpdateItem = BadgeUpdateItem(notificationTime: SimpleDate(dayIterator).date, badgeNumber: badgeNumberToShow)
                allItems.append(badgeUpdateItem)
            }
            dayIterator = Calendar.current.date(byAdding: .day, value: 1, to: dayIterator)!
        }
    }
}
