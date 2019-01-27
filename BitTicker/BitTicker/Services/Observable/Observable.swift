///
///  Observable.swift
///  BitTicker
///
///  Created by Ivan Yordanov on 1/27/19.
///  Copyright © 2019 Ivan Yordanov. All rights reserved.
///

import Foundation

import UIKit

extension Notification.Name {
    static let didReceiveDataKeyName = Notification.Name("com.komyagency.BitTicker.newPrice.data")
}

/// The key to the notification's "userInfo" dictionary.
enum StatusKey: String {
    case didReceiveDataKey
}


/// Adopters of this protocol SUBSCRIBE to and RECEIVE
/// notifications about that entity/resource.
protocol ObserverProtocol {
    var statusKey: String { get }
    var notificationOfInterest: Notification.Name { get }
    func subscribe(selector: Selector)
    func unsubscribe()
}

extension ObserverProtocol {
    func subscribe(selector: Selector) {
        NotificationCenter.default.addObserver(self,
                                               selector: selector,
                                               name: notificationOfInterest,
                                               object: nil)
    }
    
    func unsubscribe() {
        NotificationCenter.default.removeObserver(self,
                                                  name: notificationOfInterest,
                                                  object: nil)
    }
}

/// Adopters of this protocol POST notifications about that entity/resource.
protocol ObservedProtocol {
    var statusKey: StatusKey { get }
    var notification: Notification.Name { get }
    func notifyObservers(about newData: Any) -> Void
}

extension ObservedProtocol {
    
    func notifyObservers(about newData: Any) -> Void {
        NotificationCenter.default.post(name: notification, object: self, userInfo: [statusKey.rawValue : newData])
    }
    
}
