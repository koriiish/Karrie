//
//  RecoverableErroruseCase.swift
//  AlertAndPickers
//
//  Created by berdy on 05.02.24.
//

import Foundation
import UIKit

final class RecoverableErrorUseCase {
    weak var target: UIViewController?
    
    //MARK: - Initialization
    init(
        target: UIViewController?
    ) {
        self.target = target
    }
    
    //MARK: - Logic
    private func makeRecoverable(
        from error: NSError,
        retry: (() -> Void)?
    ) -> RecoverableError {
        var action: ViewAction?
        switch error.code {
        case NSURLErrorNotConnectedToInternet:
            action = nil
        default:
            if error.canRetry {
                action = .init(
                    title: LocalizationEnum.CommonError.Action.tryAgain,
                    body: retry
                )
            } else {
                action = nil
            }
        }
        return RecoverableError(
            nsError: error,
            action: action
        )
    }
    
    func handle(error: NSError, retry: (() -> Void)?) {
        guard let errorPresetable = target else { return }
        
        errorPresetable.view.endEditing(true)

        let recoverableError = makeRecoverable(from: error, retry: retry)
        target?.handle(error: recoverableError)
    }
}
