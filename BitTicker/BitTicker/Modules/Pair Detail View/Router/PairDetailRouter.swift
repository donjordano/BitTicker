//
//  PairDetailRouter.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import UIKit

class PairDetailRouter: PairDetailWireframe {
    
    static func assembleModule(_ ticker: Ticker) -> UIViewController {
        let view = R.storyboard.pairDetailStoryboard.pairDetailiViewController()
        let presenter = PairDetailPresenter()
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.ticker = ticker
        
        return view!
    }

}

