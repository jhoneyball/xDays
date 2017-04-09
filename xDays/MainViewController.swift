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
    var persistentObjectStorage: PersistentObjectStorage!
    var daysToGo: DaysToGo!
    var notificationManager: NotificationManager!

    @IBOutlet var xDaysUntilLabel: UILabel!
    @IBOutlet var datePicker:UIDatePicker!

    @IBAction func updateDate(sender: UIDatePicker, forEvent event: UIEvent) {
            targetDate.date = SimpleDate(sender.date).date
            persistentObjectStorage.storeTargetDate(targetDate)

            updateDaysToGo()
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDaysToGo()
        notificationManager.update(from: Date(), to: targetDate.date, with: specialDays)
        datePicker.date = targetDate.date
        datePicker.minimumDate = SimpleDate(Date()).date
    }

    func updateDaysToGo (goingIntoBackground: Bool = false) {
        if goingIntoBackground == true {
            xDaysUntilLabel.text = "  Days To Go Until:"
            notificationManager.update(from: Date(), to: targetDate.date, with: specialDays)
        } else {
            daysToGo = DaysToGo(from: Date(), to: targetDate.date, with: specialDays)
            xDaysUntilLabel.text = "\(daysToGo.days) Days To Go Until:"
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DaysToCount" {
                let daysToCountViewController = segue.destination as! DaysToCountViewController
                daysToCountViewController.specialDays = specialDays
        } else if segue.identifier == "ExceptionDates" {
                let exceptionDaysViewController = segue.destination as! ExceptionDaysController
                exceptionDaysViewController.specialDays = specialDays
        }
    }

    @IBAction func unwindToHere(segue: UIStoryboardSegue) {
        // And we are back
        // let svc = segue.sourceViewController as! TheViewControllerClassYouAreReturningFrom
        // use svc to get mood, action, and place
        updateDaysToGo()

        persistentObjectStorage.storeDaysToCount(specialDays.daysToCount)
        persistentObjectStorage.storeExceptionDates(specialDays.exceptionDates)
    }
}

