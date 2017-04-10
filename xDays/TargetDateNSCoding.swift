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
    
    //MARK: Types
    
    struct PropertyKey {
        static let date = "date"
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: PropertyKey.date)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        let date = aDecoder.decodeObject(forKey: PropertyKey.date) as! Date
        self.init(date: date)
    }
    
}
