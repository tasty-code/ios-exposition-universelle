//
//  JSONDecoder.swift
//  Expo1900
//
//  Created by 천승희 on 2022/09/21.
//

import Foundation

struct ExpoDesc: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

struct ExpositionData: Decodable {
    let name: String
    let imageName: String
    let shortDesc: String
    let desc: String
    
    enum CodingKeys: String, CodingKey {
        case name, desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
}
