//
//  UnArchiverNSKeyed.swift
//  xDays
//
//  Created by James Honeyball on 09/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class UnArchiverNSKeyed: UnArchiving {
    
    func unArchiveObject (withFile path: String) -> Any? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: path) as Any?
    }
    
    
}
