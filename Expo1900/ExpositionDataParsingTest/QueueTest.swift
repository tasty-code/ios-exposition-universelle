//
//  QueueTest.swift
//  ExpositionDataParsingTest
//
//  Created by 박도원 on 2022/10/04.
//

import XCTest
@testable import Expo1900

final class QueueTest: XCTestCase {
    var queue: ItemQueue?
    var relicData = [Item]()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        guard let relicDataAsset = NSDataAsset(name: "items") else {
            return
        }
        let relicJsonDecoder = JSONDecoder()
        
        relicData = try! relicJsonDecoder.decode([Item].self, from: relicDataAsset.data)
        queue = ItemQueue(queue: relicData)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }
    
    func test_dequeue_테스트() {
        let data: Item = queue!.dequeue()!
        
        XCTAssertEqual(data.name, "직지심체요절")
    }
}
