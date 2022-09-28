//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var exhibitionData: Exhibition?
    var workPieceInformationData: [WorkPieceInformation]?
    var workPieceInformationList = [WorkPieceInformation]()
    
    func exhibitionDataJsonParsingData() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        let jsonDecoder = JSONDecoder()
        exhibitionData = try? jsonDecoder.decode(Exhibition.self, from: dataAsset.data)
    }
    
    func workPieceInformationJsonParsingData() {
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        let jsonDecoder = JSONDecoder()
        workPieceInformationData = try? jsonDecoder.decode([WorkPieceInformation].self, from: dataAsset.data)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exhibitionDataJsonParsingData()
        workPieceInformationJsonParsingData()
        // Do any additional setup after loading the view.
    }

}

