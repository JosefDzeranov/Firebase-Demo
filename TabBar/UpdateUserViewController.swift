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
    
    
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var secondName: UITextField!
    @IBOutlet weak var thirdName: UITextField!
    
    
    @IBAction func Update(_ sender: UIButton) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstName.text = user.firstName ?? ""
        secondName.text = user.secondName ?? ""
        thirdName.text = user.thirdName ?? ""
        print("UpdateUserViewController viewWillAppear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
