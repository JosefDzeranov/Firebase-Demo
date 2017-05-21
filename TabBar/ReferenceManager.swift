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
    
    func setValue(for model: Any) {
        let id = usersRef.childByAutoId().key+"."
        usersRef.setValue( [id, model]) { (error, ref) in
            if error != nil {
                guard let errorDescription = error?.localizedDescription else { return }
                debugPrint("Error when setting private card reference: ", errorDescription)
            }
            print("success send user")
        }
    }
     func getReference() ->DatabaseReference {
        return usersRef
    }
    
}
