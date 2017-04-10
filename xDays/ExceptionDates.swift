//
//  DateStore.swift
//  xDays
//
//  Created by James Honeyball on 15/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class ExceptionDates:  NSObject, NSCoding {
    
    var allDateItems = [ExceptionDate]()
    
    struct PropertyKey {
        static let allDateItems = "allDateItems"
    }
    
    init(allDateItems: [ExceptionDate]) {
        self.allDateItems = allDateItems
    }

    
    func asString() -> String {
        var listOfDates = ""
        for iteratorItem in allDateItems {
            listOfDates += " (\(SimpleDate(iteratorItem.getDate()).asString))"
        }
        return listOfDates
    }
    
    func addItem(_ newDateItem: ExceptionDate) {
        allDateItems.append(newDateItem)
    }

    
    func contains(dateItem: ExceptionDate) -> Bool {
        
        for iteratorItem in allDateItems {
            if iteratorItem.getDate() == dateItem.getDate() {
                return true
            }
        }
        return false
    }

    func removeItem(_ item: ExceptionDate) {
        if let index = allDateItems.index(of: item) {
            allDateItems.remove(at: index)
        }
    }

    
    //MARK: NSCoding

    func encode(with aCoder: NSCoder) {
        aCoder.encode(allDateItems, forKey: PropertyKey.allDateItems)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let allDateItems = aDecoder.decodeObject(forKey: PropertyKey.allDateItems) as! [ExceptionDate]
        self.init(allDateItems: allDateItems)
    }
}


