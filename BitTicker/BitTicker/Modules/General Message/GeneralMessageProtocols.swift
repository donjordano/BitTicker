//
//  GeneralMessageProtocols.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/28/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import Foundation

// View / Presenter
protocol GeneralMessageViewInjection : class {
    func load(title: String, message: String)
}

protocol GeneralMessagePresenterDelegate : class {
    func viewDidLoad()
}

