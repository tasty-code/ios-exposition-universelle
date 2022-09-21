//
//  PerserJSON.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/21.
//

import Foundation
import UIKit

class PerserJSON {
    
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
