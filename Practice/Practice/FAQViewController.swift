//
//  FAQViewController.swift
//  Practice
//
//  Created by azinavi on 13/2/24.
//

//MARK: Замечания:
/*
1. Добавить валидацию на проверку String на ссылку в методе setupWebView() и убрать один instance variable
 */

import UIKit
import WebKit

class FAQViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlSite = ""
    var htmlName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView(siteURL: urlSite)
        
    }

    func setupWebView(siteURL: String) {
        let url = URL(string: siteURL)
        if !urlSite.isEmpty {
            let request = URLRequest(url: url!)
            self.webView.navigationDelegate = self
            self.webView.load(request)
        } else {
            let htmlPath = Bundle.main.path(forResource: htmlName, ofType: "html")
            let htmlString = try? String(contentsOfFile: htmlPath ?? "")
            self.webView.loadHTMLString(htmlString ?? "", baseURL: Bundle.main.bundleURL)
        }
    }
    
    
}
