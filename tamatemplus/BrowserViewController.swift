//
//  BrowserViewController.swift
//  tamatemplus
//
//  Created by mohammad abushalhoob on 02/06/2023.
//

import UIKit
import WebKit

final class BrowserViewController: UIViewController {
    private var browserView: BrowserView!
    private var observation: NSKeyValueObservation? = nil
    
    let initLink = "https://tamatemplus.com"
    
    override func loadView() {
        browserView = BrowserView()
        view = browserView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navigation delegate for the web view
        browserView.webView.navigationDelegate = self
        
        // setup action targets for buttons
        setupActions()
        
        // Load the initial URL
        if let url = URL(string: initLink) {
            browserView.webView.load(URLRequest(url: url))
        }
        
        // Observe the estimated progress of the web view
        observation = browserView.webView.observe(\.estimatedProgress, options: [.new]) { [weak self] _, _ in
            guard let self  else { return }
            self.browserView.progressView.progress = Float(self.browserView.webView.estimatedProgress)
        }
    }
    
    // setup action targets for buttons
    private func setupActions() {
        browserView.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        browserView.forwardButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        browserView.refreshButton.addTarget(self, action: #selector(reload), for: .touchUpInside)
        browserView.closeButton.addTarget(self, action: #selector(closeBrowser), for: .touchUpInside)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Remove the observation to avoid memory leaks
        observation = nil
    }
    
    @objc private func goBack() {
        if browserView.webView.canGoBack {
            browserView.webView.goBack()
        }
    }
    
    @objc private func goForward() {
        if browserView.webView.canGoForward {
            browserView.webView.goForward()
        }
    }
    
    @objc private func reload() {
        browserView.webView.reload()
    }
    
    @objc private func closeBrowser() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension BrowserViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        browserView.progressView.progress = 0.0
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        browserView.progressView.progress = 0.0
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        browserView.progressView.progress = 0.0
    }
}
