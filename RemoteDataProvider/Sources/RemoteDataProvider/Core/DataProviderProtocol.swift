//
//  DataProviderProtocol.swift
//  
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import Foundation

public typealias DataProviderResult<R: Decodable> = (Swift.Result<R, APIError>) -> Void

public protocol DataProviderProtocol {
    func request<R: RequestProtocol>(for request: R, result: DataProviderResult<R.ResponseType>?)
    func cancelTask()
}

