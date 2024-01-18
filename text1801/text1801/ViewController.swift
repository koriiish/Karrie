//
//  ViewController.swift
//  text1801
//
//  Created by Карина Дьячина on 18.01.24.
//

import UIKit

class ViewController: UIViewController {

    let customTextView = CustomTextView(frame: CGRect(x: 5, y: 200, width: 380, height: 300))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customTextView)
    }


}

