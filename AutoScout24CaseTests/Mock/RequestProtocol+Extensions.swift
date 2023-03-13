//
//  RequestProtocol+Extensions.swift
//  AutoScout24CaseTests
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import RemoteDataProvider

extension RequestProtocol {
    var mockFileName: String {
        String(describing: Self.self)
    }
}
