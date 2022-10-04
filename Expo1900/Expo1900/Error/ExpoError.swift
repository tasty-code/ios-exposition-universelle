//
//  ExpoError.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/21.
//

import Foundation

enum ExpoError: Error, LocalizedError {
    case InvalidNSAssetData
    case FailDecode
    case NilPersingData
    
    var errorDescription: String {
        switch self {
        case .InvalidNSAssetData:
            return "NSAssetData가 Data파일을 불러오지 못했습니다."
        case .FailDecode:
            return "디코딩에 실패하였습니다."
        case .NilPersingData:
            return "persing된 데이터가 nil값 입니다"
        }
    }
}
