//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class StartViewController: UIViewController {
    var exposition: Exposition?
    
    private func getExposition() throws {
        guard let jsonData: NSDataAsset = NSDataAsset(name: "exposition") else {
            throw ExpoError.NilPersingData
        }
        do {
            exposition = try PerserJSON().persingExpositionJSON(jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try getExposition()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
}
