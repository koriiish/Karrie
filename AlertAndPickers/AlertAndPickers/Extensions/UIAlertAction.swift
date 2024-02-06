//
//  UIAlertAction.swift
//  AlertAndPickers
//
//  Created by berdy on 04.02.24.
//

import UIKit

extension UIAlertAction {
    static let cancel = makeCancel(handler: nil)
    
    static func makeCancel(handler: (() -> Void)?) -> UIAlertAction {
        .init(
            title: "Cancel",
            style: .cancel,
            handler: { _ in
                handler?()
            }
        )
    }
    
    static func makeDefault(
        title: String,
        handler: (() -> Void)?
    ) -> UIAlertAction {
        .init(title: title, style: .default) { _ in
            handler?()
        }
    }
}
