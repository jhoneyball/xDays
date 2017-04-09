//
//  DaysToGo.swift
//  xDays
//
//  Created by James Honeyball on 09/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class DaysToGo {
    var days = 0
    
    init(from fromDate: Date, to toDate: Date, with specialDays: SpecialDays) {
        days = calcDaysToGo(from: fromDate, to: toDate, with: specialDays)
    }
    
    func updateDaysToGo(from fromDate: Date, to toDate: Date, with specialDays: SpecialDays) {
        days = calcDaysToGo(from: fromDate, to: toDate, with: specialDays)
    }
    
    func calcDaysToGo(from fromDate: Date, to toDate: Date, with specialDays: SpecialDays) -> Int {
        return specialDays.daysBetween(fromDate, to: toDate)
    }

}
