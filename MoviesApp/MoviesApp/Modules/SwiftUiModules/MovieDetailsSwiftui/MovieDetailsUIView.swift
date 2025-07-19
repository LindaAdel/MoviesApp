//
//  MovieDetailsUIView.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import SwiftUI

protocol MovieDetailsDisplayLogic {
    func displayMovieDetails(viewModel: MovieDetailsModel.Fetch.ViewModel)
}

struct MovieDetailsUIView: View {
    var interactor: MovieDetailsBusinessLogic?
    @ObservedObject var movieDetailsViewModel: MovieDetailsModel.Fetch.ViewModel
    var body: some View {
        ZStack{
            BackgroundUIView()
            VStack {
                if let movieTitle = movieDetailsViewModel.movieDetails?.originalTitle{
                    MovieDetailHeaderUIView(Title: movieTitle)
                }
                Spacer()
                if let moviePoster = movieDetailsViewModel.movieDetails?.moviePoster ,let movieRating = movieDetailsViewModel.movieDetails?.rating ,let movieReleaseDate = movieDetailsViewModel.movieDetails?.releaseDate{
                    MovieDetailsCenterUIView(moviePoster: moviePoster, movieRating: movieRating, movieReleaseDate: movieReleaseDate)
                }
                Spacer()
                if let movieOverview = movieDetailsViewModel.movieDetails?.overview{
                    MovieDetailsFooterUIView(overview: movieOverview)
                }
                Spacer()
            }
        }
    }
}

extension MovieDetailsUIView : MovieDetailsDisplayLogic {
    func displayMovieDetails(viewModel: MovieDetailsModel.Fetch.ViewModel) {
        DispatchQueue.main.async {
            self.movieDetailsViewModel.movieDetails = viewModel.movieDetails
        }
    }
    
  func fetchMovieDetails(id: Int) {
        let request = MovieDetailsModel.Fetch.Request(id: id)
        interactor?.loadMovieDetails(request: request)
    }
}
