//
//  ItemsTableViewController.swift
//  Expo1900
//
//  Created by 박도원 on 2022/10/04.
//

import UIKit

class ItemsTableViewController: UIViewController {
    @IBOutlet private weak var itemTableView: UITableView!
    private var itemList: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try? self.itemList = getItemList()
    }
    
    private func getItemList() throws -> [Item] {
        guard let items: [Item] = try? JSONParser().getItemsData() else {
            throw MyError.itemParsingError
        }
        
        return items
    }
}

extension ItemsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? ItemTableViewCell
        let itemInfoVC = "ItemInfoVC"
        guard let itemInfoVC = self.storyboard?.instantiateViewController(withIdentifier: itemInfoVC) as? ItemInfoViewController else {
            return
        }
        itemInfoVC.itemInfo = cell?.itemInfo
        navigationController?.pushViewController(itemInfoVC, animated: true)
    }
}

extension ItemsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = "ItemCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: itemCell, for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setCellData(itemInfo: itemList[indexPath.row])
        return cell
    }
}
