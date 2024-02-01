//
//  ViewController.swift
//  lesson21
//
//  Created by Карина Дьячина on 1.02.24.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    var blurView = UIVisualEffectView()

    override func viewDidLoad() {
        super.viewDidLoad()
        attributedString()
       // attributedTextView()
        addBlurView()
    }
    
    func attributedString() {
        let plainString = "Нажмите здесь, чтобы увидеть эффекты."
        
        let attributedString = NSMutableAttributedString(string: plainString)
        
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: NSRange(location: 0, length: 7))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location: 8, length: 24))
        
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
        
        attributedString.addAttribute(NSAttributedString.Key.link, value: "your url", range: NSRange(location: 14, length: 22))
    
    let label = UILabel()
            
            label.attributedText = attributedString
        //    label.font = UIFont(name: "Oatmilk", size: 22)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(tapGesture)
            
            label.frame = CGRect(x: 20, y: 100, width: 300, height: 100)
            view.addSubview(label)
        }
@objc func labelTapped(_ gesture: UITapGestureRecognizer) {
        print("Press text")
        
        let location = gesture.location(in: gesture.view)
        
        if let tappedCharacterIndex = getTappedCharacterIndex(at: location) {
            print("Pressed text \(tappedCharacterIndex)")
            UIApplication.shared.open(URL(string: "https://teachmeskills.by/")!, options: [:], completionHandler: nil)
        }
    }
func getTappedCharacterIndex(at location: CGPoint) -> Int? {
        guard let label = view.subviews.compactMap({ $0 as? UILabel }).first else {
            return nil
        }
        
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: label.bounds.size)
        let textStorage = NSTextStorage(attributedString: label.attributedText ?? NSAttributedString())
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        textContainer.size = label.bounds.size
        
        let characterIndex = layoutManager.characterIndex(for: location, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return characterIndex
    }
    func attributedTextView() {
            let plainText = "There you can read The Privacy Policy"
            let attributedString = NSMutableAttributedString(string: plainText)
            if let privacyPolicyRange = plainText.range(of: "The Privacy Policy") {
                let nsRange = NSRange(privacyPolicyRange, in: plainText)
                
                attributedString.addAttribute(NSAttributedString.Key.link, value: "https://www.example.com/privacy-policy", range: nsRange)
                attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: nsRange)
                attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: nsRange)
            }
        let textView = UITextView()
                textView.attributedText = attributedString
                
                textView.delegate = self
                
                textView.isSelectable = true
                textView.isEditable = false
                
                textView.frame = CGRect(x: 20, y: 600, width: 300, height: 100)
                view.addSubview(textView)
            }
        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
                UIApplication.shared.open(URL, options: [:], completionHandler: nil)
                return false
            }
    func addBlurView() {
        let blurEffect = UIBlurEffect(style: .regular)
            blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = view.bounds
            blurView.alpha = 0.7
            blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           // blurView.backgroundColor = .black
            
    //        blurView.isHidden = true
            
            view.addSubview(blurView)
            
        }
}

