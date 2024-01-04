//
//  SecondViewController.swift
//  lesson2612
//
//  Created by Карина Дьячина on 26.12.23.
//

import Foundation
import UIKit
    
class SecondViewController: UIViewController {

  
    
    @IBOutlet weak var recieveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        let backButton = UIButton(type: .system)
//        backButton.setTitle("Back", for: .normal)
//        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
//        backButton.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
//        view.addSubview(backButton)
        let first = ViewController()
       // let second = SecondViewController()
        first.delegate = self
        
       first.sendString()
       // first.sendArray()
      //  first.sendStringArray()
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension SecondViewController: StringDelegate, ArrayDelegate, StringArrayDelegate {
    
    func recieveStringArray(array: [String]) {
        self.recieveLabel.text = "Names: \(array)"
    }
    
    func recieveArray(array: [Int]) {
        //self.recieveLabel.text = "Numbers: \(array)"
    }
    
    func recieveString(text: String) {
       // self.recieveLabel.text = text
        print("Get message: \(text)")
    }

    
}
