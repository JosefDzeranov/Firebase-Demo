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
    
    func uploadFile(data: Data) {
        let name =  UUID().uuidString
        let ref = reference.child(name)
        
        ref.putData(data, metadata: nil) { (storage, error) in
            if let error = error {
                debugPrint(error)
            }
            debugPrint("success upload file")
        }
    }
    
    func downloadFile(name:String) -> Data {
        let ref = reference.child(name)
        var data2 = Data()
        ref.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                debugPrint(error)
            }
            if let data = data  {
                 data2 = data
            }
        }
         return data2
    }
    
    
    
}
