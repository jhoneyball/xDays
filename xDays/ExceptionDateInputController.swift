//
//  ExceptionDateInputController.swift
//  xDays
//
//  Created by James Honeyball on 19/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import UIKit

class ExceptionDateInputController: UIViewController  {
    var dateToReturn = Date()
    var delegate:ModalViewControllerDelegate!
    
    @IBAction func touchedDate(_ sender: Any) {
    }
    
    @IBAction func updateDate(sender: UIDatePicker, forEvent event: UIEvent) {
        let simpleReturnDate = SimpleDate(sender.date)
        dateToReturn = simpleReturnDate.date
    }
    
    @IBAction func addNewDate(sender: UIButton) {
        delegate?.sendValue(dateReturn: dateToReturn)
        self.dismiss(animated: true, completion: nil )
        print("done")
    }
    
    @IBAction func cancel(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        print("cancel")
    }
    
    @IBOutlet var datePicker:UIDatePicker!
    
    override func viewDidLoad() {
        datePicker.date = SimpleDate(Date()).date
        datePicker.minimumDate = SimpleDate(Date()).date
    }
}
