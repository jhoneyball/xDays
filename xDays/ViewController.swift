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



}

func updateTheDateBadge(daysUntil toDate: Date)
{
    let application = UIApplication.shared
    var badgeNumber = 0
    
    let settings = application.currentUserNotificationSettings
    if (settings?.types.contains(.badge))! {
        print ("Badges are true")
    } else {
        print ("Badges are not true")
        application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil))
        application.registerForRemoteNotifications()
    }

    let currentCalendar = Calendar.current

    if let daysToGo = currentCalendar.dateComponents([.day],
                                               from: Date(),
                                               to: toDate).day {
        if (daysToGo > 0 && daysToGo < 9999) {
            badgeNumber = daysToGo
        }
    }
    application.applicationIconBadgeNumber = badgeNumber
}
