//
//  MovieDetailsInteractorAssembler.swift
//  MoviesApp
//
//  Created by Linda adel on 05/01/2024.
//

import Foundation

final class MovieDetailsInteractorAssembler: Assembler{
    static var shareInstance = MovieDetailsInteractorAssembler()
    private let movieDetailsRepository: MovieDetailsRepositoryDataSource
    
    init() {
        self.movieDetailsRepository = MovieDetailsRepository(remoteDataSource: MovieDetailsAPI())
    }
    
    func assemble() {
        let container = DIContainer.shared
        container.register(movieDetailsRepository)
        
    }
    
    
}
 
