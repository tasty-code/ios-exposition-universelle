//
//  ExhibitionViewController.swift
//  Expo1900
//
//  Created by 임채윤 on 2022/10/04.
//

import UIKit

class ExhibitionViewController: UIViewController {
    @IBOutlet weak var workPieceItemTableView: UITableView!
    @IBOutlet weak var navigationBarItem: UINavigationItem!
    
    var workPieceInformationData = [WorkPieceInformation]()
    
    let cellName = "workPieceItemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workPieceInformationJsonParsingData()
        workPieceItemTableView.delegate = self
        workPieceItemTableView.dataSource = self
    }
    
    func workPieceInformationJsonParsingData() {
        let jsonDecoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "items"),
              let data = try? jsonDecoder.decode([WorkPieceInformation].self, from: dataAsset.data) else { return }

        workPieceInformationData = data
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationBarItem.title = "한국의 출품작"
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "workPieceItemDetail" {
            if let destination = segue.destination as? WorkPieceItemViewController {
                if let selectedIndex = self.workPieceItemTableView.indexPathForSelectedRow?.row {
                    destination.prepareImage = workPieceInformationData[selectedIndex].imageName
                    destination.prepareDescriptionLabel = workPieceInformationData[selectedIndex].description
                    destination.prepareTitleName = workPieceInformationData[selectedIndex].name
                }
            }
        }
    }
}

extension ExhibitionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workPieceInformationData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let workPieceItemCell = workPieceItemTableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? WorkPieceItemTableViewCell else { return UITableViewCell() }
        
        workPieceItemCell.workPieceItemImageView.image = UIImage(named: workPieceInformationData[indexPath.row].imageName)
        workPieceItemCell.workPieceItemTitleLabel.text = workPieceInformationData[indexPath.row].name
        workPieceItemCell.workPieceItemDescriptionLabel.text = workPieceInformationData[indexPath.row].shortDescription
        
        return workPieceItemCell
    }
}
