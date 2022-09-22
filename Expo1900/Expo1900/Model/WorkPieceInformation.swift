//
//  WorkPieceInformation.swift
//  Expo1900
//
//  Created by 세윤 on 2022/09/22.
//

import Foundation

struct WorkPieceInformation: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description
    }
}
