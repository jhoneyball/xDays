//
//  DateStore.swift
//  xDays
//
//  Created by James Honeyball on 15/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import UIKit

class DateStore {
    
    var allDateItems = [DateItem]()


    @discardableResult func createItem() -> DateItem {
        let newDateItem = DateItem(random: true)
        allDateItems.append(newDateItem)
        return newDateItem
    }

    func addItem(_ newDateItem: DateItem) {
        allDateItems.append(newDateItem)
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
    }
}

