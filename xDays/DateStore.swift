//
//  DateStore.swift
//  xDays
//
//  Created by James Honeyball on 15/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import UIKit

class DateStore:  NSObject, NSCoding {
    
    var allDateItems = [DateItem]()

    //MARK: Archiving Paths
    private static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let ArchiveURL = DocumentsDirectory.appendingPathComponent("dateStore")
    
    struct PropertyKey {
        static let allDateItems = "allDateItems"
    }
    
    init(allDateItems: [DateItem]) {
        self.allDateItems = allDateItems
    }

    convenience init?(fromDisk: Bool) {
        let dateStore = NSKeyedUnarchiver.unarchiveObject(withFile: DateStore.ArchiveURL.path) as? DateStore
        if dateStore != nil {
            for dateIterator in dateStore!.allDateItems {
                let date = dateIterator.getDate()
                let include = dateIterator.getInclude()
                print("Successfully loaded \(date) include:\(include)")
            }
            print("DateStore successfully loaded.")
            self.init(allDateItems: dateStore!.allDateItems)
        } else {
            print("Failed to load DateStore...")
            return nil
        }
    }



    @discardableResult func createItem() -> DateItem {
        let newDateItem = DateItem(random: true)
        allDateItems.append(newDateItem)
        saveDateStore()
        return newDateItem
    }

    func addItem(_ newDateItem: DateItem) {
        allDateItems.append(newDateItem)
        saveDateStore()
    }

    
    func contains(dateItem: DateItem) -> Bool {
        
        for iteratorItem in allDateItems {
            if iteratorItem.getDate() == dateItem.getDate() {
                return true
            }
        }
        return false
    }

    func removeItem(_ item: DateItem) {
        if let index = allDateItems.index(of: item) {
            allDateItems.remove(at: index)
        }
        saveDateStore()
    }
    
    private func saveDateStore() {
        let path = DateStore.ArchiveURL.path
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(self, toFile: path)
        if isSuccessfulSave {
            for dateIterator in allDateItems {
                let date = dateIterator.getDate()
                let include = dateIterator.getInclude()
                print("Successfully saved \(date) include:\(include)")
            }
            print("DateStore successfully saved.")
        } else {
            print("Failed to save DateStore...")
        }
    }
    
    private func loadDateStore() -> DateStore?  {
        let dateStore = NSKeyedUnarchiver.unarchiveObject(withFile: DateStore.ArchiveURL.path) as? DateStore
        if dateStore != nil {
            for dateIterator in dateStore!.allDateItems {
                let date = dateIterator.getDate()
                let include = dateIterator.getInclude()
                print("Successfully loaded \(date) include:\(include)")
            }
            print("DateStore successfully loaded.")
        } else {
            print("Failed to load DateStore...")
        }
        return dateStore
    }
    
    //MARK: NSCoding

    func encode(with aCoder: NSCoder) {
        aCoder.encode(allDateItems, forKey: PropertyKey.allDateItems)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let allDateItems = aDecoder.decodeObject(forKey: PropertyKey.allDateItems) as! [DateItem]
        self.init(allDateItems: allDateItems)
    }
}


