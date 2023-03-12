//
//  File.swift
//  
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import Foundation

public extension String {
    var toURL: URL? {
        URL(string: self)
    }
}
