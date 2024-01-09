//
//  CustomButton.swift
//  less901customui
//
//  Created by Карина Дьячина on 9.01.24.
//

import UIKit

protocol CustomButtonDelegate: AnyObject {
    func buttonPressed()
}

class CustomButton: UIView {
    
    let buttonView = UIView()
    let buttonTitle = UILabel()
    weak var delegate: CustomButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      //  setupButtonView()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setupButtonView()
    }
    
    func setupButtonView() {
        addSubview(buttonView)
        buttonView.frame.size = CGSize(width: 150, height: 45)
        buttonView.backgroundColor = .blue
        buttonView.layer.cornerRadius = 25
        buttonView.layer.borderWidth = 3.0
        buttonView.layer.borderColor = UIColor.purple.cgColor
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        addGestureRecognizer(gesture)
        
        
        addSubview(buttonTitle)
        buttonTitle.frame.size = CGSize(width: 50, height: 20)
      //  buttonTitle.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        buttonTitle.text = "Login"
        buttonTitle.textColor = .black
    }
    
    @objc func tap () {
        print("Cool")
        delegate?.buttonPressed()
    }
}
