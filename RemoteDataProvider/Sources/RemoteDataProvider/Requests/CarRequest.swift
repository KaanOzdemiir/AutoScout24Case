//
//  CarRequest.swift
//  
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import Foundation

public struct CarRequest: RequestProtocol {
    
    public typealias ResponseType = [CarResult]
    
    public var path: APIPath = .none
    
    public var headers: RequestHeaders = [:]
    
    public var parameters: RequestParameters
    
    public var method: RequestMethod = .get
    
    public var encoding: RequestEncoding = .json
    
    public var async: Bool = false
    
    public var showLoader: Bool = true
    
    public var showAlertInCaseError: Bool = true

    public init(headers: RequestHeaders = [:], parameters: RequestParameters? = nil, showLoader: Bool = true) {
        self.headers = headers
        self.parameters = parameters ?? [:]
        self.showLoader = showLoader
    }
}
