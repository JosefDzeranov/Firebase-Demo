//
//  UserModel.swift
//  TabBar
//
//  Created by IO Dzeranov on 20.05.17.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import UIKit
import FirebaseDatabase
public class UserModel {
    
    var userId: DatabaseReference!
    var firstName: String!
    var secondName: String!
    var thirdName: String!
    
    init (_ firstName:String, _ secondName:String, _ thirdName:String) {
        userId = nil
        self.firstName = firstName
        self.secondName = secondName
        self.thirdName = thirdName
    }
    
    func toAnyObject() -> Any {
        return [
            "firstName": firstName,
            "secondName": secondName,
            "thirdName": thirdName
               ]
    }
}
