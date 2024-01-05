//
//  MoviesListPresenter.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation
protocol MoviesPresentationLogic {
    func presentMoviesList(response: MoviesListModel.Fetch.Response)
}

class MoviesPresenter {
    var view: MoviesDisplayLogic?
    @Published var paginatedMovies = [MoviesResultResponse]()
}

extension MoviesPresenter: MoviesPresentationLogic {
    
    func presentMoviesList(response: MoviesListModel.Fetch.Response) {
        let viewModel = MoviesListModel.Fetch.ViewModel()
        var response = response.moviesListResponse.results
        self.paginatedMovies.append(contentsOf: response ?? [])
        viewModel.moviesList = paginatedMovies
        view?.displayMoviesList(viewModel: viewModel)
    }
    
    
}
