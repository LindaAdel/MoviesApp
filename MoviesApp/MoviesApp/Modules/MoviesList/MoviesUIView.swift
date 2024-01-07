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
}
extension MoviesUIView: MoviesDisplayLogic {
    
    func displayMoviesList(viewModel: MoviesListModel.Fetch.ViewModel) {
        DispatchQueue.main.async {
            self.moviesViewModel.moviesList = viewModel.moviesList
        }
    }
    
    
    func fetchMoviesList(page: Int) {
        let request = MoviesListModel.Fetch.Request(page: page , filterOption: .nowPlaying)
        interactor?.loadMoviesList(request:request)
    }
    
    func FetchPopularMoviesList(page: Int) {
        let request = MoviesListModel.Fetch.Request(page: page, filterOption: .popular)
        interactor?.loadPopularMoviesList(request:request)
    }
    
    func FetchTopRatedMoviesList(page: Int) {
        let request = MoviesListModel.Fetch.Request(page: page , filterOption: .topRated)
        interactor?.loadTopRatedMoviesList(request:request)
    }
    
    func fetchNextPage(){
        switch movieState {
        case .nowPlaying:
            fetchMoviesList(page: currentPage)
            currentPage += 1
            
        case .popular:
            currentPage += 1
            FetchPopularMoviesList(page: currentPage)
           
        case .topRated:
            currentPage += 1
            FetchTopRatedMoviesList(page: currentPage)
           
        }
       
    }
    
    func FetchPopularMovies() {
        movieState = .popular
        currentPage = 1
        FetchPopularMoviesList(page: currentPage)
    }
    
    func FetchTopRatedMovies() {
        movieState = .topRated
        currentPage = 1
        FetchTopRatedMoviesList(page: currentPage)
    }
}

