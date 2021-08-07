//
//  File.swift
//  
//
//  Created by Mohsin Hussain on 07/08/2021.
//

import Foundation

public struct Dog {
    public var id = 0
    public var name = ""
    public var bred_for = ""
    public var breed_group = ""
    public var life_span = ""
    public var temperament = ""
    public var desc: String? = ""
    public var history: String? = ""
    public var reference_image_id: String = ""
    public var image: DogImage?
    public var version = 0

    public init(id: Int,
                name: String,
                bred_for: String,
                breed_group: String,
                life_span: String,
                temperament: String,
                desc: String?,
                history: String?,
                reference_image_id: String,
                image: DogImage?,
                version: Int) {
        self.id = id
        self.name = name
        self.bred_for = bred_for
        self.breed_group = breed_group
        self.life_span = life_span
        self.temperament = temperament
        self.desc = desc
        self.history = history
        self.reference_image_id = reference_image_id
        self.image = image
        self.version = version
    }

}

// MARK: - Database -

extension Dog {
    
    public init(from dbDog: DBDog) {
        self.id = dbDog.id
        self.name = dbDog.name
        self.bred_for = dbDog.bred_for
        self.breed_group = dbDog.breed_group
        self.life_span = dbDog.life_span
        self.temperament = dbDog.temperament
        self.desc = dbDog.desc
        self.history = dbDog.history
        self.reference_image_id = dbDog.reference_image_id
        self.image = dbDog.image.map { DogImage(from: $0) } 
        self.version = dbDog.version
    }


}
