//
//  PairDetailPresenter.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation

class PairDetailPresenter: PairDetailPresentation {
    var view: PairDetailView?
    var wireframe: PairDetailWireframe!
    var ticker: Ticker!
    
    func viewDidLoad() {
        view?.showDetails(forTicker: ticker)
    }
}
