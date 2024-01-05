//
//  MovieDetailsRepository.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import Foundation
import Combine

protocol MovieDetailsRepositoryDataSource {
    func getMovieDetails(id: Int) -> AnyPublisher<MovieDetailsResponse, APIError>
}

class MovieDetailsRepository : MovieDetailsRepositoryDataSource {
    
    private let remoteDataSource: MovieDetailsRemoteDataSource
    
    init(remoteDataSource: MovieDetailsRemoteDataSource){
        self.remoteDataSource = remoteDataSource
    }
    
    func getMovieDetails(id: Int) -> AnyPublisher<MovieDetailsResponse, APIError> {
        return remoteDataSource.getMovieDetails(id: id).eraseToAnyPublisher()
    }
    
    
}
