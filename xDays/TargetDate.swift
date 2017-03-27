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

    //MARK: Archiving Paths
    private static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let ArchiveURL = DocumentsDirectory.appendingPathComponent("targetDate")
    
    //MARK: Types
    
    struct PropertyKey {
        static let date = "date"
    }
    
    //MARK: Initialization

    init(date: Date) {
        
        // Initialize stored properties.
        self.date = date
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: PropertyKey.date)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // Because photo is an optional property of Meal, just use conditional cast.
        let date = aDecoder.decodeObject(forKey: PropertyKey.date) as! Date
        self.init(date: date)
    }
    
    func setTargetDate(date dateWithTime: Date) {
        self.date = SimpleDate(dateWithTime).date
        let path = TargetDate.ArchiveURL.path
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(self, toFile: path)
        if isSuccessfulSave {
            print("TargetDate successfully saved. \(date)")
        } else {
            print("Failed to save TargetDate...")
        }
    }
    
    static func loadTargetDate() -> TargetDate?  {
        let targetDate = NSKeyedUnarchiver.unarchiveObject(withFile: TargetDate.ArchiveURL.path) as? TargetDate
        if targetDate != nil {
            print("TargetDate successfully loaded. \(targetDate!.date)")
        }
        return targetDate
    }
}

