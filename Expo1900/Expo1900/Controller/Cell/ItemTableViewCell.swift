//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by 박도원 on 2022/09/30.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    var itemInfo: Item?
    
    func setCellData(itemInfo: Item) {
        self.itemInfo = itemInfo
        if let item = self.itemInfo {
            self.itemNameLabel.text = item.name
            self.itemImageView.image = UIImage(named: item.image)
            self.shortDescriptionLabel.text = item.shortDescription
        }
    }
}
 

