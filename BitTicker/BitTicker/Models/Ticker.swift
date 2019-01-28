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
    
    init(fromString data: String) {
        let index = data.index(data.startIndex, offsetBy: 12)
        var beginning = data[index...]
        
        let range = beginning.index(beginning.endIndex, offsetBy: -2)..<beginning.endIndex
        beginning.removeSubrange(range)
        
        let dataArray = beginning.split(separator: ",")
        
        let tickerIdData  = String(dataArray[0]).replacingOccurrences(of: "\"", with: "")
        let lastPriceData = Double(String(dataArray[1]).replacingOccurrences(of: "\"", with: ""))
        let lowestAskData = Double(String(dataArray[2]).replacingOccurrences(of: "\"", with: ""))
        let higestAskData = Double(String(dataArray[3]).replacingOccurrences(of: "\"", with: ""))
        let percent24Data = Double(String(dataArray[4]).replacingOccurrences(of: "\"", with: ""))
        let isFrozenData = String(dataArray[7]).toBool()
        let higestTrade24Data = Double(String(dataArray[8]).replacingOccurrences(of: "\"", with: ""))
        let lowestTrade24Data = Double(String(dataArray[9]).replacingOccurrences(of: "\"", with: ""))
        
        tickerId  = tickerIdData
        lastPrice = lastPriceData ?? 0.0
        lowestAsk = lowestAskData ?? 0.0
        highestAsk = higestAskData ?? 0.0
        percent24 = percent24Data ?? 0.0
        higestTrade24 = higestTrade24Data ?? 0.0
        lowestTrade24 = lowestTrade24Data ?? 0.0
        isFrozen = isFrozenData
    }
}
