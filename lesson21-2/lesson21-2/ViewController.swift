//
//  ViewController.swift
//  lesson21-2
//
//  Created by Карина Дьячина on 1.02.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        phoneAttributedText()
    }

    func phoneAttributedText() {
       // let phoneText = "375-299-6308"
        let phoneText = "Номер телефона: 375-29-6308980"
        let phoneAttributedString = NSMutableAttributedString(string: phoneText)
        let phoneAttributed: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Papyrus", size: 21)!,
            .foregroundColor: UIColor.blue
        ]
      
     //  let phoneNumberPattern = "\\b[\\d]{3}\\-[\\d]{3}\\-[\\d]{4}\\b"
        let phoneNumberPattern = "\\b[\\d]{3}\\-[\\d]{2}\\-[\\d]{7}\\b"
        do {
            let regex = try NSRegularExpression(pattern: phoneNumberPattern)
            let matches = regex.matches(in: phoneText, options: [], range: NSRange(location: 0, length: phoneText.utf16.count))
            for match in matches {
                let range = match.range
                phoneAttributedString.addAttributes(phoneAttributed, range: range)
            }
        } catch {
            print("Error")
        }
        labelText.attributedText = phoneAttributedString
    }

}

