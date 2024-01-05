//
//  AppConfiguration.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation

class AppConfiguration {
    
    static var apiBaseURL: String  {
        
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
            fatalError("apiBaseURL must not be empty in plist")
        }
        return apiBaseURL
    }
    
    static var apiKey: String  {
        
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String else {
            fatalError("apiKey must not be empty in plist")
        }
        return apiKey
    }
    
    static var apiAccessToken: String  {
        
        guard let apiAccessToken = Bundle.main.object(forInfoDictionaryKey: "ApiAccessToken") as? String else {
            fatalError("ApiAccessToken must not be empty in plist")
        }
        return apiAccessToken
    }
}
