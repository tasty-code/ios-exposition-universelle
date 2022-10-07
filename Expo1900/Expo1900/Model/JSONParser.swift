//
//  JSONParser.swift
//  Expo1900
//
//  Created by 박도원 on 2022/10/04.
//

import UIKit

class JSONParser {
    enum FileName: String {
        case expositionFile = "exposition_universelle_1900"
        case itemsFile = "items"
    }
    
    func getExpositionData() throws -> Exposition {
        guard let expositionDataAsset = NSDataAsset(name: FileName.expositionFile.rawValue) else {
            throw MyError.expositionParsingError
        }
        let expositionJsonDecoder = JSONDecoder()
        
        guard let expositionData = try? expositionJsonDecoder.decode(Exposition.self, from: expositionDataAsset.data) else{
            throw MyError.expositionParsingError
        }
        return expositionData
    }

    func getItemsData() throws -> [Item] {
        guard let itemDataAsset = NSDataAsset(name: FileName.itemsFile.rawValue) else {
            throw MyError.itemParsingError
        }
        let itemJsonDecoder = JSONDecoder()
        
        guard let itemData = try? itemJsonDecoder.decode([Item].self, from: itemDataAsset.data) else {
            throw MyError.itemParsingError
        }
        
        return itemData
    }
}
