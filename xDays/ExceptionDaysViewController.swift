//
//  ExceptionDaysViewController.swift
//  xDays
//
//  Created by James Honeyball on 14/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

protocol ModalViewControllerDelegate
{
    func sendValue(dateReturn : Date)
}

import Foundation
import UIKit

class ExceptionDaysController: UIViewController, ModalViewControllerDelegate {

    var exceptionDaysContainer: ExceptionDatesContainerTableController!
    var specialDays: SpecialDays!
    var dateToAdd: Date?

    
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
        } else if segue.identifier == "ExceptionDateInputController" {
            let exceptionDateInputController = segue.destination as! ExceptionDateInputController
            exceptionDateInputController.delegate = self
        }
    }
    
    internal func sendValue(dateReturn: Date) {
        let newDateItem = DateItem(date: dateReturn, include: false)
        if specialDays.exclusionDates.contains(dateItem: newDateItem) {
            // do nothing
        } else {
            specialDays.exclusionDates.addItem(newDateItem)
            if let index = specialDays.exclusionDates.allDateItems.index(of: newDateItem) {
                let indexPath = IndexPath(row: index, section: 0)
                exceptionDaysContainer.tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }
}
