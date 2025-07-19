//
//  StarRatingUIView.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import SwiftUI

struct StarRatingUIView: View {
    var rating: CGFloat
    var maxRating: Int = 10

    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }

        stars.overlay(
            GeometryReader { g in
                let width = rating / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.yellow)
                }
            }
            .mask(stars)
        )
        .foregroundColor(.gray)
        .frame(width: 150)
    }
}
