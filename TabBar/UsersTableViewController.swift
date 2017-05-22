//
//  UsersTableViewController.swift
//  TabBar
//
//  Created by IO Dzeranov on 20.05.17.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import UIKit
import FirebaseDatabase
class UsersTableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    var reference : ReferenceManager! = nil
    
    var users:[UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reference =  ReferenceManager()
        
        print("UsersTableViewController viewDidLoad")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        reference.getReference().removeAllObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       users.removeAll()
        function()
        table.reloadData()
        print("viewWillAppear in UsersTableViewController")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func function() {
        reference.getReference().observe(DataEventType.childAdded, with: { (snapshot) in
            print("chiladded")
            let  snapshot = snapshot.value as? [String : String] ?? [:]
            let  snap = [String](snapshot.values)
            debugPrint(snap)
            let user = UserModel(snap[2], snap[1], snap[0])
            self.users.append(user)
            self.tableView.insertRows(at: [IndexPath(row: self.users.count-1, section: 0)], with: UITableViewRowAnimation.automatic)
            
        })
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("numberOfRowsInSection")
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "user_cell", for: indexPath)
        let currentUser = users[indexPath.row]
        let cellValue = "\(currentUser.secondName!) \(currentUser.firstName!) \(currentUser.thirdName!)"
        cell.textLabel?.text = cellValue
        print("cellforrowat")
        return cell
    }
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
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
