//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var visitorCountLabel: UILabel!
    @IBOutlet weak var venueCityLabel: UILabel!
    @IBOutlet weak var durationEventLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var info: ExpoDesc? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let expoData: NSDataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else {
            return
        }
        let jsonDecoder = JSONDecoder()

        do {
            self.info = try jsonDecoder.decode(ExpoDesc.self, from: expoData.data)
        } catch {
            print(error.localizedDescription)
        }
        
        if let expoInfo = info {
            titleLabel.text = expoInfo.title
            imageView.image = UIImage(named: "poster")
            visitorCountLabel.text = ": " + String(expoInfo.visitors)
            venueCityLabel.text = ": " + expoInfo.location
            durationEventLabel.text = ": " + expoInfo.duration
            descriptionLabel.text = expoInfo.description
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

