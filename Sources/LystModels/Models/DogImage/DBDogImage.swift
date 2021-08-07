//
//  File.swift
//  
//
//  Created by Mohsin Hussain on 07/08/2021.
//

import RealmSwift
import Foundation

final public class DBDogImage: Object {
    
    @objc dynamic public var id = ""
    @objc dynamic public var width = 0
    @objc dynamic public var height = 0
    @objc dynamic public var url = ""
    
    public override static func primaryKey() -> String? {
        return "id"
    }
    

}
