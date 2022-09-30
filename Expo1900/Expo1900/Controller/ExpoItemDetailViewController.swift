//
//  ExpoItemDetailViewController.swift
//  Expo1900
//
//  Created by 천승희 on 2022/09/29.
//

import UIKit

class ExpoItemDetailViewController: UIViewController {
    @IBOutlet weak private var detailImage: UIImageView!
    @IBOutlet weak private var detailLabel: UILabel!
    var item: ExpositionData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let itemData = item else {
            return
        }
        
        self.title = itemData.name
        detailImage.image = UIImage(named: itemData.imageName)
        detailLabel.text = itemData.desc
    }
}
