//
//  LoginContracts.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation


protocol LoginView: class {
    var presenter: LoginPresentation! { get set }
    
    func showLogingView()
    func showTickerView()
    func showAlert(title: String, message: String)
    func showLoaderView(show: Bool)
}

protocol LoginPresentation: class {
    var view: LoginView? { get set }
    var interactor: LoginInteractorInput? { get set }
    var router: LoginWireframe! {  get set }
    
    func viewDidLoad()
    func didClickLoginButton(withEmail email: String, andPassword password: String)
    func showPairsList()
}

// Presenter to interactor
protocol LoginInteractorInput: class {
    var presenter: LoginInteractorOutput? {get set}
    func loginUser(email: String, password: String)
}

// Interactor to presenter
protocol LoginInteractorOutput: class {
    func loginSucceed()
    func loginFailed(error: String)
}

protocol LoginWireframe: class {
    var viewController: UIViewController? { get set }
    
    func presentPairsList()
    static func assemleModule() -> UIViewController
}
