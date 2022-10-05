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
    var item: ExpositionData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView()
    }
    
    private func setView() {
        if let itemData = item {
            self.title = itemData.name
            detailImage.image = UIImage(named: itemData.imageName)
            detailLabel.text = itemData.description
        }
    }
}
