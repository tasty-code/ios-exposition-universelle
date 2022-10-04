//
//  JSONParser.swift
//  Expo1900
//
//  Created by 박도원 on 2022/10/04.
//

import UIKit

class JSONParser {
    func getExpositionData() throws -> Exposition {
        guard let expositionDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            throw ParsingError.expositionParsingError
        }
        let expositionJsonDecoder = JSONDecoder()
        
        guard let expositionData = try? expositionJsonDecoder.decode(Exposition.self, from: expositionDataAsset.data) else{
            throw ParsingError.expositionParsingError
        }
        return expositionData
    }

    func getItemsData() throws -> [Item] {
        guard let itemDataAsset = NSDataAsset(name: "items") else {
            throw ParsingError.itemParsingError
        }
        let itemJsonDecoder = JSONDecoder()
        
        guard let itemData = try? itemJsonDecoder.decode([Item].self, from: itemDataAsset.data) else {
            throw ParsingError.itemParsingError
        }
        
        return itemData
    }
}
