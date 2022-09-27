//
//  ExpositionError.swift
//  Expo1900
//
//  Created by Schro on 2022/09/27.
//

import Foundation

enum ExpositionError: Error, LocalizedError {
    case parsingError
    var errorDescription: String {
        switch self {
        case .parsingError:
            return "Parsing 실패"
        }
    }
    
}
