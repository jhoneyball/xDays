//
//  ExceptionDaysViewController.swift
//  xDays
//
//  Created by James Honeyball on 14/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation
import UIKit

class ExceptionDaysController: UIViewController {
    
    var exceptionDaysContainer: ExceptionDatesContainerTableController!
    var specialDays: SpecialDays!
    
    @IBAction func addNewItem(_ sender: UIButton) {
        let newDateItem = specialDays.exclusionDates.createItem()
        
       
       if let index = specialDays.exclusionDates.allDateItems.index(of: newDateItem) {
           let indexPath = IndexPath(row: index, section: 0)
           exceptionDaysContainer.tableView.insertRows(at: [indexPath], with: .automatic)
       }
    }
    
    @IBAction func toggleEditMode(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
            exceptionDaysContainer.setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
            exceptionDaysContainer.setEditing(true, animated: true)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ExceptionDatesContainer" {
            exceptionDaysContainer = segue.destination as! ExceptionDatesContainerTableController
            exceptionDaysContainer.specialDays = specialDays
        }
    }
    @IBAction func unwindToHere(segue: UIStoryboardSegue) {
        // And we are back
        // let svc = segue.sourceViewController as! TheViewControllerClassYouAreReturningFrom
        // use svc to get mood, action, and place
    }
}

