//
//  ThemeModel.swift
//  AkshayAssignment
//
//  Created by Akshay Jain on 01/12/20.
//  Copyright © 2020 Akshay Jain. All rights reserved.
//

import UIKit
import ObjectMapper

class ThemeModel: NSObject, Mappable {
    
    var title:String = ""
    var thumbnail:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        thumbnail <- map["thumbnail"]
    }
    
}
