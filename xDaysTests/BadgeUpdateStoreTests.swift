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

    var date_1_jan_1970: Date!
    var date_2_jan_1970: Date!
    var date_3_jan_1970: Date!
    var date_4_jan_1970: Date!
    var date_5_jan_1970: Date!
    var date_1_jan_1971: Date!
    var date_8_jan_1970: Date!
    var date_05_apr_17: Date!
    var date_11_may_17: Date!
    var date_12_apr_17: Date!
    var date_24_mar_17: Date!
    var date_29_mar_17: Date!
    
    var exception_date_14_apr_17: ExceptionDate!
    var exception_date_17_apr_17: ExceptionDate!
    var exception_date_1_may_17: ExceptionDate!
    
    var countAll7days: DaysToCount!
    var count6daysNoSat: DaysToCount!
    var countDaysExceptThursday: DaysToCount!
    var countOnlyWeekdays: DaysToCount!
    
    
    var exceptionDates_14apr17_and_17apr17: ExceptionDates!
    var exceptionDates_14apr17_and_17apr17_and_1may17: ExceptionDates!
    var exceptionDatesWithNoDates: ExceptionDates!

    var dateFormatter = DateFormatter()

    override func setUp() {
        super.setUp()
        dateFormatter.calendar = Calendar.current
        dateFormatter.dateFormat = "d MMM yyyy HH:mm"
        
        date_1_jan_1970 = dateFormatter.date(from: "1 Jan 1970 00:00")!
        date_2_jan_1970 = dateFormatter.date(from: "2 Jan 1970 00:00")!
        date_3_jan_1970 = dateFormatter.date(from: "3 Jan 1970 00:00")!
        date_4_jan_1970 = dateFormatter.date(from: "4 Jan 1970 00:00")!
        date_5_jan_1970 = dateFormatter.date(from: "5 Jan 1970 00:00")!
        date_8_jan_1970 = dateFormatter.date(from: "8 Jan 1970 00:00")!
        date_1_jan_1971 = dateFormatter.date(from: "1 Jan 1971 00:00")!
        date_05_apr_17  = dateFormatter.date(from: "5 Apr 2017 00:00")!
        date_11_may_17  = dateFormatter.date(from: "11 May 2017 00:00")!
        date_12_apr_17  = dateFormatter.date(from: "12 Apr 2017 00:00")!
        date_24_mar_17  = dateFormatter.date(from: "24 Mar 2017 00:00")!
        date_29_mar_17  = dateFormatter.date(from: "29 Mar 2017 00:00")!

        countAll7days = DaysToCount(includeWeekends: true)
        countDaysExceptThursday = DaysToCount(thursday: false)
        count6daysNoSat = DaysToCount(saturday: false)
        countOnlyWeekdays = DaysToCount(saturday: false, sunday: false)

        exceptionDatesWithNoDates = ExceptionDates(allDateItems: [])

        exception_date_14_apr_17 = ExceptionDate(date: dateFormatter.date(from: "14 Apr 2017 00:00")! , include: false)
        exception_date_17_apr_17 = ExceptionDate(date: dateFormatter.date(from: "17 Apr 2017 00:00")! , include: false)
        exception_date_1_may_17 = ExceptionDate(date: dateFormatter.date(from: "1 May 2017 00:00")! , include: false)

        
        exceptionDates_14apr17_and_17apr17 = ExceptionDates(allDateItems: [exception_date_14_apr_17, exception_date_17_apr_17])
        exceptionDates_14apr17_and_17apr17_and_1may17 = ExceptionDates(allDateItems: [exception_date_14_apr_17, exception_date_17_apr_17, exception_date_1_may_17])
        
    }
    

    func testBadgeUpdateStoreWithNoItems() {
     
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: exceptionDatesWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: date_1_jan_1970, target: date_1_jan_1970, with: specialDays)
        
        XCTAssertEqual(0, badgeUpdateStore.allItems.count)
    
    }

    func testBadgeUpdateStoreWith1Item() {
        
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: exceptionDatesWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: date_1_jan_1970, target: date_2_jan_1970, with: specialDays)
        
        XCTAssertEqual(1, badgeUpdateStore.allItems.count)
        
    }


    func testBadgeUpdateStoreWithAYearsWorthOfItems() {
        
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: exceptionDatesWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: date_1_jan_1970, target: date_1_jan_1971, with: specialDays)
        
        XCTAssertEqual(365, badgeUpdateStore.allItems.count)
        
    }

    func testBadgeUpdateStoreWith2daysAway() {
        
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: exceptionDatesWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: date_1_jan_1970, target: date_3_jan_1970, with: specialDays)
        
        XCTAssertEqual(2, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)
     
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "2 Jan 1970 00:00")!, badgeNumber: 1), sortedBadgeItemArray[0])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "3 Jan 1970 00:00")!, badgeNumber: 0), sortedBadgeItemArray[1])
    }

    func testBadgeUpdateStoreWith3daysAway() {
        
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: exceptionDatesWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: date_1_jan_1970, target: date_4_jan_1970, with: specialDays)
        
        XCTAssertEqual(3, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)


        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "2 Jan 1970 00:00")!, badgeNumber: 2), sortedBadgeItemArray[0])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "3 Jan 1970 00:00")!, badgeNumber: 1), sortedBadgeItemArray[1])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "4 Jan 1970 00:00")!, badgeNumber: 0), sortedBadgeItemArray[2])

    }
    
    func testBadgeUpdateStoreWith4daysAway() {
        
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: exceptionDatesWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: date_1_jan_1970, target: date_5_jan_1970, with: specialDays)
        
        XCTAssertEqual(4, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)

        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "2 Jan 1970 00:00")!, badgeNumber: 3), sortedBadgeItemArray[0])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "3 Jan 1970 00:00")!, badgeNumber: 2), sortedBadgeItemArray[1])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "4 Jan 1970 00:00")!, badgeNumber: 1), sortedBadgeItemArray[2])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "5 Jan 1970 00:00")!, badgeNumber: 0), sortedBadgeItemArray[3])
    }
    

    func testBadgeUpdateStoreWith4daysAwayDontCountSaturday() {
        
        let specialDays = SpecialDays(daysToCount: count6daysNoSat, exclusionDates: exceptionDatesWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: date_1_jan_1970, target: date_5_jan_1970, with: specialDays)
        
        XCTAssertEqual(3, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)
        
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "2 Jan 1970 00:00")!, badgeNumber: 2), sortedBadgeItemArray[0])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "3 Jan 1970 00:00")!, badgeNumber: 1), sortedBadgeItemArray[1])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "5 Jan 1970 00:00")!, badgeNumber: 0), sortedBadgeItemArray[2])

    }
    
    
    func testBadgeUpdateStoreSkipEasterDays() {
        
        let specialDays = SpecialDays(daysToCount: countOnlyWeekdays, exclusionDates: exceptionDates_14apr17_and_17apr17)
        let badgeUpdateStore = BadgeUpdateStore(today: date_12_apr_17, target: date_11_may_17, with: specialDays)
        
        XCTAssertEqual(19, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)

        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "13 Apr 2017 00:00")!, badgeNumber: 18), sortedBadgeItemArray[0])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "14 Apr 2017 00:00")!, badgeNumber: 17), sortedBadgeItemArray[1])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "19 Apr 2017 00:00")!, badgeNumber: 16), sortedBadgeItemArray[2])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "20 Apr 2017 00:00")!, badgeNumber: 15), sortedBadgeItemArray[3])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "21 Apr 2017 00:00")!, badgeNumber: 14), sortedBadgeItemArray[4])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "22 Apr 2017 00:00")!, badgeNumber: 13), sortedBadgeItemArray[5])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "25 Apr 2017 00:00")!, badgeNumber: 12), sortedBadgeItemArray[6])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "26 Apr 2017 00:00")!, badgeNumber: 11), sortedBadgeItemArray[7])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "27 Apr 2017 00:00")!, badgeNumber: 10), sortedBadgeItemArray[8])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "28 Apr 2017 00:00")!, badgeNumber: 9), sortedBadgeItemArray[9])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "29 Apr 2017 00:00")!, badgeNumber: 8), sortedBadgeItemArray[10])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "2 May 2017 00:00")!, badgeNumber: 7), sortedBadgeItemArray[11])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "3 May 2017 00:00")!, badgeNumber: 6), sortedBadgeItemArray[12])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "4 May 2017 00:00")!, badgeNumber: 5), sortedBadgeItemArray[13])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "5 May 2017 00:00")!, badgeNumber: 4), sortedBadgeItemArray[14])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "6 May 2017 00:00")!, badgeNumber: 3), sortedBadgeItemArray[15])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "9 May 2017 00:00")!, badgeNumber: 2), sortedBadgeItemArray[16])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "10 May 2017 00:00")!, badgeNumber: 1), sortedBadgeItemArray[17])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "11 May 2017 00:00")!, badgeNumber: 0), sortedBadgeItemArray[18])
    }
    
    func test_BadgeUpdates_From12Apr17to11May17ExcludingBankHaolidays_18BadgeUpdates() {
        
        let specialDays = SpecialDays(daysToCount: countOnlyWeekdays, exclusionDates: exceptionDates_14apr17_and_17apr17_and_1may17)
        let badgeUpdateStore = BadgeUpdateStore(today: date_12_apr_17, target: date_11_may_17, with: specialDays)
        
        XCTAssertEqual(18, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)

        
        
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "13 Apr 2017 00:00")!, badgeNumber: 17), sortedBadgeItemArray[0])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "14 Apr 2017 00:00")!, badgeNumber: 16), sortedBadgeItemArray[1])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "19 Apr 2017 00:00")!, badgeNumber: 15), sortedBadgeItemArray[2])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "20 Apr 2017 00:00")!, badgeNumber: 14), sortedBadgeItemArray[3])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "21 Apr 2017 00:00")!, badgeNumber: 13), sortedBadgeItemArray[4])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "22 Apr 2017 00:00")!, badgeNumber: 12), sortedBadgeItemArray[5])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "25 Apr 2017 00:00")!, badgeNumber: 11), sortedBadgeItemArray[6])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "26 Apr 2017 00:00")!, badgeNumber: 10), sortedBadgeItemArray[7])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "27 Apr 2017 00:00")!, badgeNumber: 9), sortedBadgeItemArray[8])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "28 Apr 2017 00:00")!, badgeNumber: 8), sortedBadgeItemArray[9])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "29 Apr 2017 00:00")!, badgeNumber: 7), sortedBadgeItemArray[10])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "3 May 2017 00:00")!, badgeNumber: 6), sortedBadgeItemArray[11])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "4 May 2017 00:00")!, badgeNumber: 5), sortedBadgeItemArray[12])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "5 May 2017 00:00")!, badgeNumber: 4), sortedBadgeItemArray[13])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "6 May 2017 00:00")!, badgeNumber: 3), sortedBadgeItemArray[14])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "9 May 2017 00:00")!, badgeNumber: 2), sortedBadgeItemArray[15])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "10 May 2017 00:00")!, badgeNumber: 1), sortedBadgeItemArray[16])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "11 May 2017 00:00")!, badgeNumber: 0), sortedBadgeItemArray[17])
        
    }

    func test_BadgeUpdates_From24mar17to29mar17AccrossClockChange_checkMidnightStillScheduled() {
        let specialDays = SpecialDays(daysToCount: countAll7days, exclusionDates: exceptionDatesWithNoDates)
        let badgeUpdateStore = BadgeUpdateStore(today: date_24_mar_17, target: date_29_mar_17, with: specialDays)
        
        XCTAssertEqual(5, badgeUpdateStore.allItems.count)
        let sortedBadgeItemArray = sortBadgeItemArray(badgeUpdateStore.allItems)

        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "25 Mar 2017 00:00")!, badgeNumber: 4), sortedBadgeItemArray[0])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "26 Mar 2017 00:00")!, badgeNumber: 3), sortedBadgeItemArray[1])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "27 Mar 2017 00:00")!, badgeNumber: 2), sortedBadgeItemArray[2])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "28 Mar 2017 00:00")!, badgeNumber: 1), sortedBadgeItemArray[3])
        XCTAssertEqual(BadgeUpdateItem(notificationTime: dateFormatter.date(from: "29 Mar 2017 00:00")!, badgeNumber: 0), sortedBadgeItemArray[4])
    }
}

func sortBadgeItemArray(_ items: [BadgeUpdateItem]) -> [BadgeUpdateItem] {
    return items.sorted {(lhs: BadgeUpdateItem, rhs: BadgeUpdateItem) -> Bool in return lhs.notificationTime < rhs.notificationTime}
}
