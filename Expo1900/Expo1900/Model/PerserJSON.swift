//
//  PerserJSON.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/21.
//

import Foundation
import UIKit

class PerserJSON {
    
    func persingExpositionJSON(_ jsonData: NSDataAsset) -> Exposition {
        var exposition: Exposition?
        let jsonDecoder = JSONDecoder()
        
        do {
            exposition = try jsonDecoder.decode(Exposition.self, from: jsonData.data)
        } catch {
            print(ExpoError.failDecode.errorDescription)
        }
        if let value = exposition { return value } else { print(ExpoError.nilPersingData.errorDescription) }
    }
    
    func persingItemJSON(_ jsonData: NSDataAsset) -> [Item] {
        var items: [Item] = []
        let jsonDecoder = JSONDecoder()
        
        do {
            items = try jsonDecoder.decode([Item].self, from: jsonData.data)
        } catch {
            print(ExpoError.failDecode.errorDescription)
        }
        return items
    }
}
