//
//  MoviesListAssembler.swift
//  MoviesApp
//
//  Created by Linda adel on 19/07/2025.
//

import Foundation

final class MoviesListAssembler: Assembler {
    static let shareInstance = MoviesListAssembler()
    
    func assemble() {
        let container = DIContainer.shared
        
        // 1. Register Data Source
        let moviesAPI = MoviesAPI()
        container.register(moviesAPI) // Registers as MoviesAPI type
        
        // 2. Register Repository
        let moviesRepo = MoviesRepository(remoteDataSource: moviesAPI)
        container.register(moviesRepo) // Registers as MoviesRepository type
        
        // 3. Register ViewModel
        let viewModel = MoviesListViewModel(repository: moviesRepo)
        container.register(viewModel) // Registers as MoviesListViewModel type
       
        print("DI Container initialized successfully")
    }
}
