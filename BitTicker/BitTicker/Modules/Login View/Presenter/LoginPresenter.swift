//
//  LoginPresenter.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation


class LoginPresenter: LoginPresentation {
    
    // Reference to the View (weak to avoid retain cycle).
    weak var view: LoginView?
    
    // Reference to the Interactor's interface.
    var interactor: LoginInteractorInput?
    
    // Reference to the Router
    var router: LoginWireframe!
    
    func viewDidLoad() {
    }
    
    func didClickLoginButton(withEmail email: String, andPassword password: String) {
        view?.showLoaderView(show: true)
        interactor?.loginUser(email: email, password: password)
    }
    
    func showPairsList() {
        self.router.presentPairsList()
    }
}

extension LoginPresenter: LoginInteractorOutput {
    func loginFailed(error: String) {
        print(error)
        view?.showLoaderView(show: false)
        view?.showAlert(title: "Login Error", message: error)
    }
    
    func loginSucceed() {
        print("Login successful")
        view?.showLoaderView(show: false)
        router.presentPairsList()
    }
}
