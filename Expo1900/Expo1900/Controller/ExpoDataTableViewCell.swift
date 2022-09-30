//
//  ExpoDateCell.swift
//  Expo1900
//
//  Created by 천승희 on 2022/09/30.
//

import UIKit

class ExpoDataTableViewCell: UITableViewCell {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var workImage: UIImageView!
    
    func configure(item: ExpositionData) {
        titleLabel.text = item.name
        descriptionLabel.text = item.shortDesc
        workImage.image = UIImage(named: item.imageName)
    }
}
