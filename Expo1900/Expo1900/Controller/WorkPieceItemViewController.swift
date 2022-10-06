//
//  WorkPieceItemViewController.swift
//  Expo1900
//
//  Created by 임채윤 on 2022/10/05.
//

import UIKit

class WorkPieceItemViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var prepareImage: String?
    var prepareDescriptionLabel: String?
    var prepareTitleName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItems()
    }
    
    func setItems() {
        guard let image = prepareImage,
              let description = prepareDescriptionLabel,
              let title = prepareTitleName else { return }
        
        imageView.image = UIImage(named: image)
        descriptionLabel.text = description
        navigationBar.title = title
    }
    
}
