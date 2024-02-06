//
//  NetworkCodes.swift
//  AlertAndPickers
//
//  Created by berdy on 04.02.24.
//

import Foundation

public enum NetworkCodes: Int, CaseIterable, Decodable {
    case success = 200
    case created = 201
    case badRequest = 400
    case nonAuthorized = 401
    case forbidden = 403
    case notFound = 404
    case alreadySubscribe = 409
    case didConvertInAnotherType = 413
    case serverError = 500
    case noConnection = -1009
    
    static var requestValidation: [NetworkCodes] {
        return allCases.filter({ $0 != .nonAuthorized })
    }
}
