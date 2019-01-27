//
//  AnimationProtocol.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/27/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import UIKit

protocol AnimationProtocol {}

extension AnimationProtocol where Self: UIView {
    func flash() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.alpha = 1.0
        }) { (animationComplete) in
            if animationComplete == true {
                UIView.animate(withDuration: 0.3, delay: 2.0, options: .curveEaseOut, animations: {
                    self.alpha = 0.0
                }, completion: nil)
            }
        }
    }
}
