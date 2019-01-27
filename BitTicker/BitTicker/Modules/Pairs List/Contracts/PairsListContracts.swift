//
//  PairsListContracts.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation

protocol PairsListView {
    var presenter: PairsListPresentation! { get set }
    
    func showAlert(title: String, message: String)
}

protocol PairsListPresentation {
    var view: PairsListView? { get set }
    var interactor: PairsListInteractorInput? { get set }
    var router: PairsListWireframe! { get set }
    
    func didClickLogOutButton()
}

// Presenter to Interactor
protocol PairsListInteractorInput {
    var presenter: PairsListInteractorOutput? { get set }
    
    func logOutUser()
}

// Interactor to Presenter
protocol PairsListInteractorOutput {
    func signOutSuccedd()
    func signOutFailed(message: String)
}

protocol PairsListWireframe: class {
    var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
    func presentPairDetailView()
    func dissmisPairListViewOnLogOut()
}
