//
//  WorkPieceItemViewController.swift
//  Expo1900
//
//  Created by 임채윤 on 2022/10/05.
//

import UIKit

class WorkPieceItemViewController: UIViewController {

    @IBOutlet weak var workPieceItemImageView: UIImageView!
    @IBOutlet weak var workPieceItemDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func receiveItem(_ item: WorkPieceInformation) {
        workPieceItemImageView.image = UIImage(named: item.imageName)
    }
}
