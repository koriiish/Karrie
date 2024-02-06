//
//  Localize.swift
//  AlertAndPickers
//
//  Created by berdy on 04.02.24.
//

import Foundation

enum LocalizationEnum {
    enum CommonError {
        static let title = "Error message"
        static let serverError = "Server response error"
        static let noConnection = "No internet connection"
        
        enum Action {
            static let tryAgain = "Try Again"
        }
    }
}
