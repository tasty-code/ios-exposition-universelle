//
//  ItemInfoViewController.swift
//  Expo1900
//
//  Created by 박도원 on 2022/10/05.
//

import UIKit

class ItemInfoViewController: UIViewController {
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var itemDescriptionLabel: UILabel!
    var itemInfo: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemData()
    }
    
    func setItemData() {
        guard let data = itemInfo else {
            return
        }
        itemImageView.image = UIImage(named: data.image)
        itemDescriptionLabel.text = data.description
    }
    
}
