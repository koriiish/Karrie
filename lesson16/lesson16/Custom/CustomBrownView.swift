//
//  CustomBrownView.swift
//  lesson16
//
//  Created by Карина Дьячина on 11.01.24.
//

//import UIKit
//
//class CustomBrownView: UIView {
//
//    @IBOutlet weak var browmView: UIView!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    //  setupCustomBrownView()
//    }
////    required init?(coder: NSCoder) {
////        super .init(coder: coder)
////        setupCustomBrownView()
////    }
//    
//    func setupCustomBrownView() {
//        
//        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
//        browmView.addGestureRecognizer(longPressGesture)
//        
//            }
//    
//    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
//        browmView.layer.cornerRadius = browmView.frame.height / 2
//            print("Long press recognized!")
//    }
//    
//}
