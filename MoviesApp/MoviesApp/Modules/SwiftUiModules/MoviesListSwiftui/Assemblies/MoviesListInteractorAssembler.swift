//
//  MoviesListInteractorAssembler.swift
//  MoviesApp
//
//  Created by Linda adel on 04/01/2024.
//

import Foundation
final class MoviesListInteractorAssembler: Assembler{
    static var shareInstance = MoviesListInteractorAssembler()
    private let moviesRepository: MoviesRepositoryDataSource
    
    init() {
        self.moviesRepository = MoviesRepository(remoteDataSource: MoviesAPI())
    }
    
    func assemble() {
        let container = DIContainer.shared
        container.register(moviesRepository)
        
    }
    
    
}
 
