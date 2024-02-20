//
//  EventView.swift
//  lesson24project
//
//  Created by Карина Дьячина on 20.02.24.
//

import UIKit

class EventView: UIView {
    
    enum Constants {
        static let buttonsWidth: CGFloat = 150
        static let buttonsHeight: CGFloat = 40
        static let textsWidth: CGFloat = 300
        static let textFieldsHeight: CGFloat = 35
        static let textViewHeight: CGFloat = 150
    }
    
    var titleTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var descriptionTextView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Description"
        textView.backgroundColor = .gray
        return textView
    }()
    
    var dateTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Date"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupConstraints() {
        addSubview(titleTextField)
        addSubview(descriptionTextView)
        addSubview(dateTextField)
        addSubview(cancelButton)
        addSubview(addButton)
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleTextField.widthAnchor.constraint(equalToConstant: Constants.textsWidth),
            titleTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldsHeight),
            
            descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionTextView.widthAnchor.constraint(equalToConstant: Constants.textsWidth),
            descriptionTextView.heightAnchor.constraint(equalToConstant: Constants.textViewHeight),
            
            dateTextField.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 20),
            dateTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateTextField.widthAnchor.constraint(equalToConstant: Constants.textsWidth),
            dateTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldsHeight),
            
            cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: Constants.buttonsWidth),
            cancelButton.heightAnchor.constraint(equalToConstant: Constants.buttonsHeight),
            
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addButton.widthAnchor.constraint(equalToConstant: Constants.buttonsWidth),
            addButton.heightAnchor.constraint(equalToConstant: Constants.buttonsHeight)
        ])
    }
}
