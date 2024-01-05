//
//  MovieDetailHeaderUIView.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import SwiftUI

struct MovieDetailHeaderUIView: View {
    let Title: String
    var body: some View {
        Text(Title)
            .font(.title)
            .fontWeight(.light)
    }
}

