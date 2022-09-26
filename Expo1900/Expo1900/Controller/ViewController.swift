//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var expositionData: Exposition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expositionData = expositionParsingData()
        isNotNilData(data: expositionData)
    }
    
    func expositionParsingData() -> Exposition? {
        guard let expositionDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return nil
        }
        let expositionJsonDecoder = JSONDecoder()
        
        let parsingExpositionData = try? expositionJsonDecoder.decode(Exposition.self, from: expositionDataAsset.data)
        
        return parsingExpositionData
    }
    
    func isNotNilData(data: Exposition?) {
        if data == nil {
            setUiData()
        }
    }
    
    func setUiData() {
        
    }
    
}
