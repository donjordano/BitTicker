//
//  PairListTableViewCell.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import UIKit

class PairListTableViewCell: UITableViewCell {
    
    func setup(_ pairString: String) {
        let pairLabel = pairString.replacingOccurrences(of: "_", with: " - ")
        self.textLabel?.text = pairLabel
    }
    
}
