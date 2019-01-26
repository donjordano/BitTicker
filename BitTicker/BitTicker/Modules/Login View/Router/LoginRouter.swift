//
//  LoginRouter.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation

class LogiRouter: LoginWireframe {
    
    weak var viewController: UIViewController?
    
    func presentPairsView() {
        
    }
    
    static func assemleModule() -> UIViewController {
        let view = R.storyboard.loginStoryboard.loginViewController()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = LogiRouter()
        
        let navigation = UINavigationController(rootViewController:  view!)
        
        view?.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        router.viewController = view
        
        return navigation
    }
    
    func presentPairsList() {
        print("Present Pairs list")
    }

}