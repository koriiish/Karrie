//
//  ViewController.swift
//  lesson21-2
//
//  Created by Карина Дьячина on 1.02.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelEmailText: UILabel!
    @IBOutlet weak var labelText: UILabel!
    var blurView = UIVisualEffectView()
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        addBlurView()
       // phoneAttributedText()
      //  emailAttributedText()
    }
    
//    func phoneAttributedText() {
//        // let phoneText = "375-299-6308"
//        let phoneText = "Номер телефона: 375-29-6308980"
//        let phoneAttributedString = NSMutableAttributedString(string: phoneText)
//        let phoneAttributed: [NSAttributedString.Key: Any] = [
//            .font: UIFont(name: "Papyrus", size: 21)!,
//            .foregroundColor: UIColor.blue
//        ]
//        
//        //  let phoneNumberPattern = "\\b[\\d]{3}\\-[\\d]{3}\\-[\\d]{4}\\b"
//        let phoneNumberPattern = "\\b[\\d]{3}\\-[\\d]{2}\\-[\\d]{7}\\b"
//        do {
//            let regex = try NSRegularExpression(pattern: phoneNumberPattern)
//            let matches = regex.matches(in: phoneText, options: [], range: NSRange(location: 0, length: phoneText.utf16.count))
//            for match in matches {
//                let range = match.range
//                phoneAttributedString.addAttributes(phoneAttributed, range: range)
//            }
//        } catch {
//            print("Error")
//        }
//        labelText.attributedText = phoneAttributedString
//    }
    
    func emailAttributedText() {
        let emailText = "For support contact us with email: test@mail.ru"
        let emailAttributedString = NSMutableAttributedString(string: emailText)
        let emailAttributed: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Papyrus", size: 25)!,
            .foregroundColor: UIColor.systemPink,
            .link: "test@mail.ru"
        ]
        
        let emailPattern = "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}\\b"
        do {
            let regex = try NSRegularExpression(pattern: emailPattern)
            let matches = regex.matches(in: emailText, options: [], range: NSRange(location: 0, length: emailText.utf16.count))
            for match in matches {
                let range = match.range
                emailAttributedString.addAttributes(emailAttributed, range: range)
            }
        } catch {
            print("Error")
        }
        labelEmailText.attributedText = emailAttributedString
        labelEmailText.numberOfLines = 2
    }
    
    func phoneAttributedText(text: String) {
        let phoneText = text
        let phoneAttributedString = NSMutableAttributedString(string: phoneText)
        let phoneAttributed: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Papyrus", size: 21)!,
            .foregroundColor: UIColor.red
        ]
        
        //  let phoneNumberPattern = "\\b[\\d]{3}\\-[\\d]{3}\\-[\\d]{4}\\b"
        let phoneNumberPattern = "\\b[\\d]{3}\\-[\\d]{2}\\-[\\d]{7}\\b"
        do {
            let regex = try NSRegularExpression(pattern: phoneNumberPattern)
            let matches = regex.matches(in: phoneText, options: [], range: NSRange(location: 0, length: phoneText.utf16.count))
            for match in matches {
                let range = match.range
                phoneAttributedString.addAttributes(phoneAttributed, range: range)
                blurView.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1){ [self] in
                    self.textField.text = ""
                    blurView.isHidden = true
                    
                }
            }
        } catch {
            print("Error")
        }
        textField.attributedText = phoneAttributedString
    }
    func addBlurView() {
            let blurEffect = UIBlurEffect(style: .regular)
            blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = textField.frame
            blurView.alpha = 0.8
            
         //   blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            blurView.backgroundColor = .red
            blurView.isHidden = true
            
            view.addSubview(blurView)
        }
    
}

extension ViewController: UITextFieldDelegate {
    @objc func textFieldDidChange(textField: UITextField) {
        phoneAttributedText(text: textField.text!)
    }
}
