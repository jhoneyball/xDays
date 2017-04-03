//
//  SimpleDate.swift
//  xDays
//
//  Created by James Honeyball on 27/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//
import Foundation
class SimpleDate {
    
    let day: Int
    let month: Int
    let year: Int
    let asString: String
    let date: Date
    
    init (_ inputDate: Date) {
        let calendar = Calendar.current
        self.day = calendar.component(.day, from: inputDate)
        self.month = calendar.component(.month, from: inputDate)
        self.year = calendar.component(.year, from: inputDate)
        self.date = calendar.date(from: DateComponents(year: year,
                                                       month: month,
                                                       day: day))!
        let myFormatter = DateFormatter()
        myFormatter.dateStyle = .medium
        self.asString = myFormatter.string(from: self.date)
    }
    
    init? (day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
        
        
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
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
}
