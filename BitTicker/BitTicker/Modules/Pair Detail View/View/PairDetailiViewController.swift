//
//  PairDetailiViewController.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import UIKit

class  PairDetailsViewController: RootViewController {
    
    var presenter: PairDetailPresentation!
    
    @IBOutlet weak var lastPriceLabel: UILabel!
    @IBOutlet weak var pairLabel: UILabel!
    @IBOutlet weak var lowestAskLabel: UILabel!
    @IBOutlet weak var highestAskLabel: UILabel!
    @IBOutlet weak var lowestLastLabel: UILabel!
    @IBOutlet weak var highestLastLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    fileprivate func setupView() {
        
    }
}

extension PairDetailsViewController: PairDetailView {
    func showDetails(forTicker ticker: Ticker) {
        pairLabel.text = pairsListData[ticker.tickerId]?.replaceUnderScore()
        lastPriceLabel.text   = NSString(format: "Last Price: %.6f", ticker.lastPrice) as String
        lowestAskLabel.text   = NSString(format: "Lowest ask: %.6f", ticker.lowestAsk) as String
        highestAskLabel.text  = NSString(format: "Hieghest ask: %.6f", ticker.highestAsk) as String
        lowestLastLabel.text  = NSString(format: "Lowest last 24h: %.6f", ticker.lowestTrade24) as String
        highestLastLabel.text = NSString(format: "Highest last 24h: %.6f", ticker.higestTrade24) as String
        percentLabel.text     = NSString(format: "Percent last 24h: %.2f %%", ticker.percent24) as String
    }
}
