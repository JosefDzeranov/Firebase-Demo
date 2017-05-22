//
//  ReferenceManager.swift
//  TabBar
//
//  Created by IO Dzeranov on 21.05.17.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct ReferenceManager {
    private let usersRef = Database.database().reference(withPath: "users")
    
    func setValue(for model: UserModel) {
        let ref = usersRef.childByAutoId()
        model.userId = ref.key
        ref.setValue( model.toAnyObject()) { (error, ref) in
            if error != nil {
                guard let errorDescription = error?.localizedDescription else { return }
                debugPrint("Error when setting private card reference: ", errorDescription)
            }
            print("success send user")
        }
    }
    func deleteValue(id userId: String){
        let ref = usersRef.child(userId)
        ref.removeValue { (error, dbRef) in
            if let error = error {
                debugPrint(error)
            }
            debugPrint("success delete model with id = ", userId)
        }
    }
    
     func getReference() ->DatabaseReference {
        return usersRef
    }
    
}
