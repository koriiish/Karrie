//
//  ViewController.swift
//  less901customui
//
//  Created by Карина Дьячина on 9.01.24.
//

import UIKit

class ViewController: UIViewController {
    
    
  //  let loader = CustomLoader(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
  //  let customToggle = CustomToggle(frame: CGRect(x: 150, y: 150, width: 80, height: 30))
//    let customButton1 = CustomButton(frame: CGRect(x: 150, y: 150, width: 80, height: 30))
    let button = CustomButtonAnton(frame: CGRect(x: 150, y: 200, width: 80, height: 30))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
     //   view.addSubview(customButton1)
    //  view.addSubview(loader)
//        startAndStopAnimation()
//        setupCustomToggle()
    }

//    func startAndStopAnimation() {
//         // loader.startAnimating()
//        circleLoader.startAnimating()
//    //        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//    //            self.loader.stopAnimating()
//    //        }
//        }
    
//    private func setupCustomToggle() {
//            customToggle.onBackgroundColor = .systemPink
//            customToggle.offBackgroundColor = .darkGray
//            customToggle.thumbnailColor = .white
//            customToggle.backgroundOutlineColor = .clear
//            customToggle.thumbnailOutlineColor = .clear
//            customToggle.toggleOnTintColor = .white
//            customToggle.toggleOffTintColor = .white
//            customToggle.onThumnailColor = .clear
//            customToggle.offThumnailColor = .clear
//            customToggle.backgroundShadowOffsetY = 4.0
//            customToggle.thumbnailShadowOffsetY = 3.0
//            customToggle.backgroundShadowColor = .systemMint
//            customToggle.thumbnailShadowColor = .red
//    customToggle.thumbnailSize = CGSize(width: 30, height: 30)
//            customToggle.backgroundSize = CGSize(width: 80, height: 36)
//        //    customToggle.setImages(onState: UIImage(named: "toggle")!, offState: UIImage(named: "cancel")!)
//            customToggle.thumbnailShadow = true
//            customToggle.backgroundShadow = true
//            customToggle.isEnabledToggle = true
//            
//            view.addSubview(customToggle)
//            
//            customToggle.delegate = self
//        }
//}
//
//extension ViewController: CustomToggleSwitchDelegate {
//    func switchStateChanged(isOn: Bool) {
//        print("Toogle state is \(isOn)")
//    }
}
