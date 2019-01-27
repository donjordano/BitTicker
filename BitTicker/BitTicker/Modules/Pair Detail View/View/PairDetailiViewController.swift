//
//  PairDetailiViewController.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import UIKit

class  PairDetailiViewController: RootViewController {
    
    @IBOutlet weak var pairLabel: UILabel!
    
    var presenter: PairDetailPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    fileprivate func setupView() {
        
    }
}

extension PairDetailiViewController: PairDetailView {
    func showDetails(forPair pairId: String) {
        pairLabel.text = pairsListData[pairId]
    }

}
