//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoLaunchViewController: UIViewController {
    @IBOutlet weak var expoTitle: UILabel!
    @IBOutlet weak var expoImage: UIImageView!
    @IBOutlet weak var expoVisitorCount: UILabel!
    @IBOutlet weak var expoVenueCity: UILabel!
    @IBOutlet weak var expoDurationEvent: UILabel!
    @IBOutlet weak var expoDescription: UILabel!
    
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
            expoTitle.text = expoInfo.title
            expoImage.image = UIImage(named: "poster")
            expoVisitorCount.text = ": " + String(expoInfo.visitors)
            expoVenueCity.text = ": " + expoInfo.location
            expoDurationEvent.text = ": " + expoInfo.duration
            expoDescription.text = expoInfo.description
        }
    }


}

