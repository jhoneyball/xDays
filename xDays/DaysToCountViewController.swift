//
//  DaysToCountViewController.swift
//  xDays
//
//  Created by James Honeyball on 12/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation
import UIKit

class DaysToCountViewController: UIViewController {
    var specialDays: SpecialDays!
    
    @IBOutlet var switchMonday: UISwitch!
    @IBOutlet var switchTuesday: UISwitch!
    @IBOutlet var switchWednesday: UISwitch!
    @IBOutlet var switchThursday: UISwitch!
    @IBOutlet var switchFriday: UISwitch!
    @IBOutlet var switchSaturday: UISwitch!
    @IBOutlet var switchSunday: UISwitch!
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switchMonday.setOn(specialDays.daysToCount.countMondays(),animated: false)
        switchTuesday.setOn(specialDays.daysToCount.countTuesdays(),animated: false)
        switchWednesday.setOn(specialDays.daysToCount.countWednesdays(),animated: false)
        switchThursday.setOn(specialDays.daysToCount.countThursdays(),animated: false)
        switchFriday.setOn(specialDays.daysToCount.countFridays(),animated: false)
        switchSaturday.setOn(specialDays.daysToCount.countSaturdays(),animated: false)
        switchSunday.setOn(specialDays.daysToCount.countSundays(),animated: false)
    }
    
    @IBAction func switchMondayChanged(sender: UISwitch) {
        specialDays.daysToCount.setCountMondays(sender.isOn)
    }
    @IBAction func switchTuesdayChanged(sender: UISwitch) {
        specialDays.daysToCount.setCountTuesdays(sender.isOn)
    }
    @IBAction func switchWednesdayChanged(sender: UISwitch) {
        specialDays.daysToCount.setCountWednesdays(sender.isOn)
    }
    @IBAction func switchThursdayChanged(sender: UISwitch) {
        specialDays.daysToCount.setCountThursdays(sender.isOn)
    }
    @IBAction func switchFridayChanged(sender: UISwitch) {
        specialDays.daysToCount.setCountFridays(sender.isOn)
    }
    @IBAction func switchSaturdayChanged(sender: UISwitch) {
        specialDays.daysToCount.setCountSaturdays(sender.isOn)
    }
    @IBAction func switchSundayChanged(sender: UISwitch) {
        specialDays.daysToCount.setCountSundays(sender.isOn)
    }

}
