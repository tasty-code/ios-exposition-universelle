//
//  WorkListTableViewCell.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/23.
//

import UIKit

class WorkListTableViewCell: UITableViewCell {

    @IBOutlet weak var workImageView: UIImageView!
    @IBOutlet weak var workNameLabel: UILabel!
    @IBOutlet weak var workShortDescription: UILabel!
    
    var item: Item?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(_ item: Item) {
        self.item = item
        guard let nonOptionalItem = self.item else { return }
        workImageView.image = UIImage(named: nonOptionalItem.imageName)
        workNameLabel.text = nonOptionalItem.name
        workShortDescription.text = nonOptionalItem.shortDescription
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        workImageView.image = nil
        workNameLabel.text = .empty
        workShortDescription.text = .empty
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
