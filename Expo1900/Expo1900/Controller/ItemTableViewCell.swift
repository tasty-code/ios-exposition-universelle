//
//  ItemTableViewCell.swift
//  Expo1900
//
//  Created by 박도원 on 2022/09/30.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
