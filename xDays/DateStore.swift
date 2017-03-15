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

    init() {
        for _ in 0..<5 {
            createItem()
        }
    }

    @discardableResult func createItem() -> DateItem {
        let newDateItem = DateItem(random: true)
        allDateItems.append(newDateItem)
        return newDateItem
    }
}
