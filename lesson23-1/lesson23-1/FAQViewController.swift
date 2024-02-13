//
//  FAQViewController.swift
//  lesson23-1
//
//  Created by Карина Дьячина on 13.02.24.
//

import UIKit
import WebKit

class FAQViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlSite = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView(siteURL: urlSite)
    }
    
    func setupWebView(siteURL: String) {
        guard let url = URL(string: siteURL) else { return }
        let request = URLRequest(url: url)
        self.webView.navigationDelegate = self
        self.webView.load(request)
        webView.allowsLinkPreview = true
    }
}
