//
//  EventView.swift
//  lesson24project
//
//  Created by Карина Дьячина on 20.02.24.
//

import UIKit

protocol EventDelegate: AnyObject {
    func sendEvent(event: Event)
}

class EventView: UIView {
    
    enum Constants {
        static let buttonsWidth: CGFloat = 150
        static let buttonsHeight: CGFloat = 40
        static let buttonsBottomAnchor: CGFloat = -15
        static let cancelButtonLeftAnchor: CGFloat = 20
        static let addButtonRightAnchor: CGFloat = -20
        static let textsWidth: CGFloat = 300
        static let textFieldsHeight: CGFloat = 35
        static let textViewHeight: CGFloat = 150
        static let titleTextFieldTopAnchor: CGFloat = 15
        static let descriptionTextViewTopAnchor: CGFloat = 20
        static let dateTextFieldTopAnchor: CGFloat = 20
        
        static let titlePlaceholder = "Title"
        static let descriptionPlaceholder =  "Description"
        static let datePlaceholder = "Date"
        static let cancelButtonTitle = "Cancel"
        static let addButtonTitle = "Add"
    }
    
    var titleTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Constants.titlePlaceholder
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var descriptionTextView: UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = Constants.descriptionPlaceholder
        textView.backgroundColor = .gray
        return textView
    }()
    
    var dateTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Constants.datePlaceholder
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.cancelButtonTitle, for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.addButtonTitle, for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    var currentDate = Date()
    
    lazy var datePicker: UIDatePicker = {
        datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .inline
        datePicker.minimumDate = currentDate
        return datePicker
    }()
    
    weak var delegate: EventDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        datePickerSettings()
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
            titleTextField.topAnchor.constraint(equalTo: topAnchor, constant: Constants.titleTextFieldTopAnchor),
            titleTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleTextField.widthAnchor.constraint(equalToConstant: Constants.textsWidth),
            titleTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldsHeight),
            
            descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: Constants.descriptionTextViewTopAnchor),
            descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionTextView.widthAnchor.constraint(equalToConstant: Constants.textsWidth),
            descriptionTextView.heightAnchor.constraint(equalToConstant: Constants.textViewHeight),
            
            dateTextField.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: Constants.dateTextFieldTopAnchor),
            dateTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateTextField.widthAnchor.constraint(equalToConstant: Constants.textsWidth),
            dateTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldsHeight),
            
            cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.buttonsBottomAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.cancelButtonLeftAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: Constants.buttonsWidth),
            cancelButton.heightAnchor.constraint(equalToConstant: Constants.buttonsHeight),
            
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.buttonsBottomAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.addButtonRightAnchor),
            addButton.widthAnchor.constraint(equalToConstant: Constants.buttonsWidth),
            addButton.heightAnchor.constraint(equalToConstant: Constants.buttonsHeight)
        ])
        
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    func datePickerSettings() {
        dateTextField.inputView = datePicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
               
        let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: false)
        
        dateTextField.inputAccessoryView = toolbar
        
        datePicker.addTarget(self, action: #selector(onDatePickerValueChanged), for: .valueChanged)
    }
    
    @objc func addButtonTapped() {
       let newEvent = Event(title: titleTextField.text ?? "", description: descriptionTextView.text , date: dateTextField.text ?? "")
        delegate?.sendEvent(event: newEvent)
    }
    
    @objc func doneButtonTapped() {
        dateTextField.resignFirstResponder()
    }
    
    @objc func onDatePickerValueChanged(_ datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/d"
        dateTextField.text = formatter.string(from: datePicker.date)
    }
}
