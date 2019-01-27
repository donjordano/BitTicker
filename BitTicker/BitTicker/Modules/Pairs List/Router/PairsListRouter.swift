//
//  PairsListRouter.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import UIKit

class PairsListRouter: PairsListWireframe {

    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view  = R.storyboard.pairsListStoryboard.pairsListViewController()
        let presenter = PairsListPresenter()
        let interactor = PairsListInteractor()
        let router = PairsListRouter()
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.viewController = view
        
        return view!
    }
    
    func presentPairDetailView(forPairId pairId: String) {
        let pairDetailViewController = PairDetailRouter.assembleModule(pairId)
        viewController?.navigationController?.pushViewController(pairDetailViewController, animated: true)
    }

    func dissmisPairListViewOnLogOut() {
        viewController?.navigationController?.popViewController(animated: true)
    }
   
}
