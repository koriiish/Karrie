//
//  Homework.swift
//  WebApp
//
//  Created by berdy on 13.02.24.
//

import Foundation
import UIKit
import WebKit

class Homework: UIViewController, WKNavigationDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var webView: WKWebView!
    var urlTextField: UITextField!
    var goButton: UIButton!
    var addBookmarkButton: UIButton!
    var bookmarksTableView: UITableView!
    
    var bookmarks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
