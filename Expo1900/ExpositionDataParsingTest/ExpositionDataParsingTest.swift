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
    
    func test_데이터_파싱_여부_확인() {
        var isNotNil: Bool = false
        guard let expositionDataAsset = NSDataAsset(name: "exposition_universelle_1900.dataset") else {
            return
        }
        let expositionJsonDecoder = JSONDecoder()
        
        expositionData = try? expositionJsonDecoder.decode(Exposition.self, from: expositionDataAsset.data)
        if expositionData != nil {
            isNotNil = true
        }
        
        XCTAssertTrue(isNotNil)
    }
    
    func test_데이터_파싱_후_위치변수값_확인() {
        guard let expositionDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        let expositionJsonDecoder = JSONDecoder()
        
        expositionData = try? expositionJsonDecoder.decode(Exposition.self, from: expositionDataAsset.data)
        let location = expositionData?.location
        
        print(location)
    }
    
    func test() {
        guard let relicDataAsset = NSDataAsset(name: "items") else {
            return
        }
        let relicJsonDecoder = JSONDecoder()
        
        relicData = try! relicJsonDecoder.decode([Item].self, from: relicDataAsset.data)
        
        
        print(relicData[0].name)
    }
}
