//
//  ApiError.swift
//  RecipleaseP10
//
//  Created by Alexandre NYS on 16/04/2021.
// Copyright © 2020 Alexandre NYS. All rights reserved.

import Foundation
// An enum for the error that can occur during api requests
enum ApiError: Error {
    
    case noData
    case badRequest
    case noInternet
    
    var errorDescription: String {
        return "Oups !"
    }
    var failureReason: String {
        switch self {
        case .noData:
            return "These data can't be retrieved at the moment."
        case .badRequest:
            return "The request has failed."
        case .noInternet:
            return "Service unavailable at the moment, it seems your are not connected to the internet."
        }
    }
}
