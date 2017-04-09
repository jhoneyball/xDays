//
//  ArchiverNSKeyed.swift
//  xDays
//
//  Created by James Honeyball on 09/04/2017.
//  Copyright © 2017 James Honeyball. All rights reserved.
//

import Foundation

class ArchiverNSKeyed: Archiving {

    func archiveRootObject(_ rootObject: Any, to​File path: String) -> Bool {
        return NSKeyedArchiver.archiveRootObject(rootObject, toFile: path)
    }
}
