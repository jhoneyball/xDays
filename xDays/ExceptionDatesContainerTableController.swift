//
//  ExceptionDatesViewController.swift
//  xDays
//
//  Created by James Honeyball on 15/03/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import UIKit

class ExceptionDatesContainerTableController: UITableViewController {
        var specialDays: SpecialDays!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specialDays.exceptionDates.allDateItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let dateItem = specialDays.exceptionDates.allDateItems[indexPath.row]

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        cell.textLabel?.text = dateFormatter.string(from: dateItem.getDate())
        cell.detailTextLabel?.text = "excluded"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let dateItem = specialDays.exceptionDates.allDateItems[indexPath.row]
            specialDays.exceptionDates.removeItem(dateItem)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
