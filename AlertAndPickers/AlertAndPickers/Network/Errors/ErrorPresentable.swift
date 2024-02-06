//
//  ErrorPresentable.swift
//  AlertAndPickers
//
//  Created by berdy on 05.02.24.
//

import Foundation

protocol ErrorPresentable: AnyObject {
    func present(error: NSError, retryBody: (() -> Void)?)
}
