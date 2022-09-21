//
//  ExopoData.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/20.
//

import Foundation

struct ExpoData: Decodable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}

