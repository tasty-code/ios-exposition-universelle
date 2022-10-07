//
//  ExpositionError.swift
//  Expo1900
//
//  Created by Schro on 2022/09/27.
//

import Foundation

enum MyError: Error, LocalizedError {
    case expositionParsingError, itemParsingError, decimalConversionError
    
    var errorDescription: String {
        switch self {
        case .expositionParsingError:
            return "ExpositionParsing 실패"
        case .itemParsingError:
            return "ItemParsing 실패"
        case .decimalConversionError:
            return "소수 변환 실패"
        }
    }
}
