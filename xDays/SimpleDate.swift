//
//  SimpleDate.swift
//  xDays
//
//  Created by James Honeyball on 27/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//
import Foundation
class SimpleDate: Equatable {
    
    let day: Int
    let month: Month
    let year: Int
    let asString: String
    let date: Date

    enum Month: Int {
        case jan = 1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
    }

    init (_ inputDate: Date) {
        let calendar = Calendar.current
        self.day = calendar.component(.day, from: inputDate)
        self.month = Month(rawValue: calendar.component(.month, from: inputDate))!
        self.year = calendar.component(.year, from: inputDate)
        self.date = calendar.date(from: DateComponents(year: year,
                                                       month: month.rawValue,
                                                       day: day))!
        let myFormatter = DateFormatter()
        myFormatter.dateStyle = .medium
        self.asString = myFormatter.string(from: self.date)
    }
    
    convenience init? (day: Int, month: Int, year: Int) {
        if month > 0 && month <= 12 {
            self.init(day: day, month: Month(rawValue: month)!, year: year)
        } else {
            return nil
        }
    }
    
    init? (day: Int, month: Month, year: Int) {
        self.day = day
        self.month = month
        self.year = year
        
        
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month.rawValue
        dateComponents.year = year

        let myCalandar = Calendar.current
        
        guard let tempDate = myCalandar.date(from: dateComponents) else {
            return nil
        }
        self.date = tempDate
        let myFormatter = DateFormatter()
        myFormatter.dateStyle = .medium
        self.asString = myFormatter.string(from: self.date)
    }
    
    static func == (lhs: SimpleDate, rhs: SimpleDate) -> Bool {
        return
            lhs.day == rhs.day &&
            lhs.month == rhs.month &&
            lhs.year == rhs.year
    }
}
