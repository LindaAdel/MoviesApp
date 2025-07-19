//
//  MovieDetailsModel.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import Foundation

enum MovieDetailsModel {
    enum Fetch {
        struct Request {
            var id: Int?
        }
        struct Response {
            var movieDetailsModelResponse: MovieDetailsResponse
        }
        class ViewModel: ObservableObject {
            @Published var movieDetails: MovieDetailsDataStore?
        }
    }
}
