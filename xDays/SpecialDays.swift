//
//  SpecialDays.swift
//  xDays
//
//  Created by James Honeyball on 12/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation
import os.log

class SpecialDays {
    var daysToCount: DaysToCount
    var exceptionDates: ExceptionDates

    init(daysToCount: DaysToCount, exclusionDates: ExceptionDates) {
        self.daysToCount = daysToCount
        self.exceptionDates = exclusionDates
    }
    
    
    
    func countDay(day dayToCheck: Date) -> Bool {
        
        for iteratorDateItem in exceptionDates.allDateItems {
            if iteratorDateItem.getDate() == dayToCheck {
                return iteratorDateItem.getInclude()
            }
        }
        
        let weekDay = Calendar.current.component(.weekday, from: dayToCheck)
        
        switch weekDay {
        case 1 : //Sunday
            if daysToCount.countSundays() == false {
                return false
            }
            
        case 2 : //Monday
            if daysToCount.countMondays() == false {
                return false
            }
            
        case 3 : //Tuesday
            if daysToCount.countTuesdays() == false {
                return false
            }
            
        case 4 : //Wednesday
            if daysToCount.countWednesdays() == false {
                return false
            }
            
        case 5 : //thursday
            if daysToCount.countThursdays() == false {
                return false
            }
            
        case 6 : //Friday
            if daysToCount.countFridays() == false {
                return false
            }
            
        case 7 : //Saturday
            if daysToCount.countSaturdays() == false {
                return false
            }
        default:
            // something's gone very wrong
            return false
        }
        return true
    }
    
    
    func daysBetween(_ fromDate: Date, to toDate: Date) -> Int {
        
        let calendar = Calendar.current
        var day = calendar.component(.day, from: fromDate)
        var month = calendar.component(.month, from: fromDate)
        var year = calendar.component(.year, from: fromDate)
        let noTimeDateFrom = calendar.date(from: DateComponents(year: year,
                                                                month: month,
                                                                day: day))!
        day = calendar.component(.day, from: toDate)
        month = calendar.component(.month, from: toDate)
        year = calendar.component(.year, from: toDate)
        let noTimeDateTo = calendar.date(from: DateComponents(year: year,
                                                              month: month,
                                                              day: day))!
        if let daysToGo = calendar.dateComponents([.day],
                                                  from: noTimeDateFrom,
                                                  to: noTimeDateTo).day {
            if daysToGo < 0 {
                return 0
            }
        } else {
            return 0
        }
        var dateToExamine = noTimeDateFrom
        var dayCount = 0
        while dateToExamine < noTimeDateTo {
            if countDay(day: dateToExamine) {
                dayCount = dayCount + 1
            }
            dateToExamine = Calendar.current.date(byAdding: .day, value: 1, to: dateToExamine)!
        }
        return dayCount
    }

    

}
