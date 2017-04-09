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

    var dateToday: Date!
    var date1dayAway: Date!
    var date2daysAway: Date!
    var date3daysAway: Date!
    var date4daysAway: Date!
    var date1yearAway: Date!
    var date1weekAway: Date!
    var date_5_apr_17: Date!
    var date_11_may_17: Date!
    
    var countAll7days: DaysToCount!
    var count6daysNoSat: DaysToCount!
    var countDaysExceptThursday: DaysToCount!
    var countOnlyWeekdays: DaysToCount!
    
    var dateStoreWithNoDates: ExceptionDates!

    override func setUp() {
        super.setUp()
        dateToday = SimpleDate(day: 1, month: 1, year: 1970)!.date
        date1dayAway = SimpleDate(day: 2, month: 1, year: 1970)!.date
        date2daysAway = SimpleDate(day: 3, month: 1, year: 1970)!.date
        date3daysAway = SimpleDate(day: 4, month: 1, year: 1970)!.date
        date4daysAway = SimpleDate(day: 5, month: 1, year: 1970)!.date
        date1weekAway = SimpleDate(day: 8, month: 1, year: 1970)!.date
        date1yearAway = SimpleDate(day: 1, month: 1, year: 1971)!.date
        date_5_apr_17 = SimpleDate(day: 5, month: 4, year: 2017)!.date
        date_11_may_17 = SimpleDate(day: 11, month: 5, year: 2017)!.date
        
        countAll7days = DaysToCount(includeWeekends: true)
        countDaysExceptThursday = DaysToCount(thursday: false)
        count6daysNoSat = DaysToCount(saturday: false)
        countOnlyWeekdays = DaysToCount(saturday: false, sunday: false)

        dateStoreWithNoDates = ExceptionDates(allDateItems: [])

    }
    

    func testBadgeUpdateStoreWithNoItems() {
     
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: dateStoreWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: dateToday, target: dateToday, with: specialDays)
        
        XCTAssertEqual(0, badgeUpdateStore.allItems.count)
    
    }

    func testBadgeUpdateStoreWith1Item() {
        
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: dateStoreWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: dateToday, target: date1dayAway, with: specialDays)
        
        XCTAssertEqual(1, badgeUpdateStore.allItems.count)
        
    }


    func testBadgeUpdateStoreWithAYearsWorthOfItems() {
        
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: dateStoreWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: dateToday, target: date1yearAway, with: specialDays)
        
        XCTAssertEqual(365, badgeUpdateStore.allItems.count)
        
    }

    func testBadgeUpdateStoreWith2daysAway() {
        
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: dateStoreWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: dateToday, target: date2daysAway, with: specialDays)
        
        XCTAssertEqual(2, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)
        
        XCTAssertEqual(1, sortedBadgeItemArray[0].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 2, month: .jan, year: 1970)!, SimpleDate(sortedBadgeItemArray[0].notificationTime))

        XCTAssertEqual(0, sortedBadgeItemArray[1].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 3, month: .jan, year: 1970)!, SimpleDate(sortedBadgeItemArray[1].notificationTime))
    }

    func testBadgeUpdateStoreWith3daysAway() {
        
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: dateStoreWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: dateToday, target: date3daysAway, with: specialDays)
        
        XCTAssertEqual(3, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)

        XCTAssertEqual(2, sortedBadgeItemArray[0].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 2, month: .jan, year: 1970), SimpleDate(sortedBadgeItemArray[0].notificationTime))
        
        XCTAssertEqual(1, sortedBadgeItemArray[1].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 3, month: .jan, year: 1970), SimpleDate(sortedBadgeItemArray[1].notificationTime))
        
        XCTAssertEqual(0, sortedBadgeItemArray[2].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 4, month: .jan, year: 1970), SimpleDate(sortedBadgeItemArray[2].notificationTime))
    }
    
    func testBadgeUpdateStoreWith4daysAway() {
        
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: dateStoreWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: dateToday, target: date4daysAway, with: specialDays)
        
        XCTAssertEqual(4, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)
        
        XCTAssertEqual(3, sortedBadgeItemArray[0].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 2, month: .jan, year: 1970), SimpleDate(sortedBadgeItemArray[0].notificationTime))
        
        XCTAssertEqual(2, sortedBadgeItemArray[1].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 3, month: .jan, year: 1970), SimpleDate(sortedBadgeItemArray[1].notificationTime))
        
        XCTAssertEqual(1, sortedBadgeItemArray[2].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 4, month: .jan, year: 1970), SimpleDate(sortedBadgeItemArray[2].notificationTime))
        
        XCTAssertEqual(0, sortedBadgeItemArray[3].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 5, month: .jan, year: 1970), SimpleDate(sortedBadgeItemArray[3].notificationTime))
    }
    

    func testBadgeUpdateStoreWith4daysAwayDontCountSaturday() {
        
        let specialDays = SpecialDays(daysToCount: count6daysNoSat, exclusionDates: dateStoreWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: dateToday, target: date4daysAway, with: specialDays)
        
        XCTAssertEqual(3, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)
        
        XCTAssertEqual(2, sortedBadgeItemArray[0].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 2, month: .jan, year: 1970), SimpleDate(sortedBadgeItemArray[0].notificationTime))
        
        XCTAssertEqual(1, sortedBadgeItemArray[1].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 4, month: .jan, year: 1970), SimpleDate(sortedBadgeItemArray[1].notificationTime))
        
        XCTAssertEqual(0, sortedBadgeItemArray[2].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 5, month: .jan, year: 1970), SimpleDate(sortedBadgeItemArray[2].notificationTime))
    }
    

    func testBadgeUpdateStoreWithTurksData() {
        
        let specialDays = SpecialDays(daysToCount: countOnlyWeekdays, exclusionDates: dateStoreWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: date_5_apr_17, target: date_11_may_17, with: specialDays)
        
        XCTAssertEqual(26, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)
        
        XCTAssertEqual(25, sortedBadgeItemArray[0].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 6, month: .apr, year: 2017), SimpleDate(sortedBadgeItemArray[0].notificationTime))

        XCTAssertEqual(0, sortedBadgeItemArray[25].badgeNumber)
        XCTAssertEqual(SimpleDate(day: 11, month: .may, year: 2017), SimpleDate(sortedBadgeItemArray[25].notificationTime))
    }
    
    
}

func sortBadgeItemArray(_ items: [BadgeUpdateItem]) -> [BadgeUpdateItem] {
    return items.sorted {(lhs: BadgeUpdateItem, rhs: BadgeUpdateItem) -> Bool in return lhs.notificationTime < rhs.notificationTime}
}
