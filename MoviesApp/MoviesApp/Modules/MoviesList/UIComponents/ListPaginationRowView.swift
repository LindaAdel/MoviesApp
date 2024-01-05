//
//  ListPaginationRowView.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import SwiftUI

struct ListPaginationRowView: View {
    
    let state: PaginationState
    let loadMore: () -> Void
    
    var body: some View {
        switch state {
        case .idle:
            Color.clear
                .onAppear {
                    loadMore()
                }
        case .loading:
            ProgressView().background(Color.clear)
                .progressViewStyle(.circular)
                .frame(maxWidth: .infinity)
        }
    }
}
