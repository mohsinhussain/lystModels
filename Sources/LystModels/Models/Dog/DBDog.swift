//
//  File.swift
//  
//
//  Created by Mohsin Hussain on 07/08/2021.
//

import Foundation
import RealmSwift
import ObjectMapper

final public class DBDog: Object {
    
    @objc dynamic public var id = 0
    @objc dynamic public var name = ""
    @objc dynamic public var bred_for = ""
    @objc dynamic public var breed_group = ""
    @objc dynamic public var life_span = ""
    @objc dynamic public var temperament = ""
    @objc dynamic public var desc = ""
    @objc dynamic public var history = ""
    @objc dynamic public var reference_image_id = ""
    @objc dynamic public var image: DBDogImage?
    @objc dynamic public var version = 0
    
    public override static func primaryKey() -> String? {
        return "id"
    }
    

}
