//
//  UserController.swift
//  TabBar
//
//  Created by Иосиф Дзеранов on 23/05/2017.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import Foundation
class UserController {
    
    var users:[String : UserModel]!
    var rowId:[String]!
    init (){
        users = [:]
        rowId = []
    }
    
    func removeAllUser(){
        users?.removeAll()
        rowId.removeAll()
    }
    func removeUser(userId:String, row: Int){
        users.removeValue(forKey: userId)
        rowId.remove(at: row)
    }
    func removeUser(index: Int){
        let userId = rowId[index]
        rowId.remove(at: index)
        users.removeValue(forKey: userId)
        
        
        //guard let key = users?.keys else {return}
        //let arrayKeys = Array(key)
        //removeUser(userId: arrayKeys[index])
    }
    
    func addUser(user:UserModel){
        users?[user.userId] = user
        rowId.append(user.userId)
    }
    func getUser(userId: String) -> UserModel{
        let user = users?[userId]
        return user!
    }
    func getUser(index: Int) -> UserModel {
        let userId = rowId[index]
        return users[userId] ?? UserModel()
        //guard let values = users?.values else { return UserModel() }
        //let arrayUsers = Array(values)
        //return arrayUsers[index]
    }
    func udpateUser(user: UserModel){
        let userId = user.userId!
        users?[userId] = user
    }
    
}
