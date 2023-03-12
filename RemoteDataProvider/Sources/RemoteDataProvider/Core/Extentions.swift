//
//  Extentions.swift
//  
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import Foundation

/// Bundle extension
public extension Bundle {
    /// Returns String value for the specified key from bundle dictionary.
    /// - Parameter key: String representing item key.
    /// - Returns: String value if exists.
    func infoForKey(_ key: InfoKey) -> String? {
        (infoDictionary?[key.rawValue] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
    
}

