//
//  UsersTableViewController.swift
//  TabBar
//
//  Created by IO Dzeranov on 20.05.17.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import UIKit
import FirebaseDatabase
class UsersTableViewController: UITableViewController  {
    
    @IBOutlet var table: UITableView!
    
    var reference : ReferenceManager! = nil
    
    var dataSource : UserController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource  = UserController()
        reference =  ReferenceManager()
        print("UsersTableViewController viewDidLoad")
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        reference.getReference().removeAllObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataSource.removeAllUser()
        //users.removeAll()
        function()
        table.reloadData()
        print("viewWillAppear in UsersTableViewController")
    }
    
    
    func function() {
        reference.getReference().observe(DataEventType.childAdded, with: { [weak self] snapshot in
            guard let numberOfItems = self?.dataSource.users?.count else {
                debugPrint("")
                return
            }
            let user = UserModel(snapshot: snapshot)
            self?.dataSource.addUser(user: user)
            //self?.users.append(user)

            let indexPath = IndexPath(row: numberOfItems, section: 0)
            self?.table.insertRows(at: [indexPath], with: .top)
            
            /*
            let snapshot = snapshot.value as? [String : String] ?? [:]
            let snap = [String](snapshot.values)
            
            debugPrint("snapshot   ", snap)
            
            let user = UserModel(snap[0], snap[3], snap[1])
            user.userId = snap[2]
            self.users.append(user)
            self.tableView.insertRows(at: [IndexPath(row: self.users.count-1, section: 0)], with: UITableViewRowAnimation.automatic)
            */
        })
        
        // ToDo: Implement observer for database changes
        // ToDo: Design and implement separete controller for Database management where all observers will be stored, and data source
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("numberOfRowsInSection")
        return (dataSource.users?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "user_cell", for: indexPath)
        //let currentUser = dataSource.users?[indexPath.row]
        let currentUser = dataSource.getUser(index: indexPath.row)
        
        let cellValue = "\(currentUser.firstName!) \(currentUser.secondName!) \(currentUser.thirdName!)"
        cell.textLabel?.text = cellValue
        cell.detailTextLabel?.text = currentUser.userId
        print("cellforrowat")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { [weak self] (action, indexPath) in
            print("Delete tapped", indexPath.row)
            
            if let userId = self?.dataSource.getUser(index: indexPath.row).userId {
                // firebase reference removal
                self?.reference.deleteValue(id: userId)
                // datasource element removing
                //self?.users.remove(at: indexPath.row)
                self?.dataSource.removeUser(index: indexPath.row)
                // table view element deletion
                self?.table.deleteRows(at: [indexPath
                    ], with: .fade)
            }
        })
        deleteAction.backgroundColor = UIColor.red
 
        
        return [deleteAction]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
       self.performSegue(withIdentifier: "update_segue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare segue")
        debugPrint(String(describing: sender))
        if(segue.identifier == "update_segue"){
            let updateView = segue.destination as! UpdateUserViewController
            let row = sender as! Int
            //let user = self.users[row]
            let user = dataSource.getUser(index: row)
            
            debugPrint("prepare segue, user -> ", user)
            
            updateView.user = user
        }
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
