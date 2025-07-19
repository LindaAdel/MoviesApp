//
//  PosterUIView.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import SwiftUI

struct PosterUIView: View {
    let width: CGFloat
    let height: CGFloat
    let imageURL: String
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w185/\(imageURL)")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
        } placeholder: {
            Color.clear
        }
        .frame(width: width, height: height)
    }
}
