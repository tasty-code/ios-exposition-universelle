//
//  ExopoData.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/20.
//

import Foundation

struct ExpoData: Codable {
    var name: String
    var imageName: String
    var shortDesc: String
    var desc: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case desc
    }
}

