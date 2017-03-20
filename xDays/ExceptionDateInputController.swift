//
//  ExceptionDateInputController.swift
//  xDays
//
//  Created by James Honeyball on 19/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import UIKit

class ExceptionDateInputController: UIViewController  {
    var tempDate = Date()
    var dateSelected = Date()

    @IBAction func updateDate(sender: UIDatePicker, forEvent event: UIEvent) {
        tempDate = sender.date
    }
    
    @IBAction func addNewDate(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        print("done")
    }
    
    @IBAction func cancel(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        print("cancel")
    }
    
}
