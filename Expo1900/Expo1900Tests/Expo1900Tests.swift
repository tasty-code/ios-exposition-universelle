//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by 임채윤 on 2022/09/28.
//

import XCTest
@testable import Expo1900

final class Expo1900Tests: XCTestCase {
    var sut: ViewController!
    
    override func setUpWithError() throws {
        sut = ViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_박람회_json데이터를_잘가져오는지() {
        sut.exhibitionDataJsonParsingData()
        
        let result = sut.exhibitionData?.title
        
        XCTAssertEqual(result, "파리 만국박람회 1900(L'Exposition de Paris 1900)")
    }
}
