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

        if let itemData = item {
            setTitle(in: itemData.name)
            setDetailImage(in: itemData.imageName)
            setDetailLabel(in: itemData.desc)
        }
    }
    
    func setTitle(in title: String) {
        self.title = title
    }
    
    func setDetailImage(in imageName: String) {
        detailImage.image = UIImage(named: imageName)
    }
    
    func setDetailLabel(in text: String) {
        detailLabel.text = text
    }
}
