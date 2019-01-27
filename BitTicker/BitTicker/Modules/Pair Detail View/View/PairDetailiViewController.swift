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
    func showDetails(forPair pairId: String) {
        pairLabel.text = pairsListData[pairId]?.replaceUnderScore()
    }

}
