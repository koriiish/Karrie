//
//  OrangeView.swift
//  lesson16
//
//  Created by Карина Дьячина on 11.01.24.
//

import Foundation
import UIKit

class OrangeView: UIView {
    
    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        addSubview(view)
        view.frame.size = CGSize(width: 300, height: 150)
        view.backgroundColor = .orange

        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
                swipeGesture.direction = .up
        view.addGestureRecognizer(swipeGesture)
              //  view.subviews.first?.addGestureRecognizer(swipeGesture)
        
       
    }
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        view.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
            print("Swipe recognized!")
        }
}
