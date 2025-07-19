//
//  MoviesListPresenter.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation
protocol MoviesPresentationLogic {
    func presentMoviesList(response: MoviesListModel.Fetch.Response)
    func presentPopularMoviesList(response: MoviesListModel.Fetch.Response)
    func presentTopRatedMoviesList(response: MoviesListModel.Fetch.Response)
}

class MoviesPresenter {
    var view: MoviesDisplayLogic?
    @Published var paginatedMovies = [MoviesResultResponse]()
    @Published var paginatedPopularMovies = [MoviesResultResponse]()
    @Published var paginatedTopRatedMovies = [MoviesResultResponse]()
    
    private func presentMoviesListHelper(response: MoviesListModel.Fetch.Response, viewModel: inout MoviesListModel.Fetch.ViewModel, moviesList: inout [MoviesResultResponse]) {
        let responseMovies = response.moviesListResponse.results ?? []
        moviesList.append(contentsOf: responseMovies)
        viewModel.moviesList = moviesList
    }
    
    private func presentMoviesList(type: inout [MoviesResultResponse], response: MoviesListModel.Fetch.Response) {
           var viewModel = MoviesListModel.Fetch.ViewModel()
           presentMoviesListHelper(response: response, viewModel: &viewModel, moviesList: &type)
           view?.displayMoviesList(viewModel: viewModel)
       }
}

extension MoviesPresenter: MoviesPresentationLogic {
    
    func presentMoviesList(response: MoviesListModel.Fetch.Response) {
        presentMoviesList(type: &paginatedMovies, response: response)
    }
    
    func presentPopularMoviesList(response: MoviesListModel.Fetch.Response) {
        presentMoviesList(type: &paginatedPopularMovies, response: response)
    }
    
    func presentTopRatedMoviesList(response: MoviesListModel.Fetch.Response) {
        presentMoviesList(type: &paginatedTopRatedMovies, response: response)
        
    }
    
    
}
