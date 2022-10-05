//
//  ItemsTableViewController.swift
//  Expo1900
//
//  Created by 박도원 on 2022/10/04.
//

import UIKit

class ItemsTableViewController: UIViewController {
    @IBOutlet weak var itemTableView: UITableView!
    var itemList: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let items: [Item] = try? JSONParser().getItemsData() else {
            return
        }
        itemList = items
        
        itemTableView.delegate = self
        itemTableView.dataSource = self
    }
}

extension ItemsTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }

    func setCellData(cell: ItemTableViewCell, data: Item) -> ItemTableViewCell {
        cell.itemInfo = data
        cell.itemNameLabel.text = data.name
        cell.itemImageView.image = UIImage(named: data.image)
        cell.shortDescriptionLabel.text = data.shortDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell = setCellData(cell: cell, data: itemList[indexPath.row])
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? ItemTableViewCell
        guard let itemInfoVC = self.storyboard?.instantiateViewController(withIdentifier: "ItemInfoVC") as? ItemInfoViewController else {
            return
        }
        itemInfoVC.itemInfo = cell?.itemInfo
        navigationController?.pushViewController(itemInfoVC, animated: true)
    }
}
