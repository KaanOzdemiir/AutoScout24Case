//
//  File.swift
//  
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import Foundation

public extension Optional where Wrapped == String {
    var orEmpty: Bool {
        switch self {
        case .some(let wrapped):
            return wrapped.isEmpty
        case .none:
            return true
        }
    }
}
