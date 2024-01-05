//
//  MoviesListInteractor.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation
import Combine

protocol MoviesBusinessLogic {
    var state : PaginationState { get set }
    func loadMoviesList(request: MoviesListModel.Fetch.Request)
}

class MoviesInteractor: MoviesBusinessLogic {
    @Published var state: PaginationState = .idle
    @Inject var moviesRepository: MoviesRepositoryDataSource
    var presenter : MoviesPresentationLogic?
    private var cancellables = Set<AnyCancellable>()
    
}

extension MoviesInteractor  {

    func loadMoviesList(request: MoviesListModel.Fetch.Request) {
        guard state == PaginationState.idle else {
            return
        }
        moviesRepository.getMoviesList(page: request.page)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                // Handle error
            }
        }, receiveValue: { [weak self] moviesListResponse in
            // Process  Response
            let response = MoviesListModel.Fetch.Response(moviesListResponse: moviesListResponse)
            self?.state = (response.moviesListResponse.results?.count == (response.moviesListResponse.total_results)) ? .loading : .idle
            self?.presenter?.presentMoviesList(response: response)
            
        })
        .store(in: &cancellables)
    }

    
    
}
