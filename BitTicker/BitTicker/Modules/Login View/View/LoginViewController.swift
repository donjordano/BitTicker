//
//  LoginViewController.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation

class LoginViewController: RootViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: LoginPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        if((email.isEmpty ) || (password.isEmpty)) {
            showAlertWith(title: "Error", message: "Email and Password are required", actionTitle: "OK")
        } else {
            presenter.didClickLoginButton(withEmail: email, andPassword: password)
        }
    }
}

extension LoginViewController: LoginView {
    // user is not loged in
    func showLogingView() {
        
    }
    
    // user is loged in
    func showTickerView() {
        
    }
    
    func showAlert(title: String, message: String) {
        showAlertWith(title: title, message: message, actionTitle: "OK")
    }
    
    func showLoaderView(show: Bool) {
        showLoader(show, status: "Sigin...")
    }
}
