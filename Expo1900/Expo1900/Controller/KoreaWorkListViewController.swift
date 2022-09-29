//
//  KoreaWorkListViewController.swift
//  Expo1900
//
//  Created by 정재근 on 2022/09/21.
//

import UIKit

class KoreaWorkListViewController: UIViewController {
    @IBOutlet weak var workListTableView: UITableView!
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try getItems()
        } catch {
            print(error.localizedDescription)
        }
        workListTableView.dataSource = self
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func getItems() throws {
        guard let jsonData: NSDataAsset = NSDataAsset(name: "items") else {
            throw ExpoError.InvalidNSAssetData
        }
        do {
            items = try ParserJSON().parsingItemJSON(jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDescription" {
            if let destication = segue.destination as? WorkDescriptionViewController {
                if let selectedIndex = self.workListTableView.indexPathForSelectedRow?.row {
                    destication.setItem(item: items[selectedIndex])
                }
            }
        }
    }
}

extension KoreaWorkListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "workListCell"
        guard let cell = workListTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? WorkListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.configure(items[indexPath.row])
        
        return cell
    }
}

