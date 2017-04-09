//
//  TargetDate.swift
//  xDays
//
//  Created by James Honeyball on 19/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import UIKit
import os.log


class TargetDate: NSObject, NSCoding {
    
    //MARK: Properties
    
    var date: Date

    
    //MARK: Types
    
    struct PropertyKey {
        static let date = "date"
    }

    //MARK: Initialization

    init(date: Date) {
        self.date = SimpleDate(date).date
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

