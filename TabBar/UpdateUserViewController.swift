//
//  UpdateUserViewController.swift
//  TabBar
//
//  Created by IO Dzeranov on 22.05.17.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import UIKit

class UpdateUserViewController: UIViewController {

    var user: UserModel! = nil
    var reference : ReferenceManager! = nil
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var secondName: UITextField!
    @IBOutlet weak var thirdName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reference = ReferenceManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        debugPrint("user -> ", user)
        firstName.text = user.firstName ?? ""
        secondName.text = user.secondName ?? ""
        thirdName.text = user.thirdName ?? ""
        print("UpdateUserViewController viewWillAppear")
    }

    @IBAction func Update(_ sender: UIButton) {
        reference.updateValue(user: user)
    }
}
