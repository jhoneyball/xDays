//
//  PersistentObjectStorage
//  xDays
//
//  Created by James Honeyball on 09/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class PersistentObjectStorage {
    private let archiver: Archiving
    private let unArchiver: UnArchiving
    private let DocumentsDirectory: URL
    private let TargetDateArchiveURL: URL
    private let DaysToCountArchiveURL: URL
    private let ExceptionDatesArchiveURL: URL
    
    init (archiver: Archiving, unArchiver: UnArchiving) {
        self.archiver = archiver
        self.unArchiver = unArchiver
        DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        TargetDateArchiveURL = DocumentsDirectory.appendingPathComponent("targetDate")
        DaysToCountArchiveURL = DocumentsDirectory.appendingPathComponent("daysToCount")
        ExceptionDatesArchiveURL = DocumentsDirectory.appendingPathComponent("exceptionDates")
    }
    

    func retrieveDaysToCount() -> DaysToCount {
        var daysToCount = NSKeyedUnarchiver.unarchiveObject(withFile: DaysToCountArchiveURL.path) as? DaysToCount
        if daysToCount != nil {
            print("DaysToCount successfully loaded : \"\(daysToCount!.asString())\"")
        } else {
            daysToCount = DaysToCount()
        }
        return daysToCount!
    }
    
    func retrieveExceptionDates() -> ExceptionDates {
        var exceptionDates = NSKeyedUnarchiver.unarchiveObject(withFile: ExceptionDatesArchiveURL.path) as? ExceptionDates
        if exceptionDates != nil {
            print("ExceptionDates successfully loaded : \(exceptionDates!.asString())")
        } else {
            exceptionDates = ExceptionDates(allDateItems: [ExceptionDate]())
        }
        return exceptionDates!
    }
    
    func retrieveTargetDate() -> TargetDate {
        var targetDate = NSKeyedUnarchiver.unarchiveObject(withFile: TargetDateArchiveURL.path) as? TargetDate
        if targetDate != nil {
            print("TargetDate successfully loaded. \(SimpleDate((targetDate?.date)!).asString)")
        } else {
            targetDate = TargetDate(date: Date())
            print("Failed to load target date from disk. Defaulting to \(SimpleDate((targetDate?.date)!).asString)")
        }
        return targetDate!
    }
    
    func storeTargetDate(_ targetDate: TargetDate) {
        let path = TargetDateArchiveURL.path
        let isSuccessfulSave = archiver.archiveRootObject(targetDate, to​File: path)
        if isSuccessfulSave {
            print("TargetDate successfully saved. \(SimpleDate(targetDate.date).asString)")
        } else {
            print("Failed to save TargetDate...")
        }
    }

    
    func storeDaysToCount(_ daysToCount: DaysToCount) {
        let path = DaysToCountArchiveURL.path
        let isSuccessfulSave = archiver.archiveRootObject(daysToCount, to​File: path)
        if isSuccessfulSave {
            print("DaysToCount successfully saved : \"\(daysToCount.asString())\"")
        } else {
            print("Failed to save DaysToCount")
        }
        
    }

    func storeExceptionDates(_ exceptionDates: ExceptionDates) {
        let path = ExceptionDatesArchiveURL.path
        let isSuccessfulSave = archiver.archiveRootObject(exceptionDates, to​File: path)
        if isSuccessfulSave {
            print("ExceptionDates successfully saved : \(exceptionDates.asString())")
        } else {
            print("Failed to save ExceptionDates")
        }
    }
}
