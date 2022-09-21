//
//  KoreaWorkListViewController.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/21.
//

import UIKit

class KoreaWorkListViewController: UIViewController {
    var items: [Item]?
    
    private func getItems() {
        guard let jsonData: NSDataAsset = NSDataAsset(name: "items") else {
            print(ExpoError.notFindNSAssetData.errorDescription)
            return
        }
        items = PerserJSON().persingItemJSON(jsonData)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getItems()
    }
}
