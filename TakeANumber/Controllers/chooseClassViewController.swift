//
//  chooseClassViewController.swift
//  TakeANumber
//
//  Created by caden on 2/13/19.
//  Copyright © 2019 Steven Blair. All rights reserved.
//

import Foundation
import UIKit
import Firebase


class button: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
    }

}

class chooseClass: UITableViewController {
    
   let data = UserDefaults()
    var ref: DatabaseReference!
    var users : [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CIS 300 Queue"
        ref = Database.database().reference(withPath: "/HelpSessions/CIS300/queue")
        
        getUsers()
        
        // MARK: - Navigation Bar options
        // preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // Attaches an event observer at /HelpSessions/CIS300/queue
    // The following closure is executed:
    //     1) Initially when it is attached
    //     2) Whenever something in the queue changes
    func getUsers() {
        ref.observe(.value, with: { snapshot in
            self.users = []
            for usr in snapshot.children.allObjects as! [DataSnapshot] {
                let u = self.createUser(fromSnapshot: usr)
                self.users.append(u)
            }
            self.displayUsers()})
    }
    
    func createUser(fromSnapshot s : DataSnapshot) -> Student {
        let name = s.childSnapshot(forPath: "name").value as! String
        let date = s.childSnapshot(forPath: "dateTime").value as! String
        let status = s.childSnapshot(forPath: "status").value as! String
        return Student(name, date, status)
    }
    
    func displayUsers() {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // The number of rows in the first section is equal to the number of users in the queue
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? users.count : 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        
        let usr = users[indexPath.row]
        
        cell.textLabel?.text = usr.name
        cell.detailTextLabel?.text = (usr.helped) ? "Being helped" : ""
        
        return cell
    }
    
    
    // MARK: - Table view functions
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    
      /*
        let loggedInAs = (savedData.string(forKey: "loggedInAs") == "TA") ? "TA" : "student"
        
        performSegue(withIdentifier: loggedInAs, sender: self)
      */
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        print(tableView.cellForRow(at: indexPath)?.textLabel?.text as! String)
        data.set(tableView.cellForRow(at: indexPath)?.textLabel?.text as! String, forKey: "class")
  
        performSegue(withIdentifier: "moveToStudentView", sender: self)
    }
    
    
    
    
}
