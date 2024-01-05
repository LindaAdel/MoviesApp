//
//  APIError.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import Alamofire

enum APIError: Error, Equatable {
    case errorOccured
    case connectionError
    case notFound
    case authorizationError
    case custom(String)
    case serverError
    
    init() {
        self = .errorOccured
    }
    
    init(error: AFError? = nil, responseCode: Int? = nil, customError: String? = nil) {
        
        if customError != nil && responseCode != 404 {
            self = .custom(customError ?? "")
        } else {
            var code = responseCode
            if error != nil {
                code = error!.responseCode
            }
            switch code {
            case 500:
                self = .serverError
            case 401:
                self = .authorizationError
            case 404:
                self = .notFound
            default:
                self = .errorOccured
            }
        }
    }
    
    var message: String {
        switch self {
        case .serverError:
            return "Internal Server error"
        case .errorOccured:
            return "An error has occured"
        case .custom(let message):
            return message
        case .connectionError:
            return "Error connecting to the Internet"
        case .notFound:
            return "Not found error has occurred"
        case .authorizationError:
            return "An authentication error has occurred"
        }
    }
}
