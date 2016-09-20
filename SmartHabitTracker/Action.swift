//
//  Action.swift
//  SmartHabitTracker
//
//  Created by Daniel Lohse on 9/16/16.
//  Copyright © 2016 Superstudio. All rights reserved.
//

import Foundation


class Action{
    var timestamp : NSDate
    var actionName : String
    
    init(actionName : String) {
        self.actionName = actionName
        self.timestamp = NSDate()
    }
}
