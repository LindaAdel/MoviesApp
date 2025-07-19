//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Linda adel on 19/07/2025.
//

import Foundation
import Combine

class MoviesListViewModel {
    // MARK: - Injected Dependencies
    private let repository: MoviesRepository
      
      init(repository: MoviesRepository) {
          self.repository = repository
      }
      
    
    // MARK: - Properties
    @Published var movies: [MoviesResultResponse] = []
    @Published var isLoading = false
    @Published var error: APIError?
    
    private var currentPage = 1
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Public Methods
    func fetchMovies(filter: MoviesState) {
        //guard !isLoading else { return }
        
        isLoading = true
        repository.getMoviesList(page: currentPage)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated)) // Process on background
                    .receive(on: DispatchQueue.main)
                    .sink { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.error = error
                }
            } receiveValue: { [weak self] response in
                self?.movies.append(contentsOf: response.results ?? [])
                self?.currentPage += 1
            }
            .store(in: &cancellables)
    }
}

