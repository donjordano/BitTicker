//
//  GeneralMessageViewController.swift
//  BitTicker
//
//  Created by Ivan Yordanov on 1/28/19.
//  Copyright © 2019 Ivan Yordanov. All rights reserved.
//

import UIKit

class GeneralMessageViewController: RootViewController {
    
    public var presenter: GeneralMessagePresenter?
    
    private let titleLabel: UILabel = UILabel()
    private let messageLabel: UILabel = UILabel()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupViews()
        presenter?.viewDidLoad()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

// MARK: - Setup views
extension GeneralMessageViewController {
    
    /**
     * SetupViews
     */
    private func setupViews() {
        view.backgroundColor = .white()
        
        configureSubviews()
        addSubviews()
    }
    
    /**
     * ConfigureSubviews
     */
    private func configureSubviews() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40.0)
        titleLabel.textColor = .black()
        titleLabel.numberOfLines = 2
        titleLabel.adjustsFontSizeToFitWidth = true
        
        messageLabel.font = UIFont.systemFont(ofSize: 14.0)
        messageLabel.textColor = .black()
        messageLabel.numberOfLines = 2
        messageLabel.adjustsFontSizeToFitWidth = true
    }
    
}

// MARK: - Layout & constraints
extension GeneralMessageViewController {
    
    /**
     * Internal struct for layout
     */
    private struct Layout {
        
        struct TitleLabel {
            static let top: CGFloat = 68.0
            static let height: CGFloat = 100.0
            static let width: CGFloat = 276.0
            static let leading: CGFloat = 24.0
        }
        
        struct MessageLabel {
            static let top: CGFloat = 25.0
            static let height: CGFloat = 60.0
            static let leading: CGFloat = 24.0
            static let trailing: CGFloat = 24.0
        }
        
    }
    
    /**
     * Add subviews
     */
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(messageLabel)
        
        // Add validation for iPhone X
        let top: CGFloat = Layout.TitleLabel.top + UIEdgeInsets.safeAreaInsets.top
        
        view.addConstraintsWithFormat("H:|-\(Layout.TitleLabel.leading)-[v0(\(Layout.TitleLabel.width))]", views: titleLabel)
        view.addConstraintsWithFormat("V:|-\(top)-[v0(\(Layout.TitleLabel.height))]", views: titleLabel)
        
        view.addConstraintsWithFormat("H:|-\(Layout.MessageLabel.leading)-[v0]-\(Layout.MessageLabel.trailing)-|", views: messageLabel)
        view.addConstraintsWithFormat("V:[v0]-\(Layout.MessageLabel.top)-[v1(\(Layout.MessageLabel.height))]", views: titleLabel, messageLabel)
    }
    
}

// MARK: - GeneralMessageViewInjection
extension GeneralMessageViewController: GeneralMessageViewInjection {
    
    /**
     * Load information
     *
     * - parameters:
     *      -title: title to show
     *      -message: message to show
     */
    func load(title: String, message: String) {
        titleLabel.text = title
        messageLabel.text = message
    }
    
}
