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
    
    override func awakeFromNib() {
        super.awakeFromNib()

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
