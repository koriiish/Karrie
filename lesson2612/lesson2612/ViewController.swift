//
//  ViewController.swift
//  lesson2612
//
//  Created by Карина Дьячина on 26.12.23.
//

import UIKit

protocol StringDelegate: AnyObject {
    func recieveString(text: String)
}

protocol ArrayDelegate: AnyObject {
    func recieveArray(array: [Int])
}

protocol StringArrayDelegate: AnyObject {
    func recieveStringArray(array: [String])
}
class ViewController: UIViewController {
    
    weak var delegate: StringDelegate?
   // weak var delegate: ArrayDelegate?
  //  weak var delegate: StringArrayDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    @IBAction func buttin(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let secondVC: UIViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.modalPresentationStyle = .fullScreen
        
        if let navigationController = navigationController {
            navigationController.pushViewController(secondVC, animated: true)
        } else {
            let navController = UINavigationController(rootViewController: secondVC)
            navController.navigationBar.prefersLargeTitles = true
            present(navController, animated: true, completion: nil)
        }
    }
    func sendString() { // вне вью дид лоуда
        let message = "Send message to other screen"
        delegate?.recieveString(text: message)
    }
//    func sendArray() {
//        let array = [1, 3, 2, 8, 4]
//       // let sortedArray = array.sorted()
//        delegate?.recieveArray(array: array.sorted())// так можно но лучше создать переменную и в ней сортировать
//    }
//    func sendStringArray() {
//        let stringArray = ["Victor", "Maria", "Olivia"]
//        let uppercasedArray = stringArray.description.uppercased()
//        delegate?.recieveStringArray(array: [uppercasedArray])
//    }
}
