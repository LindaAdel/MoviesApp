//
//  MoviesListUIView.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import SwiftUI

protocol MoviesDisplayLogic {
    func displayMoviesList(viewModel: MoviesListModel.Fetch.ViewModel)
}
struct MoviesListUIView: View {
    var interactor: MoviesBusinessLogic?
    @ObservedObject var moviesViewModel: MoviesListModel.Fetch.ViewModel
    @State var currentPage: Int = 1
    var body: some View {
        NavigationView {
            List {
                ForEach(moviesViewModel.moviesList ?? [], id: \.id) { movie in
                    NavigationLink(destination: MovieDetailsUIView.configureDetailView(id: movie.id ?? 0)) {
                        MovieListRowUIView(movie: movie)
                    }
                    .listRowSeparator(.hidden)
                }
                ListPaginationRowView(state: interactor?.state ?? .idle, loadMore: fetchNextPage)
            }
            .foregroundColor(.clear)
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .navigationTitle("Now Playing")
        }
        .colorScheme(.dark)
        .accentColor(.white)
    }
}
extension MoviesListUIView: MoviesDisplayLogic {
    func displayMoviesList(viewModel: MoviesListModel.Fetch.ViewModel) {
        DispatchQueue.main.async {
            self.moviesViewModel.moviesList = viewModel.moviesList
        }
    }
    
    func fetchMoviesList(page: Int) {
        let request = MoviesListModel.Fetch.Request(page: page)
        interactor?.loadMoviesList(request:request)
    }
    
    func fetchNextPage(){
        fetchMoviesList(page: currentPage)
        currentPage += 1
    }
}

