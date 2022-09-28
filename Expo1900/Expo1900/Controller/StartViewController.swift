//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var visitorsLabel: UILabel!
    @IBOutlet weak private var locationLabel: UILabel!
    @IBOutlet weak private var durationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var exposition: Exposition?

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
    
    private func setViewcontoller() {
        do {
            try getExposition()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func setView() {
        if let expodata = exposition {
            titleLabel.text = expodata.title
            visitorsLabel.text = "방문객 : \(DecimalWon(value: expodata.visitors))"
            locationLabel.text = "개최지 : \(expodata.location)"
            durationLabel.text = "개최 기간 : \(expodata.duration)"
            descriptionLabel.text = expodata.description
        }
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func DecimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))! + " 명"
            
            return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewcontoller()
        setView()
    }
}
