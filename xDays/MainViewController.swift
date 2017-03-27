//
//  ViewController.swift
//  xDays
//
//  Created by James Honeyball on 12/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var targetDate: TargetDate!
    var specialDays: SpecialDays!
    
//    @IBAction func daysToCountButton(sender: UIButton) {
//        
//    }
//
//    @IBAction func exceptionDaysButton(sender: UIButton) {
//        
//    }

    @IBOutlet var xDaysUntilLabel: UILabel!
    @IBOutlet var datePicker:UIDatePicker!

    @IBAction func updateDate(sender: UIDatePicker, forEvent event: UIEvent) {
            targetDate.setTargetDate(date: sender.date)
            print ("The date is \(targetDate.date)")
            updateTheDaysToGo(until: targetDate.date, with: specialDays)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateTheDaysToGo(until: targetDate.date, with: specialDays)
        datePicker.date = targetDate.date
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DaysToCount" {
                let daysToCountViewController = segue.destination as! DaysToCountViewController
                daysToCountViewController.specialDays = specialDays
        } else if segue.identifier == "ExceptionDays" {
                let exceptionDaysViewController = segue.destination as! ExceptionDaysController
                exceptionDaysViewController.specialDays = specialDays
        }
    }

    @IBAction func unwindToHere(segue: UIStoryboardSegue) {
        // And we are back
        // let svc = segue.sourceViewController as! TheViewControllerClassYouAreReturningFrom
        // use svc to get mood, action, and place
        updateTheDaysToGo (until: targetDate.date, with: specialDays)
    }
    
    func updateTheDaysToGo(until toDate: Date, with specialDays: SpecialDays)
    {
        let application = UIApplication.shared
        
        let settings = application.currentUserNotificationSettings
        if (settings?.types.contains(.badge) != true) {
            application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
            application.registerForRemoteNotifications()
        }
        
        let daysToGo = daysBetween(Date(), to: targetDate.date, with: specialDays)
        
        var badgeNumber: Int
        if (daysToGo > 0 && daysToGo < 9999) {
            badgeNumber = daysToGo
        } else {
            badgeNumber = 0
        }
        application.applicationIconBadgeNumber = badgeNumber
        xDaysUntilLabel.text = "\(daysToGo) Days To Go Until:"
    }

}


func daysBetween(_ fromDate: Date, to toDate: Date, with specialDays: SpecialDays) -> Int {
    
    let calendar = Calendar.current
    let SecondsIn1Day: TimeInterval = 86400
    var day = calendar.component(.day, from: fromDate)
    var month = calendar.component(.month, from: fromDate)
    var year = calendar.component(.year, from: fromDate)
    let noTimeDateFrom = calendar.date(from: DateComponents(year: year,
                                                            month: month,
                                                            day: day))!
    day = calendar.component(.day, from: toDate)
    month = calendar.component(.month, from: toDate)
    year = calendar.component(.year, from: toDate)
    let noTimeDateTo = calendar.date(from: DateComponents(year: year,
                                                          month: month,
                                                          day: day))!
    if let daysToGo = calendar.dateComponents([.day],
                                              from: noTimeDateFrom,
                                              to: noTimeDateTo).day {
        if daysToGo < 0 {
            return 0
        }
    } else {
        return 0
    }
    var dateToExamine = noTimeDateFrom
    var dayCount = 0
    while dateToExamine < noTimeDateTo {
        if countDay(day: dateToExamine, specialDays: specialDays) {
            dayCount = dayCount + 1
        }
        dateToExamine.addTimeInterval(SecondsIn1Day)
    }
    return dayCount
}

func countDay(day dayToCheck: Date, specialDays: SpecialDays) -> Bool {

    for iteratorDateItem in specialDays.exclusionDates.allDateItems {
        if iteratorDateItem.getDate() == dayToCheck {
            print("Going exclude: \(iteratorDateItem.getDate())")
            return iteratorDateItem.getInclude()
        }
    }
    
    let weekDay = Calendar.current.component(.weekday, from: dayToCheck)

    switch weekDay {
    case 1 : //Sunday
        if specialDays.daysToCount.countSundays() == false {
            return false
        }
        
    case 2 : //Monday
        if specialDays.daysToCount.countMondays() == false {
            return false
        }
        
    case 3 : //Tuesday
        if specialDays.daysToCount.countTuesdays() == false {
            return false
        }
        
    case 4 : //Wednesday
        if specialDays.daysToCount.countWednesdays() == false {
            return false
        }
        
    case 5 : //thursday
        if specialDays.daysToCount.countThursdays() == false {
            return false
        }
        
    case 6 : //Friday
        if specialDays.daysToCount.countFridays() == false {
            return false
        }
        
    case 7 : //Saturday
        if specialDays.daysToCount.countSaturdays() == false {
            return false
        }
    default:
        // something's gone very wrong
        return false
    }
    return true
}

