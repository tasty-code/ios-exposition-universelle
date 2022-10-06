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
        guard let parsed = ParsedExpositionData().expositionData else {
            return
        }
        
        self.items = parsed
    }
}

extension ExpoItemViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "expoDataTableViewCell"
        guard let cell: ExpoDataTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExpoDataTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(item: self.items[indexPath.row])
        
        return cell
    }
}

extension ExpoItemViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllerIdentifier = "expoItemDetailPage"
        guard let pushVC: ExpoItemDetailViewController = self.storyboard?.instantiateViewController(identifier: viewControllerIdentifier) else {
            return
        }
        pushVC.item = self.items[indexPath.row]
        
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}
