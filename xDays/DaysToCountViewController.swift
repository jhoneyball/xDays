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
        specialDays.setCountMondays(sender.isOn)
    }
    @IBAction func switchTuesdayChanged(sender: UISwitch) {
        specialDays.setCountTuesdays(sender.isOn)
    }
    @IBAction func switchWednesdayChanged(sender: UISwitch) {
        specialDays.setCountWednesdays(sender.isOn)
    }
    @IBAction func switchThursdayChanged(sender: UISwitch) {
        specialDays.setCountThursdays(sender.isOn)
    }
    @IBAction func switchFridayChanged(sender: UISwitch) {
        specialDays.setCountFridays(sender.isOn)
    }
    @IBAction func switchSaturdayChanged(sender: UISwitch) {
        specialDays.setCountSaturdays(sender.isOn)
    }
    @IBAction func switchSundayChanged(sender: UISwitch) {
        specialDays.setCountSundays(sender.isOn)
    }

}
