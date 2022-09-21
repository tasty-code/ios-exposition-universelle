//
//  JSONDecoder.swift
//  Expo1900
//
//  Created by 천승희 on 2022/09/21.
//

import Foundation

struct ExpoDesc: Decodable {
    let title: String
    let visitors: String
    let location: String
    let duration: String
    let description: String
}
