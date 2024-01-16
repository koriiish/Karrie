//
//  CustomAlert.swift
//  CustomAlert
//
//  Created by berdy on 16.01.24.
//

import Foundation

import UIKit

class CustomAlertView: UIView {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self,
                         action: #selector(cancelButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подтвердить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(
            self,
            action: #selector(confirmButtonTapped),
            for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        addSubview(titleLabel)
        addSubview(cancelButton)
        addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            cancelButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            confirmButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            confirmButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - Public Methods
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setCancelButtonTitle(_ title: String) {
        cancelButton.setTitle(title, for: .normal)
    }
    
    func setConfirmButtonTitle(_ title: String) {
        confirmButton.setTitle(title, for: .normal)
    }
    
    @objc private func cancelButtonTapped() {
        print("Cancel button tapped")
    }
    
    @objc private func confirmButtonTapped() {
        print("Confirm button tapped")
    }
}
