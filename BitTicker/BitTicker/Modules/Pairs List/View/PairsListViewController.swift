//
//  PairsListViewController.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import UIKit

class PairsListViewController: RootViewController, ObserverProtocol {
    @IBOutlet weak var pairsTableView: UITableView!
    
    let statusKey: String = StatusKey.didReceiveDataKey.rawValue
    let notificationOfInterest: Notification.Name  = .didReceiveDataKeyName
    
    var pair_keys: [String] = Array(pairsListData.keys)
    var pairkey_indexPath: [String : IndexPath] = [String : IndexPath]()
    
    var presenter: PairsListPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe(selector: #selector(receiveNotification(_:)))
        
        setupView()
        
        // If login is successful subscribe for WS
        BitPoloniexService.sharedInstance.connect()
    }
    
    /// Remove observer when deinit
    deinit {
        unsubscribe()
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
        pairsTableView.register(UINib(nibName: "PairListTableViewCell", bundle: nil), forCellReuseIdentifier: "PairListTableViewCell")
        
        pairsTableView.reloadData()
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
        return pair_keys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PairListTableViewCell", for: indexPath) as! PairListTableViewCell
        
        cell.selectionStyle = .none
        
        let pairKey = pair_keys[indexPath.row]
        cell.setup(pairsListData[pairKey]!)
        cell.pairId = pairKey
        
        pairkey_indexPath[pairKey] = indexPath
        
        return cell
    }
}

/// handle the notification from the observed and update data
extension PairsListViewController {
    @objc func receiveNotification(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        
        guard let pairData = userInfo[statusKey] else {
            return
        }
        
        guard let ticker: Ticker = pairData as? Ticker else {
            return
        }
        
        let tickerId = ticker.tickerId
        
        guard let path: IndexPath = pairkey_indexPath[tickerId] else {
            return
        }
        
        guard let cell: PairListTableViewCell = pairsTableView.cellForRow(at: path) as? PairListTableViewCell else {
            return
        }
        
        /// change percent for this pair
        cell.percentLabel.text = ticker.lastPrice
        
        /// update cell
        pairsTableView.reloadRows(at: [path], with: .none)
    }
}
