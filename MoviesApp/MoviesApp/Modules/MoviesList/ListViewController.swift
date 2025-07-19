//
//  ListViewController.swift
//  MoviesApp
//
//  Created by Linda adel on 19/07/2025.
//

import UIKit
import Combine

class ListViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet var moviesTableView: UITableView!
    {
        didSet{
            moviesTableView.delegate = self
            moviesTableView.dataSource = self
        }
    }
    private let moviesViewModel: MoviesListViewModel = DIContainer.shared.resolve()
    private var cancellables = Set<AnyCancellable>()
      var currentPage: Int = 1

    
    override func viewDidLoad() {
    super.viewDidLoad()
    print("ViewController loaded")
    moviesTableView.frame = view.bounds
    moviesTableView.register(MoviesListCell.self, forCellReuseIdentifier: "cell")
    bindViewModel()
    loadInitialData()
}
    
    
    
    private func bindViewModel() {
        // Bind movies updates
        moviesViewModel.$movies
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                DispatchQueue.main.async {
                    self?.moviesTableView.reloadData()
                  
                }
            }
            .store(in: &cancellables)
        
        // Bind errors
        moviesViewModel.$error
            .receive(on: DispatchQueue.main)
            .sink { [weak self] error in
                if let error = error {
                    self?.showError(error)
                }
            }
            .store(in: &cancellables)
    }
    private func loadInitialData() {
        moviesViewModel.fetchMovies(filter: .topRated)
        
    }
    
    
    
    private func loadNextPageIfNeeded(for indexPath: IndexPath) {
        if indexPath.row == moviesViewModel.movies.count - 2 {
            moviesViewModel.fetchMovies(filter: .topRated)
        }
    }
    
    private func showError(_ error: APIError) {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return moviesViewModel.movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoviesListCell
        let movie = moviesViewModel.movies[indexPath.row]
        cell.configure(with: movie)
        self.handleAddingFavouriteMovie(from: cell, with: movie)
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
   
         let count = moviesViewModel.movies.count
            if indexPath.row == count - 2 {
                loadNextPageIfNeeded(for: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        moviesTableView.deselectRow(at: indexPath, animated: true)
           
        let selectedMovie = moviesViewModel.movies[indexPath.row]
       
           showDetailViewController(for: selectedMovie)
       }
    
    private func showDetailViewController(for movie: MoviesResultResponse?) {
        let detailVC = MoviesDetailViewController()
        detailVC.movie = movie
        navigationController?.pushViewController(detailVC, animated: true)
    }
  
    func handleAddingFavouriteMovie(from cell:MoviesListCell ,with movieObject: MoviesResultResponse?) {
        if let id = movieObject?.id?.description , let movie = movieObject {
            cell.isFavorite = DatabaseManager.shared.isMovieFavorite(id: id)
            // Set up the favorite button tap callback
            cell.didTapFavouriteButton = { [weak self] in
                self?.toggleFavoriteStatus(for: movie)
            }
        }
    }
    
    func toggleFavoriteStatus(for movie: MoviesResultResponse) {
        if let id = movie.id?.description {
            if DatabaseManager.shared.isMovieFavorite(id: id) {
                DatabaseManager.shared.removeFavoriteMovie(id: id)
            } else {
                DatabaseManager.shared.addFavoriteMatch(with: movie)
            }
        }
    }
}
