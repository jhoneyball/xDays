//
//  DateItem.swift
//  xDays
//
//  Created by James Honeyball on 15/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//


import Foundation

class ExceptionDate: NSObject, NSCoding {

    //MARK: Properties
    private var date: Date
    private var include: Bool

    func getDate()-> Date {return date}
    func getInclude()-> Bool {return include}


    //MARK: Initialization
    init (date initDate: Date, include: Bool) {
        self.date = SimpleDate(initDate).date
        self.include = include

    }

    //MARK: NSCoding
    struct PropertyKey {
        static let date = "date"
        static let include = "incude"
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(include, forKey: PropertyKey.include)
        aCoder.encode(date, forKey: PropertyKey.date)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let include = aDecoder.decodeBool(forKey: PropertyKey.include)
        let date = aDecoder.decodeObject(forKey: PropertyKey.date) as! Date
        // Must call designated initializer.
        self.init(date: date, include: include)
    }
}
