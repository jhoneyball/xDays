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
    @IBAction func switchMondayChanged(sender: UISwitch) {
        print("Monday switch is \(sender.isOn)")
    }
    @IBAction func switchTuesdayChanged(sender: UISwitch) {
        print("Tuesday switch is \(sender.isOn)")
    }
    @IBAction func switchWednesdayChanged(sender: UISwitch) {
        print("Wednesday switch is \(sender.isOn)")
    }
    @IBAction func switchThursdayChanged(sender: UISwitch) {
        print("Thursday switch is \(sender.isOn)")
    }
    @IBAction func switchFridayChanged(sender: UISwitch) {
        print("Friday switch is \(sender.isOn)")
    }
    @IBAction func switchSaturdayChanged(sender: UISwitch) {
        print("Saturday switch is \(sender.isOn)")
    }
    @IBAction func switchSundayChanged(sender: UISwitch) {
        print("Sunday switch is \(sender.isOn)")
    }

}
