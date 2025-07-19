//
//  MovieDetailsPresenter.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import Foundation
protocol MovieDetailsPresentationLogic {
    func presentMovieDetails(response: MovieDetailsModel.Fetch.Response)
}

class MovieDetailsPresenter {
    var view: MovieDetailsDisplayLogic?
}

extension MovieDetailsPresenter: MovieDetailsPresentationLogic {
    
    func presentMovieDetails(response: MovieDetailsModel.Fetch.Response) {
        let viewModel = MovieDetailsModel.Fetch.ViewModel()
        viewModel.movieDetails = MovieDetailsDataStore(response.movieDetailsModelResponse)
        view?.displayMovieDetails(viewModel: viewModel)
    }
    
    
}
