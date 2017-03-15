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
    
    var specialDays: SpecialDays!
    
    @IBAction func addNewItem(_ sender: UIButton) {
//        let newItem = itemStore.createItem()
//        
//        if let index = itemStore.allItems.index(of: newItem) {
//            let indexPath = IndexPath(row: index, section: 0)
//            tableView.insertRows(at: [indexPath], with: .automatic)
//        }
    }
    
    @IBAction func toggleEditMode(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ExceptionDatesContainer" {
            let exceptionDaysContainer = segue.destination as! ExceptionDatesContainerTableController
            exceptionDaysContainer.specialDays = specialDays
        }
    }
}

