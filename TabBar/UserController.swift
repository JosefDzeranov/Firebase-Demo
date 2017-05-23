//
//  UserController.swift
//  TabBar
//
//  Created by Иосиф Дзеранов on 23/05/2017.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import Foundation
class UserController {
    
    var reference : ReferenceManager?
    var users:[String : UserModel]?
    
    init (){
        reference = ReferenceManager()
        users = [:]
    }
    
    func removeAllUser(){
        users?.removeAll()
    }
    func addUser(user:UserModel){
        users?[user.userId] = user
    }
    func getUser(userId: String) -> UserModel?{
        let user = users?[userId]
        return user
    }
    
}
