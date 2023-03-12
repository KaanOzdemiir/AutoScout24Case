//
//  AlamofireRequestConverter.swift
//  
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import Alamofire

struct AlamofireRequestConverter {
    
    let url: String
    let method: HTTPMethod
    let parameters: Parameters?
    let encoding: ParameterEncoding
    let headers: HTTPHeaders?
    
    init<R: RequestProtocol>(_ request: R) {
        self.url = (request.urlComponents?.url?.absoluteString ?? "") + "/"
        self.method = request.method.toAlamofireMethod
        self.parameters = request.parameters.isEmpty ? nil : request.parameters
        self.encoding = request.encoding.toAlamofireParameterEncoding
        self.headers = request.headers.isEmpty ? nil : HTTPHeaders(request.headers)
    }
}

private extension RequestMethod {
    var toAlamofireMethod: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        }
    }
}

private extension RequestEncoding {
    var toAlamofireParameterEncoding: ParameterEncoding {
        switch self {
        case .json:
            return JSONEncoding.default
        case .url:
            return URLEncoding.default
        }
    }
}
