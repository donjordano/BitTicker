//
//  PairDetailContracts.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/26/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation

protocol PairDetailView {
    var presenter: PairDetailPresentation! { get set }
    func showDetails(forPair pairId: String)
}

protocol PairDetailPresentation: class {
    var view: PairDetailView? { get set }
    
    func viewDidLoad()
}

protocol PairDetailWireframe: class {
    static func assembleModule(_ pairId: String ) -> UIViewController
}
