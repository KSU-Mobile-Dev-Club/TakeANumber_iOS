//
//  User.swift
//  TakeANumber
//
//  Created by Steven Blair on 2/10/19.
//  Copyright © 2019 Steven Blair. All rights reserved.
//

import Foundation

class User : CustomStringConvertible {

    let name : String
    let joinedAt : Date
    let helped : Bool
    
    var description: String
    
    private var dateFormatter = ISO8601DateFormatter()
    
    
    init(_ name : String, _ joinedAt : String, _ status: String) {
        self.name = name
        self.joinedAt = dateFormatter.date(from: joinedAt)!
        self.helped = (status == "being_helped") ? true : false
        
        self.description = "Name : \(name) Joined at: \(joinedAt) Status \(status)"
    }
    
}
