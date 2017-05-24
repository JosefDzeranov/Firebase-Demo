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
    
    var userId: String!
    var firstName: String!
    var secondName: String!
    var thirdName: String!
    
    var reference: DatabaseReference?
    
    init (_ firstName:String, _ secondName:String, _ thirdName:String) {
        userId = nil
        self.firstName = firstName
        self.secondName = secondName
        self.thirdName = thirdName
        
        reference = nil
    }
    init(){
        
    }
    
    init(snapshot: DataSnapshot) {
        userId = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        
        firstName = snapshotValue["firstName"] as? String ?? ""
        secondName = snapshotValue["secondName"] as? String ?? ""
        thirdName = snapshotValue["thirdName"] as? String ?? ""
        
        reference = snapshot.ref
    }
    
    
    func toAnyObject() -> Any {
        return [
            "userId": userId,
            "firstName": firstName,
            "secondName": secondName,
            "thirdName": thirdName
               ]
    }
}

extension UserModel: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "\(userId), \(firstName), \(secondName), \(thirdName)"
    }
}
