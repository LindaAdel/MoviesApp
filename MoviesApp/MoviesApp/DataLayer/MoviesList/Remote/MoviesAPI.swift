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
    
    
}
