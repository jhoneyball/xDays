//
//  DateItem.swift
//  xDays
//
//  Created by James Honeyball on 15/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import UIKit
import os.log
import Foundation

class ExceptionDate: NSObject, NSCoding {

    //MARK: Properties
    private var date: Date
    private var include: Bool

    func getDate()-> Date {return date}
    func getInclude()-> Bool {return include}

    //MARK: Archiving Paths
    private static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let ArchiveURL = DocumentsDirectory.appendingPathComponent("exceptionDate")

    //MARK: Types
    
    struct PropertyKey {
        static let date = "date"
        static let include = "incude"
    }

    //MARK: Initialization
    

    init (date initDate: Date, include: Bool) {
        self.date = SimpleDate(initDate).date
        self.include = include

    }

    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: PropertyKey.date)
        aCoder.encode(include, forKey: PropertyKey.include)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let include = aDecoder.decodeBool(forKey: PropertyKey.include)
        let date = aDecoder.decodeObject(forKey: PropertyKey.date) as! Date
        // Must call designated initializer.
        self.init(date: date, include: include)
    }
}
