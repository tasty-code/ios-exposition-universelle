//
//  WorkListTableViewCell.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/23.
//

import UIKit

class WorkListTableViewCell: UITableViewCell {

    @IBOutlet weak private var workImageView: UIImageView!
    @IBOutlet weak private var workNameLabel: UILabel!
    @IBOutlet weak private var workShortDescription: UILabel!
    
    
    func configure(_ item: Item) {
        workImageView.image = UIImage(named: item.imageName)
        workNameLabel.text = item.name
        workShortDescription.text = item.shortDescription
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        workImageView.image = nil
        workNameLabel.text = .empty
        workShortDescription.text = .empty
        
    }
}
