//
//  ExpositionDataParsingTest.swift
//  ExpositionDataParsingTest
//
//  Created by Schro on 2022/09/22.
//

import XCTest
@testable import Expo1900
final class ExpositionDataParsingTest: XCTestCase {
    
    var expositionData: Exposition?
    var relicData = [Item]()
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        expositionData = nil
    }
    
    func test_박람회_데이터_파싱_여부_확인() {
        var isNotNil: Bool = false
        expositionData = try? JSONParser().getExpositionData()
        
        if expositionData != nil {
            isNotNil = true
        }
        
        XCTAssertTrue(isNotNil)
    }
    
    func test_박람회_데이터_파싱_후_위치변수값_확인() {
        let compareString = "프랑스 파리"
        
        expositionData = try? JSONParser().getExpositionData()
        let location = expositionData?.location
        
        XCTAssertEqual(location, compareString)
    }
    
    func test_아이템_데이터_파싱_후_첫번째_아이템_이름변수값_확인() {
        let compareString = "직지심체요절"
        
        let itemData = try? JSONParser().getItemsData()
        
        XCTAssertEqual(itemData![0].name, compareString)
    }
}
