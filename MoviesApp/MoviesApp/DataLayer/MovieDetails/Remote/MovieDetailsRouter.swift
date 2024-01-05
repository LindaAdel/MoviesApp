//
//  MovieDetailsRouter.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import Foundation
import Alamofire

enum MovieDetailsRouter: BaseRouter {
    case getMovieDetails(id:Int)
    
    var method: HTTPMethod {
        switch self {
        case .getMovieDetails:
            return .get
        }
        
    }
    var authorized: Bool {
        switch self {
        default:
            return true
        }
    }
    var path: String {
        switch self {
        case .getMovieDetails(let id):
            return "\(id)?language=en-US"
        }
    }
    
    
    
}
