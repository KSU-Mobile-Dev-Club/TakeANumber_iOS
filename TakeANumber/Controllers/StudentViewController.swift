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
        
        for child in self.children {
            if child.restorationIdentifier == "SV_B0" {
                let button = child as! UIButton
                button.setTitle(data.string(forKey: "class"), for: .normal)
            }
        }
        
    }
}
