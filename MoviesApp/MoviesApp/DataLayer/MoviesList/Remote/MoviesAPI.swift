//
//  MoviesAPI.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation
import Combine

protocol MoviesRemoteDataSource: MoviesRepositoryDataSource {}

class MoviesAPI: BaseAPI, MoviesRemoteDataSource {
    
    func getMoviesList(page: Int) -> AnyPublisher<MoviesResponse, APIError> {
        return request(request: MoviesRouter.getMoviesList(page: page), responseType: MoviesResponse.self, showDefaultAlertError: true)
    }
    
    func getPopularMoviesList(page: Int) -> AnyPublisher<MoviesResponse, APIError> {
        return request(request: MoviesRouter.getPopularMoviesList(page: page), responseType: MoviesResponse.self, showDefaultAlertError: true)
    }
    
    func getTopRatedMoviesList(page: Int) -> AnyPublisher<MoviesResponse, APIError> {
        return request(request: MoviesRouter.getTopRatedMoviesList(page: page), responseType: MoviesResponse.self, showDefaultAlertError: true)
    }
    
    
}
