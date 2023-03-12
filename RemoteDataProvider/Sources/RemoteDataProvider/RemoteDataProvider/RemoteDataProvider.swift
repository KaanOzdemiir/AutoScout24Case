//
//  RemoteDataProvider.swift
//  
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import Alamofire

final public class RemoteDataProvider: DataProviderProtocol {
    
    public static let shared = RemoteDataProvider()
    
    private var session: Session
    
    var request: DataRequest?
    
    private init() {
        self.session = Session()
    }
    
    public func request<R>(for request: R, result: DataProviderResult<R.ResponseType>?) where R : RequestProtocol {
        let alamofireRequest = AlamofireRequestConverter(request)
        
        print(alamofireRequest.url)
        self.request = session.request(
            alamofireRequest.url,
            method: alamofireRequest.method,
            parameters: alamofireRequest.parameters,
            encoding: alamofireRequest.encoding,
            headers: alamofireRequest.headers
        )
        .validate()
        .responseDecodable(of: R.ResponseType.self, completionHandler: { response in
            switch response.result {
            case .success(let model):
                result?(.success(model))
            case .failure(let error):
                print(error.localizedDescription)
                result?(.failure(.general))
            }
        })
    }
    
    public func cancelTask() {
        request?.cancel()
    }
}
