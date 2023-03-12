//
//  RequestProtocol.swift
//  
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import Foundation

public protocol RequestProtocol {
    associatedtype ResponseType: Decodable
    
    var path: APIPath { get }
    var headers: RequestHeaders { get }
    var parameters: RequestParameters { get }
    var method: RequestMethod { get }
    var encoding: RequestEncoding { get }
    var urlComponents: URLComponents? { get }
    var async: Bool { get }
    var showLoader: Bool { get }
    var showAlertInCaseError: Bool { get }
}

extension RequestProtocol {
    public var urlComponents: URLComponents? {
        var urlComponents = URLComponents()
        urlComponents.scheme = Bundle.main.infoForKey(.apiScheme)
        urlComponents.host = Bundle.main.infoForKey(.apiHost)
        urlComponents.path = path.rawValue
        return urlComponents
    }
}
