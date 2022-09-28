//
//  PerserJSON.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/21.
//

import UIKit

class ParserJSON {
    
    let jsonDecoder = JSONDecoder()
    
    func parsingExpositionJSON(_ jsonData: NSDataAsset) throws -> Exposition {
        var exposition: Exposition?
        
        do {
            exposition = try jsonDecoder.decode(Exposition.self, from: jsonData.data)
        } catch {
            throw ExpoError.FailDecode
        }
        guard let value = exposition else { throw ExpoError.NilPersingData }
        
        return value
    }
    
    func parsingItemJSON(_ jsonData: NSDataAsset) throws -> [Item] {
        var items: [Item]?
        
        
        do {
            items = try jsonDecoder.decode([Item].self, from: jsonData.data)
        } catch {
            throw ExpoError.FailDecode
        }
        guard let value = items else { throw ExpoError.NilPersingData }
        
        return value
    }
}
