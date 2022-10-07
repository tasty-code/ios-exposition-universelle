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
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        appDelegate?.shouldSupportAllOrientation = true
    }

    private func configure() {
        let exposion = ParsedExposion()
        
        titleLabel.text = exposion.title
        visitorsLabel.text = exposion.visitors
        locationLabel.text = exposion.location
        durationLabel.text = exposion.duration
        descriptionLabel.text = exposion.description
        
        resizeLabel(Mark.visitor, label: visitorsLabel)
        resizeLabel(Mark.location, label: locationLabel)
        resizeLabel(Mark.duration, label: durationLabel)
        
        self.navigationController?.isNavigationBarHidden = true
        
        appDelegate?.shouldSupportAllOrientation = false
    }
    
    private func resizeLabel(_ form: String, label: UILabel) {
        guard let labelText = label.text else { return }
        let NSLabelText = labelText as NSString
        let formRange = NSLabelText.range(of: form.replacingOccurrences(of: ": ", with: ""))
        let contentRange = NSRange(formRange.length...labelText.count-1)
        
        let attribute = NSMutableAttributedString(string: labelText)
        attribute.addAttribute(.font, value: UIFont.preferredFont(forTextStyle: .title3), range: formRange)
        attribute.addAttribute(.font, value: UIFont.preferredFont(forTextStyle: .body), range: contentRange)
        
        label.attributedText = attribute
    }
}
