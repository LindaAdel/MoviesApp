//
//  MovieDetailsAPI.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import Foundation
import Combine

protocol MovieDetailsRemoteDataSource: MovieDetailsRepositoryDataSource {}

class MovieDetailsAPI: BaseAPI, MovieDetailsRemoteDataSource {
    
    func getMovieDetails(id: Int) -> AnyPublisher<MovieDetailsResponse, APIError> {
        return request(request: MovieDetailsRouter.getMovieDetails(id: id), responseType: MovieDetailsResponse.self, showDefaultAlertError: true)
    }
    
    
}
