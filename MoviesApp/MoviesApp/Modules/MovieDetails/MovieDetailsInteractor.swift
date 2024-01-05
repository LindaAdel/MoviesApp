//
//  MovieDetailsInteractor.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import Foundation
import Combine

protocol MovieDetailsBusinessLogic {
    func loadMovieDetails(request: MovieDetailsModel.Fetch.Request)
}

class MovieDetailsInteractor {
    @Inject var movieDetailsRepository: MovieDetailsRepositoryDataSource
    var presenter : MovieDetailsPresentationLogic?
    private var cancellables = Set<AnyCancellable>()
    
}

extension MovieDetailsInteractor: MovieDetailsBusinessLogic {
    
    func loadMovieDetails(request: MovieDetailsModel.Fetch.Request) {
        movieDetailsRepository.getMovieDetails(id: request.id ?? 0)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                // Handle error
            }
        }, receiveValue: { [weak self] movieDetailsResponse in
            // Process  Response
            let response = MovieDetailsModel.Fetch.Response(movieDetailsModelResponse: movieDetailsResponse)
            self?.presenter?.presentMovieDetails(response: response)
        })
        .store(in: &cancellables)
    }

    
    
}
