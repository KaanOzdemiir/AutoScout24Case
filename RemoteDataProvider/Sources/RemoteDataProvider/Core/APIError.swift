//
//  APIError.swift
//  
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import Foundation

public enum APIError: Error, Decodable {
    case general
    case decode
}
