//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var visitorsLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    

    private func configure() {
        let exposion = ParsedExposion()
        
        titleLabel.text = exposion.title
        visitorsLabel.text = exposion.visitors
        locationLabel.text = exposion.location
        durationLabel.text = exposion.duration
        descriptionLabel.text = exposion.description
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
}
