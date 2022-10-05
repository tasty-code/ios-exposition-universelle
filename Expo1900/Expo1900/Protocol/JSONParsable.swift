//
//  JSONParser.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/30.
//

import UIKit

protocol JSONParsable {
    associatedtype JSONData: Decodable
    var fileName: String { get set }
}

extension JSONParsable {
    func decodeJSON(fileName: String) throws -> JSONData {
        guard let assetData: NSDataAsset = NSDataAsset(name: fileName) else {
            throw ExpoError.NilPersingData
        }
        do {
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(JSONData.self, from: assetData.data)
            
            return jsonData
        } catch {
            throw ExpoError.FailDecode
        }
    }
}
