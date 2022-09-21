//
//  Exposition.swift
//  Expo1900
//
//  Created by 문성진 on 2022/09/21.
//

import Foundation

struct Exposition: Decodable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}
