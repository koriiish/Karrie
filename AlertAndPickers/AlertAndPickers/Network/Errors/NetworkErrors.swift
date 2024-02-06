//
//  NetworkErrors.swift
//  AlertAndPickers
//
//  Created by berdy on 04.02.24.
//

import Foundation

extension NSError {
    var isNoConnection: Bool {
        return code == NetworkError.noConnection.code
    }
    
    var canRetry: Bool {
        return code == NetworkCodes.serverError.rawValue
    }
}

enum NetworkError: Error {
    case noConnection
    case serverError
    case notFound
    case cantCreateRequest
    case alreadySubscribe
    case didConvertInAnotherType
    
    public var code: Int {
        switch self {
        case .cantCreateRequest:
            return NSURLErrorBadURL
        case .serverError:
            return NetworkCodes.serverError.rawValue
        case .noConnection:
            return NSURLErrorNotConnectedToInternet
        case .notFound:
            return NetworkCodes.notFound.rawValue
        case .alreadySubscribe:
            return NetworkCodes.alreadySubscribe.rawValue
        case .didConvertInAnotherType:
            return NetworkCodes.didConvertInAnotherType.rawValue
        }
    }
}
