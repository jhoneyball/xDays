//
//  DaysToCount.swift
//  xDays
//
//  Created by James Honeyball on 19/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class DaysToCount: NSObject, NSCoding {
    private var countMondaysBool: Bool
    private var countTuesdaysBool: Bool
    private var countWednesdaysBool: Bool
    private var countThursdaysBool: Bool
    private var countFridaysBool: Bool
    private var countSaturdaysBool: Bool
    private var countSundaysBool: Bool
    
    //MARK: Types
    struct PropertyKey {
        static let countMondays = "countMondays"
        static let countTuesdays = "countTuesdays"
        static let countWednesdays = "countWednesdays"
        static let countThursdays = "countThursdays"
        static let countFridays = "countFridays"
        static let countSaturdays = "countSaturdays"
        static let countSundays = "countSundays"
    }
    
    func countMondays() -> Bool {return countMondaysBool}
    func countTuesdays() -> Bool {return countTuesdaysBool}
    func countWednesdays() -> Bool {return countWednesdaysBool}
    func countThursdays() -> Bool {return countThursdaysBool}
    func countFridays() -> Bool {return countFridaysBool}
    func countSaturdays() -> Bool {return countSaturdaysBool}
    func countSundays() -> Bool {return countSundaysBool}
    
    func setCountMondays(_ value: Bool) {
        countMondaysBool = value
    }
    func setCountTuesdays(_ value: Bool) {
        countTuesdaysBool = value
    }
    func setCountWednesdays(_ value: Bool) {
        countWednesdaysBool = value
    }
    func setCountThursdays(_ value: Bool) {
        countThursdaysBool = value
    }
    func setCountFridays(_ value: Bool) {
        countFridaysBool = value
    }
    func setCountSaturdays(_ value: Bool) {
        countSaturdaysBool = value
    }
    func setCountSundays(_ value: Bool) {
        countSundaysBool = value
    }

    
    func asString() -> String {
        var listOfDays = ""
        if countMondays() {listOfDays += "Mo"}
        if countTuesdays() {listOfDays += "Tu"}
        if countWednesdays() {listOfDays += "We"}
        if countThursdays() {listOfDays += "Th"}
        if countFridays() {listOfDays += "Fr"}
        if countSaturdays() {listOfDays += "Sa"}
        if countSundays() {listOfDays += "Su"}
        return listOfDays
    }
    
    
    //MARK: Initialization
    init(monday: Bool = true,
         tuesday: Bool = true,
         wednesday: Bool = true,
         thursday: Bool = true,
         friday: Bool = true,
         saturday: Bool = true,
         sunday: Bool = true) {
        countMondaysBool = monday
        countTuesdaysBool = tuesday
        countWednesdaysBool = wednesday
        countThursdaysBool = thursday
        countFridaysBool = friday
        countSaturdaysBool = saturday
        countSundaysBool = sunday
    }
    
    convenience init(includeWeekends: Bool) {
        if includeWeekends {
            self.init(monday: true, tuesday: true, wednesday: true, thursday: true, friday: true, saturday: true, sunday: true)
        } else {
            self.init(monday: true, tuesday: true, wednesday: true, thursday: true, friday: true, saturday: false, sunday: false)
        }
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(countMondays(), forKey: PropertyKey.countMondays)
        aCoder.encode(countTuesdays(), forKey: PropertyKey.countTuesdays)
        aCoder.encode(countWednesdays(), forKey: PropertyKey.countWednesdays)
        aCoder.encode(countThursdays(), forKey: PropertyKey.countThursdays)
        aCoder.encode(countFridays(), forKey: PropertyKey.countFridays)
        aCoder.encode(countSaturdays(), forKey: PropertyKey.countSaturdays)
        aCoder.encode(countSundays(), forKey: PropertyKey.countSundays)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let monday = aDecoder.decodeBool(forKey: PropertyKey.countMondays)
        let tuesday = aDecoder.decodeBool(forKey: PropertyKey.countTuesdays)
        let wednesday = aDecoder.decodeBool(forKey: PropertyKey.countWednesdays)
        let thursday = aDecoder.decodeBool(forKey: PropertyKey.countThursdays)
        let friday = aDecoder.decodeBool(forKey: PropertyKey.countFridays)
        let saturday = aDecoder.decodeBool(forKey: PropertyKey.countSaturdays)
        let sunday = aDecoder.decodeBool(forKey: PropertyKey.countSundays)
        
        // Must call designated initializer.
        self.init(monday: monday, tuesday: tuesday, wednesday: wednesday, thursday: thursday, friday: friday, saturday: saturday, sunday: sunday)
    }
}
