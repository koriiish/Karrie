//
//  ViewController.swift
//  WebApp
//
//  Created by berdy on 08.02.24.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate, WKNavigationDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    var backButton: UIButton!
    var forwardButton: UIButton!
    var reloadButton: UIButton!
    
    private var htmlFileUrl: URL {
        let path = Bundle.main.path(forResource: "about", ofType: "html")!
        return URL(fileURLWithPath: path)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //    webViewSetup()
       //  buttonsSetup()
//       webView.isHidden = true
      openHTMLFile()
    }
    
    func webViewSetup() {
        DispatchQueue.main.async {
            let connectedScenes = UIApplication.shared.connectedScenes
            let foregroundActiveScene = connectedScenes.first
            guard
                let currentScene = foregroundActiveScene,
                let windowScene = currentScene as? UIWindowScene,
                let keyWindow = windowScene.keyWindow
            else {
                return
            }
            keyWindow.addSubview(self.webView)
            let url = URL(string: "http://google.com/")!
            let request = URLRequest(url: url)
            self.webView.navigationDelegate = self
            self.webView.load(request)
        }
    }
    
    @IBAction func openSafariWebView(_ sender: Any) {
        if let url = URL(string: "https://www.google.com") {
            let safariViewController = SFSafariViewController(url: url)
            safariViewController.delegate = self
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func openHTMLFile() {
        if let htmlPath = Bundle.main.path(forResource: "about", ofType: "html"),
           let htmlString = try? String(contentsOfFile: htmlPath) {
            webView.loadHTMLString(htmlString, baseURL: Bundle.main.bundleURL)
        }
    }
    
    func buttonsSetup() {
        backButton = createButton(title: "Back", action: #selector(goBack))
        forwardButton = createButton(title: "Forward", action: #selector(goForward))
        reloadButton = createButton(title: "Reload", action: #selector(reload))
        
        webView.addSubview(backButton)
        webView.addSubview(forwardButton)
        webView.addSubview(reloadButton)
        activateConstraints()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        updateButtons()
    }
    
    // MARK: - Actions
    
    @objc func goBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func goForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc func reload() {
        webView.reload()
    }
    
    // MARK: - Helper Methods
    
    func createButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    func updateButtons() {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
    
    func activateConstraints() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            backButton.bottomAnchor.constraint(equalTo: webView.bottomAnchor, constant: -20),
            backButton.leadingAnchor.constraint(equalTo: webView.leadingAnchor, constant: 20),
            
            forwardButton.bottomAnchor.constraint(equalTo: webView.bottomAnchor, constant: -20),
            forwardButton.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 20),
            
            reloadButton.bottomAnchor.constraint(equalTo: webView.bottomAnchor, constant: -20),
            reloadButton.leadingAnchor.constraint(equalTo: forwardButton.trailingAnchor, constant: 20),
        ])
    }}

