//
//  ViewController.swift
//  xDays
//
//  Created by James Honeyball on 12/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
            updateTheDateBadge(daysUntil: targetDate.date)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateTheDateBadge(daysUntil: targetDate.date)
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
    }
    
    func updateTheDateBadge(daysUntil toDate: Date)
    {
        let application = UIApplication.shared
        
        let settings = application.currentUserNotificationSettings
        if (settings?.types.contains(.badge) != true) {
            application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
            application.registerForRemoteNotifications()
        }
        
        let daysToGo = daysBetween(Date(), to: targetDate.date)
        
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


func daysBetween(_ fromDate: Date, to toDate: Date) -> Int {
    
    let currentCalendar = Calendar.current
    
    let calendar = Calendar.current
    
    var day = calendar.component(.day, from: fromDate)
    var month = calendar.component(.month, from: fromDate)
    var year = calendar.component(.year, from: fromDate)
    let noTimeDateFrom = calendar.date(from: DateComponents(year: year,
                                                            month: month,
                                                            day: day))
    day = calendar.component(.day, from: toDate)
    month = calendar.component(.month, from: toDate)
    year = calendar.component(.year, from: toDate)
    let noTimeDateTo = calendar.date(from: DateComponents(year: year,
                                                          month: month,
                                                          day: day))
    if let daysToGo = currentCalendar.dateComponents([.day],
                                                     from: noTimeDateFrom!,
                                                     to: noTimeDateTo!).day {
        return daysToGo
    } else {
        return 0
    }
}
