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
    
    let data = UserDefaults()
    
    @IBAction func editedUsernam(_ sender: UITextField) {
    data.set(sender.text, forKey: "userName")
    }
    let savedData = UserDefaults() //dictionary that is saved throughout project
    
    
    @IBOutlet weak var nameField: UITextField!
    
    var username : String? {
        savedData.set(nameField.text, forKey: "userName")
        return nameField.text
    }
    
    @IBAction func studentSignIn(_ sender: UIButton) {
        //performSegue(withIdentifier: "loginToStudent", sender: self)
        savedData.set("student", forKey: "loggedInAs")
    }
    
    
    
    
    @IBAction func TASignIn(_ sender: UIButton) {
       // performSegue(withIdentifier: "loginToTA", sender: self)
        savedData.set("TA", forKey: "loggedInAs")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
