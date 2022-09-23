//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by 문성진 on 2022/09/23.
//

import UIKit

class DescriptionViewController: UIViewController {
    var workName: String = ""
    var workImageName: String = ""
    var workDescription: String = ""
    
    @IBOutlet weak private var workImageView: UIImageView!
    @IBOutlet weak private var workLabel: UILabel!
    
    private func settingViewController() {
        navigationItem.title = workName
        workImageView.image = UIImage(named: workImageName)
        workLabel.text = workDescription
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        settingViewController()
    }
}
