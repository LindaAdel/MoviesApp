//
//  MovieDetailsCenterUIView.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import SwiftUI

struct MovieDetailsCenterUIView: View {
    let moviePoster: String
    let movieRating: Float
    let movieReleaseDate: String
    
    var body: some View {
        VStack{
            PosterUIView(width: 150 , height: 200, imageURL: moviePoster)
            StarRatingUIView(rating: CGFloat(movieRating))
            Text(movieReleaseDate)
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
    }
}
