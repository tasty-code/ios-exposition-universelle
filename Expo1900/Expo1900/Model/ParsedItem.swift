//
//  ParsedItem.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/30.
//

import Foundation

struct ParsedItem: JSONParser {
    typealias JSONData = [Item]
    var fileName: String = "items"
    var items: [Item]?
    
    init() {
        items = try? parsingJSON(fileName: fileName)
    }
    
}
