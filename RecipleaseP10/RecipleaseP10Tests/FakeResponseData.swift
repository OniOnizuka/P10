//
//  FakeResponseData.swift
//  RecipleaseP10Tests
//
//  Created by Alexandre NYS on 15/04/2021.
// Copyright © 2020 Alexandre NYS. All rights reserved.
//

import Foundation

// A set of fake response data to mock response from the API 
class FakeResponseData {
    
    static let responseOK = HTTPURLResponse(url: URL(string: "https://www.hackingwithswift.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
    static let responseKO = HTTPURLResponse(url: URL(string: "https://www.hackingwithswift.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)
    
    static var edamamCorrectData: Data? {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "edamam", withExtension: "json")!
        return try? Data(contentsOf: url)
    }
    
    static let incorrectData = "fsdfqefsf".data(using: .utf8)
}
