//
//  ParsedExposion.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/30.
//

import Foundation

struct ParsedExposion: JSONParser {
    typealias JSONData = Exposition
    var fileName: String = "exposition"
    
    private(set) var title: String?
    private(set) var visitors: String?
    private(set) var location: String?
    private(set) var duration: String?
    private(set) var description: String?
    
    init() {
        if let exposition = try? parsingJSON(fileName: fileName) {
            self.title = exposition.title
            self.visitors =  formatVisitor(visitor: exposition.visitors)
            self.location = formatLocation(location: exposition.location)
            self.duration = formatDuration(duration: exposition.duration)
            self.description = exposition.description
        }
    }
    
    private func formatVisitor(visitor: Int) -> String{
        var returnValue: String = ""
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let result = numberFormatter.string(from: NSNumber(value: visitor)) {
            returnValue = result + " 명"
            return Mark.visitor + returnValue
        }
        return returnValue
    }
    
    private func formatLocation(location: String) -> String {
        return Mark.location + location
    }
    
    private func formatDuration(duration: String) -> String {
        return  Mark.duration + duration
    }
}
