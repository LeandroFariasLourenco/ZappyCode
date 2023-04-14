//
//  Course.swift
//  ZappyCode
//
//  Created by Leandro Farias Lourenco on 07/03/23.
//

import Foundation

class Course: Codable {
    var title = ""
    var subtitle = ""
    var imageUrl = ""
    var releaseDate = ""
    
    enum CodingKeys: String, CodingKey {
        case title
        case subtitle
        case imageUrl = "image"
    }
}
