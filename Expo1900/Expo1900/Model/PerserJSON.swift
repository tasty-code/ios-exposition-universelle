//
//  PerserJSON.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/21.
//

import Foundation
import UIKit

class PerserJSON {
    
    func persingExpositionJSON(_ jsonData: NSDataAsset) throws -> Exposition {
        var exposition: Exposition?
        let jsonDecoder = JSONDecoder()
        
        do {
            exposition = try jsonDecoder.decode(Exposition.self, from: jsonData.data)
        } catch {
            throw ExpoError.FailDecode
        }
        guard let value = exposition else { throw ExpoError.NilPersingData }
        return value
    }
    
    func persingItemJSON(_ jsonData: NSDataAsset) throws -> [Item] {
        var items: [Item]?
        let jsonDecoder = JSONDecoder()
        
        do {
            items = try jsonDecoder.decode([Item].self, from: jsonData.data)
        } catch {
            throw ExpoError.FailDecode
        }
        guard let value = items else { throw ExpoError.NilPersingData }
        return value
    }
}
