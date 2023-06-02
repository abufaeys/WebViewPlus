//
//  BrowserView.swift
//  tamatemplus
//
//  Created by mohammad abushalhoob on 02/06/2023.
//

import UIKit
import WebKit

final class BrowserView: UIView {
// Web view for displaying web content
let webView: WKWebView = {
let webViewConfiguration = WKWebViewConfiguration()
webViewConfiguration.dataDetectorTypes = []
let webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
webView.translatesAutoresizingMaskIntoConstraints = false
return webView
}()
    
// Progress view for indicating page load progress
let progressView: UIProgressView = {
    let progressView = UIProgressView(progressViewStyle: .default)
    progressView.translatesAutoresizingMaskIntoConstraints = false
    return progressView
}()

// Buttons for navigation and actions
let backButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
    return button
}()

let forwardButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
    return button
}()

let refreshButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
    return button
}()

let closeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(systemName: "xmark"), for: .normal)
    return button
}()
    
// Stack view for organizing the buttons
private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .equalSpacing
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.backgroundColor = .darkGray
    return stackView
}()

override init(frame: CGRect) {
    super.init(frame: frame)
    // Set up the layout and add subviews
    setupViews()
    setupConstraints()
}

required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

private func setupViews() {
    addSubview(webView)
    addSubview(progressView)
    addSubview(stackView)
    
    stackView.addArrangedSubview(backButton)
    stackView.addArrangedSubview(forwardButton)
    stackView.addArrangedSubview(refreshButton)
    stackView.addArrangedSubview(closeButton)
}

private func setupConstraints() {
    NSLayoutConstraint.activate([
        progressView.topAnchor.constraint(equalTo: topAnchor),
        progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
        progressView.trailingAnchor.constraint(equalTo: trailingAnchor),
        progressView.heightAnchor.constraint(equalToConstant: 7),
        
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        stackView.heightAnchor.constraint(equalToConstant: 44),
        
        webView.topAnchor.constraint(equalTo: progressView.bottomAnchor),
        webView.leadingAnchor.constraint(equalTo: leadingAnchor),
        webView.trailingAnchor.constraint(equalTo: trailingAnchor),
        webView.bottomAnchor.constraint(equalTo: stackView.topAnchor)
    ])
}


}
