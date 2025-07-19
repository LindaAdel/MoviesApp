//
//  MovieDetailsFooterUIView.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import SwiftUI

struct MovieDetailsFooterUIView: View {
    let overview: String
    var body: some View {
        Text(overview)
            .font(.body)
            .fontWeight(.light)
            .foregroundColor(.gray)
            .padding()
    }
}

