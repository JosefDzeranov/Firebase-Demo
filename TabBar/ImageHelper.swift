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
    
    static func imageJPEGToData(image:UIImage) -> Data{
        let data = UIImageJPEGRepresentation(image, 0.5)
        if let data = data {
            return data
        }
        return Data()
    }
    static func dataToImage(data: Data) -> UIImage {
        let image = UIImage(data: data)
        return image!
    }
}
