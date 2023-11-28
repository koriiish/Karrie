//
//  ViewController.swift
//  2811
//
//  Created by Карина Дьячина on 28.11.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        isPersonAdult(age: 23, name: "Karrie", surname: "Dyachina")
    
       
        func isPersonAdult(age: Int, name: String, surname: String){
            age<=18 ? print ("\(name) \(surname) is not adult"):print ("\(name) \(surname) is adult")
        }
        func devideSmth(a:Int, b:Int) -> Int {
            return a/b
        }
        print(devideSmth(a: 8, b: 4))
    }
    


}

