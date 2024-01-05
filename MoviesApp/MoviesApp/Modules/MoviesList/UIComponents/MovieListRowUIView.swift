//
//  MovieListRowUIView.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import SwiftUI

struct MovieListRowUIView: View {
    @State var movie: MoviesResultResponse
    var body: some View {
                HStack(alignment: .center){
                    Spacer()
                    PosterUIView(width: 250, height: 300, imageURL: movie.poster_path ?? "")
                    Spacer()
                }
    }
}

