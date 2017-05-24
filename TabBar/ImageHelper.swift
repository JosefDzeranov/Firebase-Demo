//
//  ImageHelper.swift
//  TabBar
//
//  Created by Иосиф Дзеранов on 24/05/2017.
//  Copyright © 2017 IO Dzeranov. All rights reserved.
//

import Foundation
import UIKit
class ImageHelper {
    
    static func ImagePNGToData(image:UIImage) -> Data{
        let data = UIImagePNGRepresentation(image)
        if let data = data {
            return data
        }
        return Data()
    }
    
    
}
