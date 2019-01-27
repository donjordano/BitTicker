//
//  PairsListPresenter.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation

class PairsListPresenter: PairsListPresentation {

    var view: PairsListView?
    var interactor: PairsListInteractorInput?
    var router: PairsListWireframe!
    
    func viewDidLoad() {
        
    }
    
    func didSelectPair(_ pair: String) {
        router.presentPairDetailView(forPairId: pair)
    }
    
    func didClickLogOutButton() {
        interactor?.logOutUser()
    }
    
    
}

extension PairsListPresenter: PairsListInteractorOutput {
    func signOutSuccedd() {
         print("SignOut success")
        router?.dissmisPairListViewOnLogOut()
    }
    
    func signOutFailed(message: String) {
        print("SigOunt error: \(message)")
        view?.showAlert(title: "SignOut Error", message: message)
    }
    
    
}
