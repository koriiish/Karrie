//
//  ErrorHandling.swift
//  AlertAndPickers
//
//  Created by berdy on 04.02.24.
//

import Foundation

struct RecoverableError: Error, Hashable {
    let title: String
    let message: String?
    let action: ViewAction?
    
    static func makeSomethingWrongAlert(action: @escaping () -> Void) -> RecoverableError {
        .init(
            title: LocalizationEnum.CommonError.title,
            message: LocalizationEnum.CommonError.serverError,
            action: .init(
                title: LocalizationEnum.CommonError.Action.tryAgain,
                body: action
            )
        )
    }
}

extension RecoverableError {
    init(
        nsError: NSError,
        action: ViewAction?
    ) {
        self.title = LocalizationEnum.CommonError.title
        self.action = action
        switch nsError.code {
        case NetworkCodes.noConnection.rawValue:
            self.message = LocalizationEnum.CommonError.noConnection
        case NetworkError.didConvertInAnotherType.code:
            self.message = nsError.localizedDescription
        default:
            self.message = LocalizationEnum.CommonError.serverError
        }
    }
}
