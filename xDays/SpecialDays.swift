//
//  SpecialDays.swift
//  xDays
//
//  Created by James Honeyball on 12/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class SpecialDays {
    
    
    private var countMondaysBool = true
    private var countTuesdaysBool = true
    private var countWednesdaysBool = true
    private var countThursdaysBool = true
    private var countFridaysBool = true
    private var countSaturdaysBool = true
    private var countSundaysBool = true

    func countMondays() -> Bool {return countMondaysBool}
    func countTuesdays() -> Bool {return countTuesdaysBool}
    func countWednesdays() -> Bool {return countWednesdaysBool}
    func countThursdays() -> Bool {return countThursdaysBool}
    func countFridays() -> Bool {return countFridaysBool}
    func countSaturdays() -> Bool {return countSaturdaysBool}
    func countSundays() -> Bool {return countSundaysBool}
    
    func setCountMondays(_ value: Bool) {countMondaysBool = value}
    func setCountTuesdays(_ value: Bool) {countTuesdaysBool = value}
    func setCountWednesdays(_ value: Bool) {countWednesdaysBool = value}
    func setCountThursdays(_ value: Bool) {countThursdaysBool = value}
    func setCountFridays(_ value: Bool) {countFridaysBool = value}
    func setCountSaturdays(_ value: Bool) {countSaturdaysBool = value}
    func setCountSundays(_ value: Bool) {countSundaysBool = value}

    private var exclusionDates = [Date]()


}
