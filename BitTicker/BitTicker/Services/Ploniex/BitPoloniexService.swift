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
            
            /// escape the first message acknowledgement of the subscription.
            if text.count > 12 {
                let ticker = Ticker(fromString: text)
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
