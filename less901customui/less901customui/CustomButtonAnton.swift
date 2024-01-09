//
//  CustomButton1.swift
//  less901customui
//
//  Created by Карина Дьячина on 9.01.24.
//

import UIKit

class CustomButtonAnton: UIView {
    
    let buttonView: UIView = {
        let view = UIView()
        
        return view
    }()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setupButton()
    }
    
    func setupButton() {
        addSubview(buttonView)
        
        buttonView.backgroundColor = .purple
        buttonView.frame.size = CGSize(width: 150 , height: 50)
        buttonView.layer.cornerRadius = 16
        buttonView.layer.borderWidth = 1
        buttonView.layer.borderColor = UIColor.white.cgColor
       
        addSubview(label)
        label.text = "Success"
        label.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        label.textColor = .white
        label.frame.size = CGSize(width: 120, height: 20)
        
    }
}
