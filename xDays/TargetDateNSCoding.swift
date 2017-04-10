//
//  TargetDaysNSCoding.swift
//  xDays
//
//  Created by James Honeyball on 10/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class TargetDateNSCoding: TargetDate, NSCoding {

    init(_ targetDate: TargetDate) {
        super.init(date: targetDate.date)
    }

    override init(date: Date) {
        super.init(date: date)
    }
    

    
}
