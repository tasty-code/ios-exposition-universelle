//
//  Relic.swift
//  Expo1900
//
//  Created by Schro on 2022/09/20.
//

import Foundation

struct Item: Decodable {
    let name: String
    let image: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case image = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
