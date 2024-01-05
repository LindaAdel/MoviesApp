//
//  MovieDetailsDataStore.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import Foundation

struct MovieDetailsDataStore: Hashable, Codable{
    var originalTitle: String?
    var moviePoster: String?
    var overview: String?
    var rating: Float?
    var releaseDate: String?
    
    init(_ movieDetailsResponse:MovieDetailsResponse){
        self.originalTitle = movieDetailsResponse.original_title
        self.moviePoster = movieDetailsResponse.poster_path
        self.overview = movieDetailsResponse.overview
        self.rating = movieDetailsResponse.vote_average
        self.releaseDate = movieDetailsResponse.release_date
    }
}
