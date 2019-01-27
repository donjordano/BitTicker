//
//  PairListTableViewCell.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import UIKit

class PairListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pairsLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var pairId: String = ""
    
    func setup(_ pairString: String) {
        let pairLabelText = pairString.replacingOccurrences(of: "_", with: " - ")
        pairsLabel.text = pairLabelText
        if (percentLabel.text?.isEmpty)! {
            indicator.startAnimating()
        }
    }
    
    func update(price: String) {
        percentLabel.text = price
        indicator.stopAnimating()
    }
    
}
