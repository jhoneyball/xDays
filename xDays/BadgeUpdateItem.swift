//
//  BadgeUpdateTimes.swift
//  xDays
//
//  Created by James Honeyball on 03/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

struct BadgeUpdateItem: Equatable
{

    let notificationTime: Date
    let badgeNumber: Int

    static func == (lhs: BadgeUpdateItem, rhs: BadgeUpdateItem) -> Bool {
        return
            lhs.notificationTime == rhs.notificationTime &&
                lhs.badgeNumber == rhs.badgeNumber
    }
}
