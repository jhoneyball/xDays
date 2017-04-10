//
//  TargetDate.swift
//  xDays
//
//  Created by James Honeyball on 10/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class TargetDate: NSObject, NSCoding {

    var date: Date
    
    init(date: Date) {
        self.date = SimpleDate(date).date
    }


    //MARK: - NSCoding
    struct PropertyKey {
        static let date = "date"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: PropertyKey.date)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let date = aDecoder.decodeObject(forKey: PropertyKey.date) as! Date
        self.init(date: date)
    }
}

