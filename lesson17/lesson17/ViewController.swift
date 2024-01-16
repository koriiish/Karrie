//
//  ViewController.swift
//  lesson17
//
//  Created by Карина Дьячина on 16.01.24.
//

import UIKit
import Lottie

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    let lottieAnimationView = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.delegate = self
        passwordTF.isHidden = true
        passwordTF.delegate = self

    }
    
    func isValidEmail(email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            emailTF.resignFirstResponder()
        passwordTF.resignFirstResponder()
            return true
        }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

            if let email = emailTF.text, !isValidEmail(email: email) {
                shakeTextField()
                emailTF.layer.borderColor = UIColor.red.cgColor
                emailTF.layer.borderWidth = 1.0
            } else {
                passwordTF.isHidden = false
                emailTF.layer.borderColor = nil //UIColor.green.cgColor
                emailTF.layer.borderWidth = 0.0 //1.0
                let transition = CATransition()
                    transition.duration = 5.0
                transition.type = CATransitionType.fade
             //   transition.subtype = .fromTop
                passwordTF.layer.add(transition, forKey: "transitionAnimation")

                passwordTF.backgroundColor = UIColor.lightGray
            }
        if passwordTF.text!.count >= 8 {
            animateWithLottie()
            //ну лучше не делать так
            emailTF.removeFromSuperview()
            passwordTF.removeFromSuperview()
            
        }
        }
    
    func shakeTextField() {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true

            let fromPoint = CGPoint(x: emailTF.center.x - 10, y: emailTF.center.y)
            let toPoint = CGPoint(x: emailTF.center.x + 10, y: emailTF.center.y)

            animation.fromValue = NSValue(cgPoint: fromPoint)
            animation.toValue = NSValue(cgPoint: toPoint)

        emailTF.layer.add(animation, forKey: "position")
        }
    
    func animateWithLottie() {
        lottieAnimationView.frame = CGRect(x: 50, y: 100, width: 300, height: 300)
        view.addSubview(lottieAnimationView)
        
 
        if let animation = LottieAnimation.named("PoliteChicky") {
            lottieAnimationView.animation = animation
            lottieAnimationView.loopMode = .loop
            lottieAnimationView.play()
        }
    }
}

