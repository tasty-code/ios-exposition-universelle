//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var visitorCountLabel: UILabel!
    @IBOutlet weak private var venueCityLabel: UILabel!
    @IBOutlet weak private var durationEventLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    let labelMagicNumber = ": "
    var expoDescription: ExpoDescription?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initExpoInfo()
        updateViewData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func initExpoInfo() {
        guard let parsed = ParsedExpoDescription().expoDescription else {
            return
        }
        
        self.expoDescription = parsed
    }
    
    private func updateViewData() {
        if let expoInfo = expoDescription {
            titleLabel.text = expoInfo.title
            visitorCountLabel.text = labelMagicNumber + String(expoInfo.visitors)
            venueCityLabel.text = labelMagicNumber + expoInfo.location
            durationEventLabel.text = labelMagicNumber + expoInfo.duration
            descriptionLabel.text = expoInfo.description
        }
    }
}
