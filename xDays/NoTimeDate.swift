//
//  NoTimeDate.swift
//  xDays
//
//  Created by James Honeyball on 26/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class NoTimeDate {
    
    let date: Date
    
    init (_ inputDate: Date) {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: inputDate)
        let month = calendar.component(.month, from: inputDate)
        let year = calendar.component(.year, from: inputDate)
        self.date = calendar.date(from: DateComponents(year: year,
                                                       month: month,
                                                       day: day))!
    }
}
