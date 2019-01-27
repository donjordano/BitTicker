//
//  LoginIneractor.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class LoginInteractor: LoginInteractorInput {
    
    // Reference to the Presenter's output interface.
    var presenter: LoginInteractorOutput?
    
    // MARK: Login Use Case
    func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            guard error == nil else {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    switch errorCode {
                    case .wrongPassword:
                        let errorMessage = "Wrong password"
                        self.presenter?.failed(error: errorMessage)
                        print(errorMessage)
                        break
                    case .userNotFound:
                        let errorMessage = "A user with email: \(email) doesn't exist"
                        self.presenter?.failed(error: errorMessage)
                        print(errorMessage)
                        break
                    default:
                        let errorMessage = "Unexpected error \(errorCode.rawValue) please try again!"
                        self.presenter?.failed(error: errorMessage)
                        print(errorMessage)
                    }
                }
                return
            }
            
            //guard let user = user else { return } 
            
            // If login is successful subscribe for WS
            BitPoloniexService.sharedInstance.connect()
            
            self.presenter?.succeed()
        }
    }
    
    // MARK: Register Use Case
    func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard error == nil else {
                self.presenter?.failed(error: "Registrarion failed. Please try again!")
                print("Error \(String(describing: error?.localizedDescription)) please try again!")
                return
            }
            
            self.presenter?.succeed()
        }
    }
}
