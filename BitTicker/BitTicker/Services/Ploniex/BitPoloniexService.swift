//
//  BitPoloniexService.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation
import Starscream

class BitPoloniexService: NSObject, ObservedProtocol {
    
    let statusKey: StatusKey = StatusKey.didReceiveDataKey
    let notification: Notification.Name = .didReceiveDataKeyName
    
    
    /// Singleton
    static let sharedInstance = BitPoloniexService()
    var socket: WebSocket?
    
    override init() {
        super.init()
        socket = WebSocket(url: URL(string: "wss://api2.poloniex.com")!)
    }
    
    /// WS connect and subscribe
    func connect() {
        socket?.connect()
        
        /// onConnect
        socket?.onConnect = {
            print("websocket is connected let's subscribe")
            self.subscribe()
            self.websocketDidReceiveMessage()
        }
    }

    /// WS disconnect
    func disconnect() {
        socket?.disconnect()
        
        /// websocketDidDisconnect
        socket?.onDisconnect = { (error: Error?) in
            print("websocket is disconnected: \(String(describing: error?.localizedDescription))")
        }
    }
    
    /// On receive data
    func websocketDidReceiveMessage() {
        
        /// websocketDidReceiveMessage
        socket?.onText = { (text: String) in
            if text.count > 12 {
                let index = text.index(text.startIndex, offsetBy: 12)
                var beginning = text[index...]
                
                let range = beginning.index(beginning.endIndex, offsetBy: -2)..<beginning.endIndex
                beginning.removeSubrange(range)
                
                let dataArray = beginning.split(separator: ",")
                
                let tickerId  = String(dataArray[0]).replacingOccurrences(of: "\"", with: "")
                let lastPrice = Double(String(dataArray[1]).replacingOccurrences(of: "\"", with: ""))
                let lowestAsk = Double(String(dataArray[2]).replacingOccurrences(of: "\"", with: ""))
                let higestAsk = Double(String(dataArray[3]).replacingOccurrences(of: "\"", with: ""))
                let percent24 = Double(String(dataArray[4]).replacingOccurrences(of: "\"", with: ""))
                let isFrozen = String(dataArray[7]).toBool()
                let higestTrade24 = Double(String(dataArray[8]).replacingOccurrences(of: "\"", with: ""))
                let lowestTrade24 = Double(String(dataArray[9]).replacingOccurrences(of: "\"", with: ""))
                
                
                let ticker = Ticker(tickerId: tickerId,
                                    lastPrice: lastPrice!,
                                    lowestAsk: lowestAsk!,
                                    higestAsk: higestAsk!,
                                    percent24: percent24!,
                                    higestTrade24: higestTrade24!,
                                    lowestTrade24: lowestTrade24!,
                                    isFrozen: isFrozen
                                    )
                
                
                self.notifyObservers(about: ticker)
            }
            
        }
    }
    
    /// Subscribe
    func subscribe() {
        socket?.write(string: "{\"command\": \"subscribe\", \"channel\": 1002}")
    }
    
    
    /// Unsubscribe
    func unsubscribe() {
        socket?.write(string: "{\"command\": \"unsubscribe\", \"channel\": 1002}")
    }
    
    /// Unsubscribe and disconnect
    func unsubscribeAndDisconnect() {
        unsubscribe()
        disconnect()
    }
}
