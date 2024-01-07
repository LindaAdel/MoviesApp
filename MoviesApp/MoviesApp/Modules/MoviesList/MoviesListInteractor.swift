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
    var movieFilterState : MoviesState { get set }
    func loadMoviesList(request: MoviesListModel.Fetch.Request)
    func loadPopularMoviesList(request: MoviesListModel.Fetch.Request)
    func loadTopRatedMoviesList(request: MoviesListModel.Fetch.Request)
}

class MoviesInteractor: MoviesBusinessLogic {
   
    @Published var state: PaginationState = .idle
     var movieFilterState: MoviesState = .nowPlaying
    @Inject var moviesRepository: MoviesRepositoryDataSource
    var presenter : MoviesPresentationLogic?
    private var cancellables = Set<AnyCancellable>()
    
    private func loadMoviesListHelper(_ getMoviesPublisher: (AnyPublisher<MoviesResponse, APIError>)) {
        guard state == PaginationState.idle else {
            return
        }
        getMoviesPublisher
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                // Handle error
            }
        }, receiveValue: { [weak self] moviesListResponse in
            // Process  Response
            let response = MoviesListModel.Fetch.Response(moviesListResponse: moviesListResponse)
            self?.state = (response.moviesListResponse.results?.count == (response.moviesListResponse.total_results)) ? .loading : .idle
            switch self?.movieFilterState {
            case .nowPlaying, .none:
                self?.presenter?.presentMoviesList(response: response)
            case.popular:
                self?.presenter?.presentPopularMoviesList(response: response)
            case.topRated:
                self?.presenter?.presentTopRatedMoviesList(response: response)
            }
           
            
        })
        .store(in: &cancellables)
    }
    
}

extension MoviesInteractor  {

    func loadMoviesList(request: MoviesListModel.Fetch.Request) {
        self.movieFilterState = request.filterOption
        self.loadMoviesListHelper(moviesRepository.getMoviesList(page: request.page))
    }

    func loadPopularMoviesList(request: MoviesListModel.Fetch.Request) {
        self.movieFilterState = request.filterOption
        self.loadMoviesListHelper(moviesRepository.getPopularMoviesList(page: request.page))
    }
    
    func loadTopRatedMoviesList(request: MoviesListModel.Fetch.Request) {
        self.movieFilterState = request.filterOption
        self.loadMoviesListHelper(moviesRepository.getTopRatedMoviesList(page: request.page))
    }
    
    
}
