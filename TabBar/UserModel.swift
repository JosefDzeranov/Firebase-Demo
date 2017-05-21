//
//  UserModel.swift
//  TabBar
//
//  Created by IO Dzeranov on 20.05.17.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import UIKit

public class UserModel {
    var firstName:String!
    var secondName:String!
    var thirdName:String!
    
    init (_ firstName:String, _ secondName:String, _ thirdName:String) {
        self.firstName = firstName
        self.secondName = secondName
        self.thirdName = thirdName
    }
}
