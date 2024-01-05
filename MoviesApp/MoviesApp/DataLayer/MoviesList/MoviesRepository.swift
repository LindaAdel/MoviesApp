//
//  MoviesRepository.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation
import Combine

protocol MoviesRepositoryDataSource {
    func getMoviesList(page: Int) -> AnyPublisher<MoviesResponse, APIError>
    func getPopularMoviesList(page: Int) -> AnyPublisher<MoviesResponse, APIError>
    func getTopRatedMoviesList(page: Int) -> AnyPublisher<MoviesResponse, APIError>
}

class MoviesRepository : MoviesRepositoryDataSource {
    
   private let remoteDataSource: MoviesRemoteDataSource
    
    init(remoteDataSource: MoviesRemoteDataSource){
        self.remoteDataSource = remoteDataSource
    }
    
    func getMoviesList(page: Int) -> AnyPublisher<MoviesResponse, APIError> {
        return remoteDataSource.getMoviesList(page: page).eraseToAnyPublisher()
    }
    func getPopularMoviesList(page: Int) -> AnyPublisher<MoviesResponse, APIError> {
        return remoteDataSource.getPopularMoviesList(page: page).eraseToAnyPublisher()
    }
    
    func getTopRatedMoviesList(page: Int) -> AnyPublisher<MoviesResponse, APIError> {
        return remoteDataSource.getTopRatedMoviesList(page: page).eraseToAnyPublisher()
    }
    
   
    
}
