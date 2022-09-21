//
//  ExopoData.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/20.
//

import Foundation

struct Item: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
