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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("실행")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemTableViewCell
//            print("가드렛 else")
//            let errorCell = ItemTableViewCell()
//            errorCell.backgroundColor = .yellow
//            errorCell.layer.borderColor = CGColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
//            return errorCell
        
//        print("가드렛 성공")
        cell.itemName.text = itemList[indexPath.row].name
        cell.itemImage.image = UIImage(named: itemList[indexPath.row].image)
        cell.shortDescription.text = itemList[indexPath.row].shortDescription
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
