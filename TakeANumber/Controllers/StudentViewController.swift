//
//  StudentVC.swift
//  TakeANumber
//
//  Created by Steven Blair on 2/11/19.
//  Copyright © 2019 Steven Blair. All rights reserved.
//

import UIKit

class StudentViewController : UIViewController {
    let data = UserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for child in self.view.subviews {
            print("something was done")
            if child.restorationIdentifier == "SV_L0" {
                let realChild = child as! UILabel
                
                realChild.text = "Welcome \(data.string(forKey: "userName")!), to \(data.string(forKey: "class")!)"
            }
        }
        
    }
}
