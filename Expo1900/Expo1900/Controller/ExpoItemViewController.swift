//
//  ExpoItemViewController.swift
//  Expo1900
//
//  Created by 천승희 on 2022/09/27.
//

import UIKit

class ExpoItemViewController: UIViewController {
    var items: [ExpositionData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initExpoData()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func initExpoData() {
        guard let expoData: NSDataAsset = NSDataAsset.init(name: "items") else {
            return
        }
        let jsonDecoder = JSONDecoder()

        do {
            self.items = try jsonDecoder.decode([ExpositionData].self, from: expoData.data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ExpoItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExpoDataTableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? ExpoDataTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(item: self.items[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let pushVC: ExpoItemDetailViewController = self.storyboard?.instantiateViewController(identifier: "expoItemDetailPage") else {
            return
        }
        pushVC.item = self.items[indexPath.row]
        
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}

extension ExpoItemViewController: UITableViewDelegate {}
