//
//  UIAlertViewController.swift
//  AlertAndPickers
//
//  Created by berdy on 04.02.24.
//

import UIKit

extension UIAlertController {
    static func make(
        title: String,
        message: String?,
        leftAction: UIAlertAction? = .cancel,
        rightAction: UIAlertAction?
    ) -> UIAlertController {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        if let left = leftAction {
            alert.addAction(left)
        }
        
        if let right = rightAction {
            alert.addAction(right)
        }
        
        return alert
    }
}

