//
//  ViewController.swift
//  xDays
//
//  Created by James Honeyball on 12/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var xDaysDate = Date()
 
    @IBAction func daysToCountButton(sender: UIButton) {
        
    }

    @IBAction func exceptionDaysButton(sender: UIButton) {
        
    }

    @IBOutlet var xDaysUntilLabel: UILabel!
    @IBAction func updateDate(sender: UIDatePicker, forEvent event: UIEvent) {
            xDaysDate = sender.date
            print ("The date is \(xDaysDate)")
            updateTheDateBadge(daysUntil: xDaysDate)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateTheDateBadge(daysUntil: xDaysDate)
        
    }



    func updateTheDateBadge(daysUntil toDate: Date)
    {
        let application = UIApplication.shared
        
        let settings = application.currentUserNotificationSettings
        if (settings?.types.contains(.badge) != true) {
            application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
            application.registerForRemoteNotifications()
        }
        
        let daysToGo = daysBetween(Date(), to: xDaysDate)
        
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
