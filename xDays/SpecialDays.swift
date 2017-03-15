//
//  SpecialDays.swift
//  xDays
//
//  Created by James Honeyball on 12/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class SpecialDays:NSObject {
    
    
    private var countMondaysBool: Bool
    private var countTuesdaysBool: Bool
    private var countWednesdaysBool: Bool
    private var countThursdaysBool: Bool
    private var countFridaysBool: Bool
    private var countSaturdaysBool: Bool
    private var countSundaysBool: Bool

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

    var exclusionDates: DateStore

    init(monday: Bool, tuesday: Bool, wednesday: Bool, thursday: Bool, friday: Bool, saturday: Bool, sunday: Bool, datesArray: [Date]) {
        countMondaysBool = monday
        countTuesdaysBool = tuesday
        countWednesdaysBool = wednesday
        countThursdaysBool = thursday
        countFridaysBool = friday
        countSaturdaysBool = saturday
        countSundaysBool = sunday
        exclusionDates = DateStore()
    }
    
    convenience init(includeWeekends: Bool) {
        if includeWeekends {
            self.init(monday: true, tuesday: true, wednesday: true, thursday: true, friday: true, saturday: true, sunday: true, datesArray: [Date]())
        } else {
            self.init(monday: true, tuesday: true, wednesday: true, thursday: true, friday: true, saturday: false, sunday: false, datesArray: [Date]())
        }
    }
}
