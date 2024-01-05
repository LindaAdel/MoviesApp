//
//  MoviesResponse.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation

struct MoviesResponse:Codable {
    var dates: DateResponse?
    var page: Int?
    var results: [MoviesResultResponse]?
    var total_pages: Int?
    var total_results: Int?
}
