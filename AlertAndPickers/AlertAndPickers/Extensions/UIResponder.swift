//
//  UIResponder.swift
//  AlertAndPickers
//
//  Created by berdy on 05.02.24.
//

import UIKit

extension UIResponder {
    @objc open func handle(
        _ error: Error,
        from controller: UIViewController
    ) {
        guard let nextItem = next else {
            return
        }
        nextItem.handle(error, from: controller)
    }
}
