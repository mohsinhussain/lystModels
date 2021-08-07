//
//  File.swift
//  
//
//  Created by Mohsin Hussain on 07/08/2021.
//

import Foundation
import ObjectMapper

extension DBDogImage: Mappable {
    public convenience init?(map: Map){
        self.init()
    }


    public func mapping(map: Map) {
        id <- map["id"]
        width <- map["width"]
        height <- map["height"]
        url <- map["url"]
    }
}
