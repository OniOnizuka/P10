//
//  AlamoSessionFake.swift
//  RecipleaseP10Tests
//
//  Created by Alexandre NYS on 15/04/2021.
// Copyright © 2020 Alexandre NYS. All rights reserved.


import XCTest
@testable import RecipleaseP10
import Alamofire

// A fake session of the Alamofire framework to use within our tests
class AlamoSessionFake: SessionProtocol {
    
    let response: FakeAlamoResponse
    
    init(response: FakeAlamoResponse) {
        self.response = response
    }
    
    func request(url: URL, completionHandler: @escaping (Data?, HTTPURLResponse?, Error?) -> Void) {
        completionHandler(response.data, response.response, response.error)
    }
}

struct FakeAlamoResponse {
    var error: Error?
    var data: Data?
    var response: HTTPURLResponse?
}
