//
//  MoviesListModel.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation

enum MoviesListModel {
    enum Fetch {
        struct Request {
            var page: Int = 1
            var filterOption: MoviesState = .nowPlaying
        }
        struct Response {
            var moviesListResponse: MoviesResponse
        }
        class ViewModel: ObservableObject {
            @Published var moviesList: [MoviesResultResponse]?
        }
    }
}
