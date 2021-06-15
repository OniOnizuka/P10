//
//  AlamoClient.swift
//  RecipleaseP10
//
//  Created by Alexandre NYS on 16/04/2021.
// Copyright © 2020 Alexandre NYS. All rights reserved.

import Foundation
import Alamofire

// The client using alamofire to send request to the api 

class AlamoClient: SessionProtocol {
    
    func request(url: URL, completionHandler: @escaping (Data?, HTTPURLResponse?, Error?) -> Void) {
        AF.request(url).responseJSON { responseData in
            completionHandler(responseData.data, responseData.response, responseData.error)
        }
    }
}
