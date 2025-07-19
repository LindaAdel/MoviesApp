//
//  MoviesListUIView.swift
//  MoviesApp
//
//  Created by Linda adel on 06/01/2024.
//

import SwiftUI

struct MoviesListUIView: View {
    let loadMore : (() -> Void)
    let state: PaginationState
    @State var moviesViewModel: MoviesListModel.Fetch.ViewModel
    
    var body: some View {
        List {
            ForEach(moviesViewModel.moviesList ?? [], id: \.id) { movie in
                NavigationLink(destination: MovieDetailsUIView.configureDetailView(id: movie.id ?? 0)) {
                    MovieListRowUIView(movie: movie)
                }
                .listRowSeparator(.hidden)
            }
            ListPaginationRowView(state: state, loadMore: loadMore)
        }
        .foregroundColor(.clear)
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .navigationTitle("Now Playing")
    }
}

