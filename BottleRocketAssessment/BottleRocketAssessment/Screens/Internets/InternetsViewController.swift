//
//  InternetsViewController.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/13/21.
//

import UIKit
import WebKit

class InternetsViewController: UIViewController, WKUIDelegate {
    
    // MARK: - Properties
    
    let textWhite = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1)
    let bannerGreen = UIColor(red: 67/255.0, green: 232/255.0, blue: 149/255.0, alpha: 1)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavItems()
        guard let myURL = URL(string: "https://www.bottlerocketstudios.com/") else {return}
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    // MARK: - Actions
    
    @objc func forwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc func backAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func refreshAction() {
        webView.reload()
    }
    
    // MARK: - Programmatic properties
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    let forwardBarItem = UIBarButtonItem(image: UIImage(named: "ic_webForward"), style: .plain, target: self, action: #selector(forwardAction))
    
    let backBarItem = UIBarButtonItem(image: UIImage(named: "ic_webBack"), style: .plain, target: self, action: #selector(backAction))
    
    let refreshBarItem = UIBarButtonItem(image: UIImage(named: "ic_webRefresh"), style: .plain, target: self, action: #selector(refreshAction))
    
    let testBackButton = UIBarButtonItem(title: "Test Back", style: .plain, target: self, action: #selector(backAction))
    
    // MARK: - Private
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            webView.leftAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            webView.bottomAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor
                .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    private func setupNavItems() {
        navigationItem.leftBarButtonItems = [backBarItem, refreshBarItem, forwardBarItem]
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.barTintColor = self.bannerGreen
        navigationController?.navigationBar.tintColor = self.textWhite
    }
}
