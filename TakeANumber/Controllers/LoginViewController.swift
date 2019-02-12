//
//  LoginViewController.swift
//  TakeANumber
//
//  Created by Steven Blair on 2/11/19.
//  Copyright © 2019 Steven Blair. All rights reserved.
//


// TODO: Authenticate users

import UIKit

class LoginViewController : UIViewController {
    @IBOutlet weak var nameField: UITextField!
    
    var username : String? {
        return nameField.text
    }
    
    @IBAction func studentSignIn(_ sender: UIButton) {
        performSegue(withIdentifier: "loginToStudent", sender: self)
    }
    
    @IBAction func TASignIn(_ sender: UIButton) {
        performSegue(withIdentifier: "loginToTA", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
