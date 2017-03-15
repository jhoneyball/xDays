//
//  DateItem.swift
//  xDays
//
//  Created by James Honeyball on 15/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class DateItem {
    var date: Date
    var include: Bool

    init (date: Date, include: Bool) {
        self.date = date
        self.include = include
    }
    
    convenience init(random: Bool) {
        self.init(date: Date(timeIntervalSince1970: TimeInterval(1489617434)), include: false)
    }


}
