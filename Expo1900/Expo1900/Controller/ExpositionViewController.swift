//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try? setView(from: getExpositionData())
    }
    
    private func getExpositionData() throws -> Exposition {
        guard let expositionData = try? JSONParser().getExpositionData() else {
            throw MyError.expositionParsingError
        }
        
        return expositionData
    }
    
    private func setView(from data: Exposition) {
        let title = data.title
        let visitors: String = "방문객 : "
        let location: String = "개최지 : "
        let duration: String = "개최 기간 : "
        let description = data.description
        
        titleLabel.text = title
        visitorsLabel.text = try? visitors + numberFormatToDecimal(of: data.visitors)
        locationLabel.text = location + data.location
        durationLabel.text = duration + data.duration
        descriptionLabel.text = description
    }
    
    private func numberFormatToDecimal(of number: Int?) throws -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        guard let newNumber = number, let result = numberFormatter.string(from: NSNumber(value: newNumber)) else {
            throw MyError.decimalConversionError
        }
        
        return result + "명"
    }
}
