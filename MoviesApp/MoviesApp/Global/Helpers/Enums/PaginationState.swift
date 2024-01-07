//
//  PaginationState.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import Foundation

enum PaginationState: Comparable{
    case idle
    case loading
}

enum MoviesState: Comparable{
    case nowPlaying
    case popular
    case topRated
}
