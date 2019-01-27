//
//  LoginViewController.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import UIKit

class LoginViewController: RootViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: LoginPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "BitTicker"
    }
    
    
    //MARK: IBActions
    @IBAction func loginButtonClicked(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        if (textFieldsAreValid(email, password)) {
            presenter.didClickLoginButton(withEmail: email, andPassword: password)
        }
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        if (textFieldsAreValid(email, password)) {
            presenter.didClickRegisterButton(withEmail: email, andPassword: password)
        }
    }
    
    #warning("TODO: Delete asap") // Only for test purposes and the demo
    @IBAction func fillTestCredentials(_ sender: Any) {
        emailTextField.text = "test@test.com"
        passwordTextField.text = "12341234"
    }
    
    //MARK: Helper methods
    private func textFieldsAreValid(_ email: String, _ password: String) -> Bool {
        
        if((email.isEmpty ) || (password.isEmpty)) {
            showAlertWith(title: "Error", message: "Email and Password are required", actionTitle: "OK")
            return false
        }
        
        return true
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
        showLoader(show, status: "Loading...")
    }
}
