//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var exhibitionData: Exhibition?
    
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
    
    func setLabel() {
        guard let exhibitionData = exhibitionData else {
            return
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(from: NSNumber(value: exhibitionData.visitors)) else {return}
        
        titleLabel.text = "\(exhibitionData.title)"
        visitorLabel.text = "방문객  : \(result)명"
        locationLabel.text = "개최지  : \(exhibitionData.location)"
        durationLabel.text = "개최기간  : \(exhibitionData.duration)"
        descriptionLabel.text = "\(exhibitionData.description)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exhibitionDataJsonParsingData()
        setLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}

