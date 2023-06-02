//
//  OpenBrowserViewController.swift
//  tamatemplus
//
//  Created by mohammad abushalhoob on 02/06/2023.
//

import UIKit

final class OpenBrowserViewController: UIViewController {
    // Create and configure the open browser button
    private let openBrowserButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open Browser", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Layout for the open browser button
        openBrowserButtonLayout()
        
    }
    
    private func openBrowserButtonLayout() {
        openBrowserButton.addTarget(self, action: #selector(openBrowser), for: .touchUpInside)
        
        view.addSubview(openBrowserButton)
        
        // Set up constraints for the open browser button
        NSLayoutConstraint.activate([
            openBrowserButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openBrowserButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // Action method for opening the browser
    @objc private func openBrowser() {
        let browserVC = BrowserViewController()
        present(browserVC, animated: true, completion: nil)
    }
}

