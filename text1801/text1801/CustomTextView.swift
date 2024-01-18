//
//  CustomTextView.swift
//  text1801
//
//  Created by Карина Дьячина on 18.01.24.
//

import UIKit

protocol CustomTextViewDelegate: AnyObject {
    func hideLabel(isHide: Bool)
}

class CustomTextView: UIView {
    
    
    let iconImageView = UIImageView()
    let textView = UITextView(frame: CGRect(x: 0, y: 200, width: 370, height: 70))
    let label = UILabel()
    let commentLabel = UILabel()
    let countLabel = UILabel()
    let photoLabel = UILabel()
    let numberLabel = UILabel()
    let photoView = UIView()
    
    weak var delegate: CustomTextViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLabel()
        
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setupUI()
        setupLabel()
    }
    
    func setupUI() {
        textView.textContainer.maximumNumberOfLines = 5
      //  textView.backgroundColor = .lightGray
      //  UIColor.black.withAlphaComponent(0)
        textView.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.5)
        textView.layer.cornerRadius = 25
        textView.textAlignment = .left
        textView.layer.borderColor = UIColor.clear.cgColor
        textView.delegate = self
        backgroundColor = .yellow
        layer.cornerRadius = 25
        addSubview(textView)
        
        photoView.frame = CGRect(x: 15, y: 50, width: 70, height: 100)
        photoView.backgroundColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.5)
        photoView.layer.cornerRadius = 8
        addSubview(photoView)
        
        iconImageView.image = UIImage(named: "photo")
        iconImageView.frame.size = CGSize(width: 20, height: 20)
        iconImageView.center = photoView.center
        addSubview(iconImageView)
 
    }
    
    func setupLabel() {
        label.text = "Поделитесь впечатлениями"
        label.textColor = .darkGray
        label.frame = CGRect(x: 40, y: 215, width: 250, height: 20)
        
        commentLabel.text = "Комментарий"
        commentLabel.textColor = .black
        commentLabel.font = UIFont(name: "Optima", size: 18)
        commentLabel.frame = CGRect(x: 10, y: 165, width: 150, height: 20)
        
        countLabel.text = "До 500 символов"
        countLabel.textColor = .lightGray
        countLabel.frame = CGRect(x: 225, y: 165, width: 200, height: 20)
        
        photoLabel.text = "Фото"
        photoLabel.textColor = .black
        photoLabel.frame = CGRect(x: 10, y: 20, width: 80, height: 20)
        
        numberLabel.text = "До 5 шт."
        numberLabel.textColor = .lightGray
        numberLabel.frame = CGRect(x: 300, y: 20, width: 100, height: 20)
        
        addSubview(label)
        addSubview(commentLabel)
        addSubview(countLabel)
        addSubview(photoLabel)
        addSubview(numberLabel)
        

    }
}

extension CustomTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
            print("Начало редактирования текстового поля")
        label.isHidden = true
        }
    
}
