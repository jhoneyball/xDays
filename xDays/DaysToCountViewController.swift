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
        switchMonday.setOn(specialDays.countMondays(),animated: false)
        switchTuesday.setOn(specialDays.countTuesdays(),animated: false)
        switchWednesday.setOn(specialDays.countWednesdays(),animated: false)
        switchThursday.setOn(specialDays.countThursdays(),animated: false)
        switchFriday.setOn(specialDays.countFridays(),animated: false)
        switchSaturday.setOn(specialDays.countSaturdays(),animated: false)
        switchSunday.setOn(specialDays.countSundays(),animated: false)
    }
    
    @IBAction func switchMondayChanged(sender: UISwitch) {
        print("Monday switch is \(sender.isOn)")
        specialDays.setCountMondays(sender.isOn)
    }
    @IBAction func switchTuesdayChanged(sender: UISwitch) {
        print("Tuesday switch is \(sender.isOn)")
        specialDays.setCountTuesdays(sender.isOn)
    }
    @IBAction func switchWednesdayChanged(sender: UISwitch) {
        print("Wednesday switch is \(sender.isOn)")
        specialDays.setCountWednesdays(sender.isOn)
    }
    @IBAction func switchThursdayChanged(sender: UISwitch) {
        print("Thursday switch is \(sender.isOn)")
        specialDays.setCountThursdays(sender.isOn)
    }
    @IBAction func switchFridayChanged(sender: UISwitch) {
        print("Friday switch is \(sender.isOn)")
        specialDays.setCountFridays(sender.isOn)
    }
    @IBAction func switchSaturdayChanged(sender: UISwitch) {
        print("Saturday switch is \(sender.isOn)")
        specialDays.setCountSaturdays(sender.isOn)
    }
    @IBAction func switchSundayChanged(sender: UISwitch) {
        print("Sunday switch is \(sender.isOn)")
        specialDays.setCountSundays(sender.isOn)
    }

}
