//
//  TargetDate.swift
//  xDays
//
//  Created by James Honeyball on 10/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class TargetDate {

    var date: Date
    
    init(date: Date) {
        self.date = SimpleDate(date).date
    }
}

