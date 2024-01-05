//
//  MovieDetailsResponse.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import Foundation

struct MovieDetailsResponse: Codable {
    var adult: Bool
    var backdrop_path: String?
    var belongs_to_collection: Collections?
    var budget: Int?
    var genres: [Genres]?
    var homepage: String?
    var id: Int?
    var imdb_id: String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Float?
    var poster_path: String?
    var production_companies: [ProductionCompanies]?
    var production_countries: [ProductionCountries]?
    var release_date: String?
    var revenue: Int?
    var runtime: Int?
    var spoken_languages: [SpokenLanguages]?
    var status: String?
    var tagline: String?
    var title: String?
    var video: Bool?
    var vote_average: Float?
    var vote_count: Int?
}
