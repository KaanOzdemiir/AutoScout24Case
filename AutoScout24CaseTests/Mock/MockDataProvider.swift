//
//  MockDataProvider.swift
//  AutoScout24CaseTests
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import RemoteDataProvider
import Foundation
import Util

class MockDataProvider: DataProviderProtocol {
    func request<R>(for request: R, result: DataProviderResult<R.ResponseType>?) where R : RequestProtocol {
        debugPrint("mockFileName: \(request.mockFileName)")
        let bundle = Bundle(for: type(of: self))
        do {
            guard
                let path = bundle.path(forResource: request.mockFileName, ofType: "json")
            else {
                throw NSError(domain: "DataProviderTests", code: 0, userInfo: [NSLocalizedDescriptionKey: "The json file not be found."])
            }
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            
            if let model = data.convert(to: R.ResponseType.self) {
                result?(.success(model))
            } else {
                result?(.failure(.decode))
            }
        } catch {
            result?(.failure(.general))
        }
    }
    
    func cancelTask() { }
}
