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
    @IBOutlet weak var arrowIndicatorImageVIew: UIImageView!
    @IBOutlet weak var deteilsLabel: UILabel!
    
    var pairId: String = ""
    
    func setup(_ pairString: String) {
        let pairLabelText = pairString.replaceUnderScore()
        pairsLabel.text = pairLabelText
        if (percentLabel.text?.isEmpty)! {
            indicator.startAnimating()
        }
    }
    
    func update(price: String) {
        percentLabel.text = price
    }
    
    func updateArrowIndicator(_ isUp: Bool) {
        /// Hide indicator when arrows are shown
        indicator.stopAnimating()
        
        if isUp {
            arrowIndicatorImageVIew.image = R.image.green_arrow()
        } else {
            arrowIndicatorImageVIew.image = R.image.red_arrow()
        }
    }
    
    func updateDetails(_ details: String) {
        deteilsLabel.text = details
    }
    
}
