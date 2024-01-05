//
//  MovieDetailsUIConfigurator.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import SwiftUI

extension MovieDetailsUIView {
    
    static func configureDetailView(id: Int) -> some View {
        var view = MovieDetailsUIView(movieDetailsViewModel: MovieDetailsModel.Fetch.ViewModel())
        MovieDetailsInteractorAssembler.shareInstance.assemble()
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter()
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        interactor.loadMovieDetails(request: MovieDetailsModel.Fetch.Request(id: id))
        return view
    }
    
}
