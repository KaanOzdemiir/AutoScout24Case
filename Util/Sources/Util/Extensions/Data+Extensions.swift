//
//  Data+Extensions.swift
//  
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import Foundation

public extension Data {
    /// Decode model that conform to Decodable protocol
    func convert<T: Decodable>(to model: T.Type) -> T? {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .deferredToData
        let result = try? decoder.decode(T.self, from: self)
        return result
    }
}
