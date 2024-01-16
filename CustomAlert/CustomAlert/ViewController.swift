//
//  ViewController.swift
//  CustomAlert
//
//  Created by berdy on 16.01.24.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var circleView: CircleView!
    
    let animatedView = UIView()
    let animatedLayer = CALayer()
    let shapeLayer = CAShapeLayer()
    let gradientLayer = CAGradientLayer()
    let lottieAnimationView = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let customAlert = CustomAlertView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        customAlert.setTitle("Это заголовок алерта")
        customAlert.setCancelButtonTitle("Отмена")
        customAlert.setConfirmButtonTitle("Подтвердить")

        view.addSubview(customAlert)
        customAlert.center = view.center
        circleView.isHidden = true
        
//        if let circleView = Bundle.main.loadNibNamed("CircleView", owner: self, options: nil)?.first as? CircleView {
//            circleView.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
//
//            circleView.backgroundColor = UIColor.blue
//            view.addSubview(circleView)
//            self.circleView = circleView
//        }
    }
    
    func animatedCustomView() {
        animatedView.frame = CGRect(x: 50, y: 100, width: 100, height: 100)
        animatedView.backgroundColor = UIColor.blue
        view.addSubview(animatedView)

        UIView.animate(withDuration: 2.0) {
            self.animatedView.center = CGPoint(x: self.view.center.x, y: 300)
        }
        
        // change scale
//        UIView.animate(withDuration: 2.0) {
//            self.animatedView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//        }
        
        // rotation
//        UIView.animate(withDuration: 2.0) {
//            self.animatedView.transform = CGAffineTransform(rotationAngle: .pi)
//        }
        
        // ease in out animation
        
//        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
//            self.animatedView.center = CGPoint(x: self.view.center.x, y: 300)
//        }, completion: nil)
        
        
        // return scale
        
//        UIView.animate(withDuration: 2.0, delay: 0.0, options: .autoreverse, animations: {
//            self.animatedView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//        }, completion: nil)
        
        //repeat animation
//        UIView.animate(withDuration: 2.0, delay: 0.0, options: .repeat, animations: {
//            self.animatedView.center = CGPoint(x: self.view.center.x, y: 300)
//        }, completion: nil)
        
        // with 2 options
//        UIView.animate(withDuration: 1.0,
//                       delay: 0.5,
//                       options: [.curveEaseInOut, .autoreverse],
//                       animations: {
//            self.animatedView.center = CGPoint(x: self.view.center.x, y: 300)
//        }, completion: { finished in
//            if finished {
//                print("Анимация завершена успешно.")
//            }
//        })
        
        // spring animation
//        UIView.animate(withDuration: 1.5,
//                       delay: 0.0,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0.0,
//                       options: [],
//                       animations: {
//            self.animatedView.center = CGPoint(x: self.view.center.x, y: 300)
//        }, completion: nil)
        
        // animation with using key
//        let animationKey = "moveAnimation"
//
//        UIView.animate(withDuration: 2.0,
//                       animations: {
//            self.animatedView.center = CGPoint(x: self.view.center.x, y: 300)
//        },
//                       completion: { finished in
//            if finished {
//                print("Анимация завершена успешно.")
//            }
//            self.animatedView.layer.add(CAKeyframeAnimation(keyPath: "position"), forKey: animationKey)
//        })
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            self.animatedView.layer.removeAnimation(forKey: animationKey)
//        }
        
        // change animation with transition
        
//        let transition = CATransition()
//        transition.duration = 1.0
//        transition.type = CATransitionType.fade
//        animatedView.layer.add(transition, forKey: "transitionAnimation")
//
//        animatedView.backgroundColor = UIColor.blue
        
        // animate move with CAKeyframeAnimation
//        let keyframeAnimation = CAKeyframeAnimation(keyPath: "position")
//        keyframeAnimation.values = [
//            NSValue(cgPoint: animatedView.center),
//            NSValue(cgPoint: CGPoint(x: 150, y: 200)),
//            NSValue(cgPoint: CGPoint(x: 250, y: 100)),
//            NSValue(cgPoint: animatedView.center)
//        ]
//        keyframeAnimation.keyTimes = [0.0, 0.33, 0.66, 1.0]
//        keyframeAnimation.timingFunctions = [
//            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn),
//            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut),
//            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        ]
//        keyframeAnimation.duration = 3.0
//        animatedView.layer.add(keyframeAnimation, forKey: "positionAnimation")
    }
    
    func animationWithLayer()  {
        animatedLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        animatedLayer.position = CGPoint(x: 100, y: 100)
        animatedLayer.backgroundColor = UIColor.orange.cgColor
        
        view.layer.addSublayer(animatedLayer)
        
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.fromValue = UIColor.orange.cgColor
        colorAnimation.toValue = UIColor.blue.cgColor
        colorAnimation.duration = 2.0
        animatedLayer.add(colorAnimation, forKey: "colorAnimation")
        
        
    }
    
    func animationWithShapeLayer() {
        let path = UIBezierPath(arcCenter: CGPoint(x: 150, y: 150), radius: 50, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        
        view.layer.addSublayer(shapeLayer)
        
        let morphAnimation = CABasicAnimation(keyPath: "path")
        morphAnimation.toValue = UIBezierPath(ovalIn: CGRect(x: 100, y: 100, width: 100, height: 100)).cgPath
        morphAnimation.duration = 2.0
        shapeLayer.add(morphAnimation, forKey: "morphAnimation")
    }
    
    func animationWithGradientLayer() {
        gradientLayer.frame = CGRect(x: 50, y: 100, width: 200, height: 200)
        
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        view.layer.addSublayer(gradientLayer)
        
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.fromValue = [UIColor.red.cgColor, UIColor.blue.cgColor]
        colorAnimation.toValue = [UIColor.green.cgColor, UIColor.yellow.cgColor]
        colorAnimation.duration = 2.0
        gradientLayer.add(colorAnimation, forKey: "colorAnimation")
    }
    
    func animateWithLottie() {
        lottieAnimationView.frame = CGRect(x: 50, y: 100, width: 300, height: 300)
        view.addSubview(lottieAnimationView)
        
 
        if let animation = LottieAnimation.named("Animation4") {
            lottieAnimationView.animation = animation
            lottieAnimationView.loopMode = .loop 
            lottieAnimationView.play()
        }
    }
    
    func animateConstraints() {
        let newLeading: CGFloat = 50
        let newTop: CGFloat = 100
        
        UIView.animate(withDuration: 0.5) {
            
            
            self.view.layoutIfNeeded()
        }
    }
}

