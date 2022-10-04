//
//  JSONDecoder.swift
//  Expo1900
//
//  Created by 천승희 on 2022/09/21.
//

import Foundation

struct ExpoDescription: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

struct ExpositionData: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description = "desc"
        case imageName = "image_name"
        case shortDescription = "short_desc"
    }
}
