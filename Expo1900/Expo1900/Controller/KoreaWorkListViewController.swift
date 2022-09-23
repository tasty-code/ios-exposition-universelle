//
//  KoreaWorkListViewController.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/21.
//

import UIKit

class KoreaWorkListViewController: UIViewController {
    var items = [Item]()
    
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let descriptionViewContoller = storyboard.instantiateViewController(withIdentifier: "DescriptionView") as? DescriptionViewController else { return }
        descriptionViewContoller.workName = items[indexPath.row].name
        descriptionViewContoller.workImageName = items[indexPath.row].imageName
        descriptionViewContoller.workDescription = items[indexPath.row].description
        self.navigationController?.pushViewController(descriptionViewContoller, animated: true)
    }
}

extension KoreaWorkListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = workListTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WorkListTableViewCell else { return UITableViewCell() }
        cell.workImageView.image = UIImage(named: items[indexPath.row].imageName)
        cell.workNameLabel.text = items[indexPath.row].name
        cell.workShortDescription.text = items[indexPath.row].shortDescription
        return cell
    }
    
    
}

