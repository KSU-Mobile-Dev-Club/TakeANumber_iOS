//
//  LoginViewController.swift
//  TakeANumber
//
//  Created by Steven Blair on 2/11/19.
//  Copyright © 2019 Steven Blair. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {
    @IBOutlet weak var loginField: UITextField!
    var user : String?
    
    @IBAction func login(_ sender: UIButton) {
        user = loginField.text
        // TODO: - authenticate user
        performSegue(withIdentifier: "loginToTAView", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
