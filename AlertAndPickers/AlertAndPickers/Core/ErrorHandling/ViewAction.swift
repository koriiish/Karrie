//
//  ViewAction.swift
//  AlertAndPickers
//
//  Created by berdy on 04.02.24.
//

import Foundation

struct ViewAction: Hashable {
    let title: String
    let body: (() -> Void)?
    
    //MARK: - Creation
    //MARK: - Equatable
    static func == (lhs: ViewAction, rhs: ViewAction) -> Bool {
        return lhs.title == rhs.title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
