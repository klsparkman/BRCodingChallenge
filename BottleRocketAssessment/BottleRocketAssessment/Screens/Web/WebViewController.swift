//
//  WebViewController.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/17/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
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
    
    // MARK: - Helper Functions
    func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        
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
    
    func setupNavItems() {
        self.navigationItem.leftBarButtonItems = [backBarItem, refreshBarItem, forwardBarItem]
    }
    
    func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = self.bannerGreen
        self.navigationController?.navigationBar.tintColor = self.textWhite
    }
    
    @objc func forwardAction() {
        print("Forward button tapped")
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc func backAction() {
        print("Back button tapped")
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func refreshAction() {
        print("Refresh button tapped")
        webView.reload()
    }
}
