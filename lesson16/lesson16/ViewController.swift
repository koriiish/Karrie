//
//  ViewController.swift
//  lesson16
//
//  Created by Карина Дьячина on 11.01.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var brownView: CustomBrownView!
    let blueView = BlueView(frame: CGRect(x: 20, y: 150, width: 300, height: 150))
    let orangeView = OrangeView(frame: CGRect(x: 20, y: 400, width: 300, height: 150))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(blueView)
        view.addSubview(orangeView)
    }


}

