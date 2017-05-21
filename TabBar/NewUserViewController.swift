//
//  NewUserViewController.swift
//  TabBar
//
//  Created by IO Dzeranov on 20.05.17.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import UIKit
import FirebaseDatabase

class NewUserViewController: UIViewController {

    var delegate: UserDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(NewUserViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK Outlets
    
    @IBOutlet weak var firstNameLabel: UITextField!
    
    @IBOutlet weak var secondNameLabel: UITextField!
    
    @IBOutlet weak var thirdNameLabel: UITextField!
    
    
    //MARK Actions
    
    @IBAction func addUserButton(_ sender: Any) {
        let newUser = UserModel(firstNameLabel.text!, secondNameLabel.text!, thirdNameLabel.text!)
        AddNewUser(user: newUser)
        firstNameLabel.text = String()
        secondNameLabel.text = String()
        thirdNameLabel.text = String()
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func AddNewUser(user: UserModel){
        
        print("Adding new user - ", user.firstName, user.secondName, user.thirdName)
        delegate.addUser(user: user)
        let ref = Database.database().reference()
        ref.child("users").setValue(user.toAnyObject()) { (error, dbref) in
            if error != nil {
                guard let errorDescription = error?.localizedDescription else { return }
                debugPrint("Error when setting private card reference: ", errorDescription)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
