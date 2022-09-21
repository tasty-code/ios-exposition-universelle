//
//  KoreaWorkListViewController.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/21.
//

import UIKit

class KoreaWorkListViewController: UIViewController {
    var items: [Item]?
    
    private func getItems() throws {
        guard let jsonData: NSDataAsset = NSDataAsset(name: "items") else {
            throw ExpoError.InvalidNSAssetData
        }
        do {
            items = try PerserJSON().persingItemJSON(jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try getItems()
        } catch {
            print(error.localizedDescription)
        }
    }
}
