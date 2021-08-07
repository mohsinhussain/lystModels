//
//  File.swift
//  
//
//  Created by Mohsin Hussain on 07/08/2021.
//

import Foundation

public struct DogImage {
    public var id = ""
    public var width = 0
    public var height = 0
    public var url = ""

    public init(id: String, width: Int,
                height: Int, url: String) {
        self.id = id
        self.width = width
        self.height = height
        self.url = url
    }
}

// MARK: - Database -

extension DogImage {
    
    public init(from dbDogImage: DBDogImage) {
        self.id = dbDogImage.id
        self.width = dbDogImage.width
        self.height = dbDogImage.height
        self.url = dbDogImage.url
    }


}
