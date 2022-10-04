//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by 문성진 on 2022/09/23.
//

import UIKit

class WorkDescriptionViewController: UIViewController {
    @IBOutlet weak private var workImageView: UIImageView!
    @IBOutlet weak private var workLabel: UILabel!
    
    private var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func setItem(item: Item) {
        self.item = item
    }
    
    private func configure() {
        guard let nonOptionalItem = item else { return }
        
        navigationItem.title = nonOptionalItem.name
        workImageView.image = UIImage(named: nonOptionalItem.imageName)
        workLabel.text = nonOptionalItem.description
        
    }
}
