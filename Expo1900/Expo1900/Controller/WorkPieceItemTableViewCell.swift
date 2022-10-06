//
//  ExhibitionTableViewCell.swift
//  Expo1900
//
//  Created by 임채윤 on 2022/10/04.
//

import UIKit

class WorkPieceItemTableViewCell: UITableViewCell {

    @IBOutlet weak var workPieceItemImageView: UIImageView!
    @IBOutlet weak var workPieceItemTitleLabel: UILabel!
    @IBOutlet weak var workPieceItemDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
