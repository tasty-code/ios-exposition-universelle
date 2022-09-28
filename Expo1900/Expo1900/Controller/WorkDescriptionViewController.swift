//
//  DescriptionViewController.swift
//  Expo1900
//
//  Created by 문성진 on 2022/09/23.
//

import UIKit

class WorkDescriptionViewController: UIViewController {
    var workName: String = .empty
    var workImageName: String = .empty
    var workDescription: String = .empty
    
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
