//
//  PairsListViewController.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import UIKit

class PairsListViewController: RootViewController {

    @IBOutlet weak var pairsTableView: UITableView!
    
    var pair_labels: [String] = Array(pairsListData.values)
    
    var presenter: PairsListPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        pairsTableView.reloadData()
    }
    
    fileprivate func setupView() {
        let logOutButton = UIBarButtonItem(
            title: "LogOut",
            style: .plain,
            target: self,
            action: #selector(didClickSortButton)
        )
        
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.rightBarButtonItem = logOutButton
        navigationItem.title = "BitTicker"
        
        pairsTableView.delegate = self
        pairsTableView.dataSource = self
        pairsTableView.register(PairListTableViewCell.self, forCellReuseIdentifier: "PairListTableViewCell")
    }
    
    @objc fileprivate func didClickSortButton(_ sender: Any?) {
        presenter.didClickLogOutButton()
    }
}

extension PairsListViewController: PairsListView {
    func showAlert(title: String, message: String) {
        showAlertWith(title: title, message: message, actionTitle: "OK")
    }
}

extension PairsListViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pair_labels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PairListTableViewCell", for: indexPath) as! PairListTableViewCell
        
        cell.selectionStyle = .none
        
        cell.setup(pair_labels[indexPath.row])
        
        return cell
    }


}
