//
//  TrendingModel.swift
//  AkshayAssignment
//
//  Created by Akshay Jain on 01/12/20.
//  Copyright © 2020 Akshay Jain. All rights reserved.
//

import UIKit
import ObjectMapper
class TrendingModel: NSObject, Mappable {
    
    var title:String = ""
    var subTitle:String = ""
    var thumbnail:String?
    var value:Float = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        subTitle <- map["subTitle"]
        thumbnail <- map["thumbnail"]
        value <- map["value"]
    }
    
}
