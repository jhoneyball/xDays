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
    var badgeControl: BadgeControl!
    
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
            setNotifications(until: targetDate.date, with: specialDays)
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
        
        let daysToGo = SpecialDaysTools.daysBetween(Date(), to: targetDate.date, with: specialDays)
        
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




func setNotifications(until targetDate: Date, with specialDays: SpecialDays) {
    
    let badgeUpdateStore = BadgeUpdateStore(today: Date(), target: targetDate, with: specialDays)

    let badgeControl = BadgeControl()
    let notificationHelper = LocalNotificationHelper()
    
    badgeControl.updateBadgeNotifications(with: badgeUpdateStore, using: notificationHelper)

}
