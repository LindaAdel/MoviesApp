//
//  NetworkConstants.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation

struct NetworkConstants{
    struct Constants {
        static let accessToken = AppConfiguration.apiAccessToken
    }
    struct ContentType {
        static let json = "application/json"
    }
    
    struct HTTPHeader {
        static let content_type = "Content-Type"
        static let acceptType = "Accept"
        static let authentication = "Authorization"
    }
    
    
    struct path {
        static let playedMovies = "now_playing"
        static let popularMovies = "popular"
        static let topRatedMovies = "top_rated"
    }
    
}
