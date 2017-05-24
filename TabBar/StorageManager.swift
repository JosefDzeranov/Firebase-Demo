//
//  StorageManager.swift
//  TabBar
//
//  Created by Иосиф Дзеранов on 24/05/2017.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import Foundation
import  Firebase

class StorageManager{
    
    let reference = Storage.storage().reference(withPath: "images")
    
    func UploadFile(data:Data) {
        let name =  UUID().uuidString
        let ref = reference.child(name)
        
        ref.putData(data, metadata: nil) { (storage, error) in
            if let error = error {
                debugPrint(error)
            }
            debugPrint("success upload file")
        }
    }
    
}
