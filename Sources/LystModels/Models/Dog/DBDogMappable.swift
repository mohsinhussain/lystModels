//
//  File.swift
//  
//
//  Created by Mohsin Hussain on 07/08/2021.
//

import Foundation
import ObjectMapper

extension DBDog: Mappable {
    public convenience init?(map: Map){
        self.init()
    }


    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        bred_for <- map["bred_for"]
        breed_group <- map["breed_group"]
        life_span <- map["life_span"]
        temperament <- map["temperament"]
        desc <- map["description"]
        history <- map["history"]
        reference_image_id <- map["reference_image_id"]
        image <- map["image"]
        version = getDataVersion(for: .dogs)
    }
}
