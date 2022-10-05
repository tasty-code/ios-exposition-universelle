//
//  ItemInfoViewController.swift
//  Expo1900
//
//  Created by 박도원 on 2022/10/05.
//

import UIKit

class ItemInfoViewController: UIViewController {
    var itemInfo: Item?
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemData()
    }
    
    func setItemData() {
        guard let data = itemInfo else {
            return
        }
        itemImage.image = UIImage(named: data.image)
        itemDescription.text = data.description
    }
    
}
