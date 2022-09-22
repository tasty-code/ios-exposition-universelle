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
    }
    
    func getExpositionParsingData() {
        guard let expositionDataAsset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        let expositionJsonDecoder = JSONDecoder()
        
        expositionData = try? expositionJsonDecoder.decode(Exposition.self, from: expositionDataAsset.data)
    }
}
