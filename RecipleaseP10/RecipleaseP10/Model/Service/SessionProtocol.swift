//
//  SessionProtocol.swift
//  RecipleaseP10
//
//  Created by Alexandre NYS on 16/04/2021.
// Copyright © 2020 Alexandre NYS. All rights reserved.

import Foundation

// The session protocol to not depend only on Alamofire and also to help  with the tests
protocol SessionProtocol {
    
     func request(url: URL, completionHandler: @escaping (Data?, HTTPURLResponse?, Error?) -> Void)
}
