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

    var reference : ReferenceManager!
    override func viewDidLoad() {
        super.viewDidLoad()

        reference = ReferenceManager()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(NewUserViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
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
        reference.setValue(for: user)
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
