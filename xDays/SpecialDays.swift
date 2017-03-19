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
    var exclusionDates: DateStore

    init(daysToCount: DaysToCount, exclusionDates: DateStore) {
        self.daysToCount = daysToCount
        self.exclusionDates = exclusionDates
    }

}
