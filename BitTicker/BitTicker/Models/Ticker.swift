//
//  Ticker.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation

struct Ticker {
    var tickerId: String
    var lastPrice: Double
    var lowestAsk: Double
    var highestAsk: Double
    var percent24: Double
    var higestTrade24: Double
    var lowestTrade24: Double
    var isFrozen: Bool
}
