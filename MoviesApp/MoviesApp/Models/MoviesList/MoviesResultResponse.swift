//
//  MoviesResultResponse.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation

struct MoviesResultResponse: Codable , Equatable{
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Float?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Float?
    var vote_count: Int?
}
