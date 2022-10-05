//
//  ExpositionError.swift
//  Expo1900
//
//  Created by Schro on 2022/09/27.
//

import Foundation

enum ParsingError: Error, LocalizedError {
    case expositionParsingError, itemParsingError
    var errorDescription: String {
        switch self {
        case .expositionParsingError:
            return "ExpositionParsing 실패"
        case .itemParsingError:
            return "ItemParsing 실패"
        }
    }
    
}
