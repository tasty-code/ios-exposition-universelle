//
//  ExopoData.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/20.
//

import Foundation

struct ItemsData: Decodable {
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

struct ExpoData: Decodable {
    var title: String
    var visitors: Int
    var location: String
    var duration: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration, description
    }
}
