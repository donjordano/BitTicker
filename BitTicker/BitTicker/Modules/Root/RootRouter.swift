//
//  RootRouter.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation

class RootRouter: RootWireframe {
    
    func presentLoginScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = LogiRouter.assemleModule()
    }
    
}
