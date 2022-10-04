//
//  ItemQueue.swift
//  Expo1900
//
//  Created by 박도원 on 2022/10/04.
//

import Foundation

struct ItemQueue {
    var queue: [Item]
    var isEmpty: Bool {
        queue.isEmpty
    }
    var count: Int {
        queue.count
    }
    
    init(queue: [Item]) {
        self.queue = queue
    }
    
    mutating func dequeue() -> Item? {
        if !queue.isEmpty {
            return queue.removeFirst()
        }
        
        return nil
    }
}
