//
//  Relic.swift
//  Expo1900
//
//  Created by Schro on 2022/09/20.
//

import UIKit

struct Relic: Codable {
    var name: String
    var image: String
    var shortDesc: String
    var desc: String
    
    enum CodingKeys: String, CodingKey {
        case name, desc
        case image = "image_name"
        case shortDesc = "short_desc"
    }
}
