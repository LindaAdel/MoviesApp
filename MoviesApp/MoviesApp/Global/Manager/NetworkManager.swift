//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static var sharedInstance = NetworkManager()
    
    static var IS_CONNECTED_TO_INTERNET: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
