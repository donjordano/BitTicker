//
//  PairsListInteractor.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class PairsListInteractor:  PairsListInteractorInput {
    var presenter: PairsListInteractorOutput?
    
    func logOutUser() {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            
            // Unsubscribe from WS service
            BitPoloniexService.sharedInstance.unsubscribeAndDisconnect()
            
            presenter?.signOutSuccedd()
            
        }  catch let signOutError as NSError {
            presenter?.signOutFailed(message: signOutError.localizedDescription)
            print ("Error signing out: %@", signOutError)
        }
    }
}
