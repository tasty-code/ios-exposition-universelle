//
//  JSONDecodable.swift
//  Expo1900
//
//  Created by 천승희 on 2022/10/05.
//

import UIKit

enum DecoderError: Error {
    case invaildFileName
}

protocol JSONDecodable {
    
}

extension JSONDecodable {
    func decodeJSON<U: Decodable>(of name: String) throws -> U {
        guard let expoData: NSDataAsset = NSDataAsset(name: name) else {
            throw DecoderError.invaildFileName
        }

        do {
            let jsonDecoder = JSONDecoder()
            
            return try jsonDecoder.decode(U.self, from: expoData.data)
        } catch {
            throw error
        }
    }
}
