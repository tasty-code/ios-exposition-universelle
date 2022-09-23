//
//  KoreaWorkListViewController.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/21.
//

import UIKit

class KoreaWorkListViewController: UIViewController {
    var items: [Item]?
    
    @IBOutlet weak var workListTableView: UITableView!
    
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
        workListTableView.delegate = self
        workListTableView.dataSource = self
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

extension KoreaWorkListViewController: UITableViewDelegate {
    
}

extension KoreaWorkListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let value = items else { return 0 }
        return value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = workListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WorkListTableViewCell else { return UITableViewCell() }
        guard let value = items else { return UITableViewCell() }
        cell.workImageView.image = UIImage(named: value[indexPath.row].imageName)
        cell.workNameLabel.text = value[indexPath.row].name
        cell.workShortDescription.text = value[indexPath.row].shortDescription
        return cell
    }
    
    
}

