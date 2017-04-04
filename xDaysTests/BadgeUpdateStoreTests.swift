//
//  BadgeUpdateStoreTests.swift
//  xDays
//
//  Created by James Honeyball on 03/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import XCTest
@testable import xDays

class BadgeUpdateStoreTests: XCTestCase {
    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    

    func testBadgeUpdateStoreWithNoItems() {
     
        let dateToday = SimpleDate(day: 1, month: 1, year: 1970)!.date
        let date2 = SimpleDate(day: 1, month: 1, year: 1970)!.date
        let countAll7days = DaysToCount(includeWeekends: true)
        let dateStoreWithNoDates = DateStore(allDateItems: [])
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: dateStoreWithNoDates)
        
        let badgeUpdateStore = BadgeUpdateStore(today: dateToday, target: date2, with: specialDays)
        
        XCTAssertEqual(0, badgeUpdateStore.allItems.count)
    
    }

    func testBadgeUpdateStoreWith1Item() {
        
        let dateToday = SimpleDate(day: 1, month: 1, year: 1970)!.date
        let date2 = SimpleDate(day: 2, month: 1, year: 1970)!.date
        let countAll7days = DaysToCount(includeWeekends: true)
        let dateStoreWithNoDates = DateStore(allDateItems: [])
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: dateStoreWithNoDates)
        
        let badgeUpdateStore = BadgeUpdateStore(today: dateToday, target: date2, with: specialDays)
        
        XCTAssertEqual(1, badgeUpdateStore.allItems.count)
        
    }


    func testBadgeUpdateStoreWithAYearsWorthOfItems() {
        
        let dateToday = SimpleDate(day: 1, month: 1, year: 1973)!.date
        let date2 = SimpleDate(day: 1, month: 1, year: 1974)!.date
        let countAll7days = DaysToCount(includeWeekends: true)
        let dateStoreWithNoDates = DateStore(allDateItems: [])
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: dateStoreWithNoDates)
        
        let badgeUpdateStore = BadgeUpdateStore(today: dateToday, target: date2, with: specialDays)
        
        XCTAssertEqual(365, badgeUpdateStore.allItems.count)
        
    }
    
    
    func testBadgeUpdateStoreWithWeekNoWednesdayChangeOfBadge() {
        
        let dateToday = SimpleDate(day: 5, month: 1, year: 1970)!.date
        let dateTarget = SimpleDate(day: 12, month: 1, year: 1970)!.date

        let count6days = DaysToCount(monday: true,
                                     tuesday: true,
                                     wednesday: false,
                                     thursday: true,
                                     friday: true,
                                     saturday: true,
                                     sunday: true)
        
        let dateStoreWithNoDates = DateStore(allDateItems: [])
        let specialDays = SpecialDays(daysToCount: count6days, exclusionDates: dateStoreWithNoDates)
        
        let badgeUpdateStore = BadgeUpdateStore(today: dateToday, target: dateTarget, with: specialDays)
        
        XCTAssertEqual(6, badgeUpdateStore.allItems.count)
        
        let sortedBadgeItemArray: [BadgeUpdateItem] = badgeUpdateStore.allItems.sorted {(lhs: BadgeUpdateItem, rhs: BadgeUpdateItem) -> Bool in
            return lhs.notificationTime < rhs.notificationTime}
        for badgeItem in sortedBadgeItemArray {
            print("\(SimpleDate(badgeItem.notificationTime).asString) \(badgeItem.badgeNumber)")
        }
    }
}
