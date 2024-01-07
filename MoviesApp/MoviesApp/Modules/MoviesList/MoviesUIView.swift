//
//  MoviesUIView.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import SwiftUI

protocol MoviesDisplayLogic {
    func displayMoviesList(viewModel: MoviesListModel.Fetch.ViewModel)
}
struct MoviesUIView: View {
    var interactor: MoviesBusinessLogic?
    @ObservedObject var moviesViewModel: MoviesListModel.Fetch.ViewModel
    @State var currentPage: Int = 1
    @State var movieState: MoviesState = .nowPlaying
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Spacer()
                    MoviesSortingUIButton(title: "Popular", completion: FetchPopularMovies)
                    Spacer()
                    MoviesSortingUIButton(title: "Top Rated", completion: FetchTopRatedMovies)
                    Spacer()
                }
                MoviesListUIView(loadMore: fetchNextPage, state: interactor?.state ?? .idle, moviesViewModel: moviesViewModel)
                    
            }
            
        }
        .colorScheme(.dark)
        .accentColor(.white)
    }
    
    
    func fetchMovies(_ page: Int ,_ filterOption: MoviesState) {
        let request = MoviesListModel.Fetch.Request(page: page , filterOption: filterOption)
        switch filterOption {
        case.nowPlaying:
            interactor?.loadMoviesList(request:request)
        case .popular:
            interactor?.loadPopularMoviesList(request:request)
        case .topRated:
            interactor?.loadTopRatedMoviesList(request:request)
        }
        
    }

    func fetchNextPage(){
        switch movieState {
        case .nowPlaying:
            fetchMovies(currentPage, .nowPlaying)
            currentPage += 1
            
        case .popular:
            currentPage += 1
            fetchMovies(currentPage, .popular)
        case .topRated:
            currentPage += 1
            fetchMovies(currentPage, .topRated)
           
        }
       
    }
    
    func FetchPopularMovies() {
        movieState = .popular
        currentPage = 1
        fetchMovies(currentPage, .popular)
    }
    
    func FetchTopRatedMovies() {
        movieState = .topRated
        currentPage = 1
        fetchMovies(currentPage, .topRated)
    }
}
extension MoviesUIView: MoviesDisplayLogic {
    
    func displayMoviesList(viewModel: MoviesListModel.Fetch.ViewModel) {
        DispatchQueue.main.async {
            self.moviesViewModel.moviesList = viewModel.moviesList
        }
    }
}

