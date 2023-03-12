//
//  AutoScout24CaseTests.swift
//  AutoScout24CaseTests
//
//  Created by Kaan Ozdemir on 12.03.2023.
//

import XCTest
@testable import AutoScout24Case
import RemoteDataProvider

final class AutoScout24CaseTests: XCTestCase {

    var dataProvider: DataProviderProtocol!
    
    override func setUpWithError() throws {
        dataProvider = RemoteDataProvider.shared
    }
    
    override func tearDownWithError() throws {
        dataProvider = nil
    }
    
    var timeout: Double {
        5
    }
    
    func testCarRequestURL() {
        let request = CarRequest()
        let expected = "http://private-fe87c-simpleclassifieds.apiary-mock.com"
        XCTAssertEqual(request.urlComponents?.url?.absoluteString, expected)
    }
    
    func testCarRequest() {
        
        let request = CarRequest()
        
        let expectation = expectation(description: "\(String(describing: type(of: request))) expectation")
        
        dataProvider.request(for: request) { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: timeout)
    }

}
