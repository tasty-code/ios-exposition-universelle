//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var visitorsLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private var exposition: Exposition?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func getExposition() throws {
        guard let jsonData: NSDataAsset = NSDataAsset(name: "exposition") else {
            throw ExpoError.NilPersingData
        }
        do {
            exposition = try ParserJSON().parsingExpositionJSON(jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func configure() {
        
        do {
            try getExposition()
        } catch {
            print(error.localizedDescription)
        }
        
        if let expodata = exposition {
            titleLabel.text = expodata.title
            visitorsLabel.text = "방문객 : \(DecimalWon(value: expodata.visitors))"
            locationLabel.text = "개최지 : \(expodata.location)"
            durationLabel.text = "개최 기간 : \(expodata.duration)"
            descriptionLabel.text = expodata.description
        }
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func DecimalWon(value: Int) -> String{
        var returnValue: String = ""
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let result = numberFormatter.string(from: NSNumber(value: value)) {
            returnValue = result + " 명"
            return returnValue
        }
        return returnValue
    }
}
