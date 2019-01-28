//
//  TickerDataTests.swift
//  BitTickerTests
//
//  Created by Ivan Yordanov on 1/28/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import XCTest
@testable import BitTicker

class TickerDataTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTickerData() {
        let simpleInput = "[1002,null,[114,\"0.01280027\",\"0.01282233\",\"0.01280033\",\"0.00314494\",\"117.77909418\",\"9152.05071751\",0,\"0.01314996\",\"0.01271267\"]]"
        let ticker = Ticker(fromString: simpleInput)
        
        /// Check if Ticker is not nil
        XCTAssertNotNil(ticker)
        
        /// Simple output should look like this:
        /// Ticker(tickerId: "114", lastPrice: 0.01280027, lowestAsk: 0.01282233, highestAsk: 0.01280033, percent24: 0.00314494, higestTrade24: 0.01314996, lowestTrade24: 0.01271267, isFrozen: false)
    }
}
