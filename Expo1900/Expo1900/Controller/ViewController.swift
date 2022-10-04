//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var exhibitionData: Exhibition?
    var workPieceInformationData = [WorkPieceInformation]()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func exhibitionDataJsonParsingData() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        let jsonDecoder = JSONDecoder()
        exhibitionData = try? jsonDecoder.decode(Exhibition.self, from: dataAsset.data)
    }
    
    func workPieceInformationJsonParsingData() {
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        let jsonDecoder = JSONDecoder()
        workPieceInformationData = try! jsonDecoder.decode([WorkPieceInformation].self, from: dataAsset.data)
    }
    
    func setLabel() {
        guard let exhibitionData = exhibitionData else {
            return
        }
        titleLabel.text = exhibitionData.title
        visitorLabel.text = "\(exhibitionData.visitors)"
        locationLabel.text = exhibitionData.location
        durationLabel.text = exhibitionData.duration
        descriptionLabel.text = exhibitionData.description

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exhibitionDataJsonParsingData()
        workPieceInformationJsonParsingData()
        navigationController?.navigationBar.topItem?.backButtonTitle = "메인"
        setLabel()
        
        
        
        
    }
//    print(workPieceInformationData[0].name)

}

