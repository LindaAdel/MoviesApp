//
//  MoviesRouter.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation
import Alamofire

enum MoviesRouter: BaseRouter {
    case getMoviesList(page:Int)
    case getPopularMoviesList(page:Int)
    case getTopRatedMoviesList(page:Int)
    
    var method: HTTPMethod {
        switch self {
        case .getMoviesList:
            return .get
        case .getPopularMoviesList:
               return .get
        case .getTopRatedMoviesList:
              return  .get
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
        case .getMoviesList(let page):
            return "\(NetworkConstants.path.playedMovies)?language=en-US&page=\(page)"
        case .getPopularMoviesList(let page):
            return "\(NetworkConstants.path.popularMovies)?language=en-US&page=\(page)"
        case .getTopRatedMoviesList(let page):
            return "\(NetworkConstants.path.topRatedMovies)?language=en-US&page=\(page)"
        }
    }
    
    
    
}
