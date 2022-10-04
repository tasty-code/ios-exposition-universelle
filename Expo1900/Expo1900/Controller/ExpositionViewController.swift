//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitorsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let expositionData = try? JSONParser().getExpositionData() else {
            return
        }
        
        setUiData(from: expositionData)
    }
    
    func setUiData(from data: Exposition) {
        titleLabel.text = data.title
        visitorsLabel.text = "방문객 : \(numberFormatToDecimal(of: data.visitors)) 명"
        locationLabel.text = "개최지 : \(data.location)"
        durationLabel.text = "개최 기간 : \(data.duration)"
        descriptionLabel.text = data.description
    }
    
    func numberFormatToDecimal(of number: Int?) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let newNumber = number, let result = numberFormatter.string(from: NSNumber(value: newNumber)) else {
            return "NaN"
        }
        
        return result
    }
}
