//
//  MoviesSortingUIButton.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import SwiftUI

struct MoviesSortingUIButton: View {
    let title : String
    let completion : (() -> Void)
    var body: some View {
        Button(action: {
            completion()
        }, label: {
            Text(title)
                .bold()
                .padding()
                .frame(width: 120, height: 50, alignment: .center)
            
        }).background(Color.indigo)
            .foregroundColor(Color.white)
            .cornerRadius(15)
            
    }
}
