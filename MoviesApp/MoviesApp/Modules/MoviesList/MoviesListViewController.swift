//
//  MoviesListViewController.swift
//  MoviesApp
//
//  Created by Linda adel on 19/07/2025.
//

import UIKit

class MoviesListViewController: UITableViewController {
    var interactor: MoviesBusinessLogic?
    var moviesViewModel: MoviesListModel.Fetch.ViewModel?
    var currentPage: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "moviesCell")
        fetchData()
    }
    // MARK: - Data Fetching
    func fetchData() {
        let request = MoviesListModel.Fetch.Request(page: currentPage, filterOption: .topRated)
        interactor?.loadTopRatedMoviesList(request: request)
    }
    
    func fetchNextPage() {
        currentPage += 1
        fetchData()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel?.moviesList?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviesCell", for: indexPath) as! MoviesListCell
        let movie = moviesViewModel?.moviesList?[indexPath.row]
        cell.configure(with: movie)
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let count = moviesViewModel?.moviesList?.count {
            if indexPath.row == count - 2 {
                fetchNextPage()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           
           let selectedMovie = moviesViewModel?.moviesList?[indexPath.row]
           showDetailViewController(for: selectedMovie)
       }
       
       private func showDetailViewController(for movie: MoviesResultResponse?) {
           let detailVC = MoviesDetailViewController()
           detailVC.movie = movie
           navigationController?.pushViewController(detailVC, animated: true)
       }
}
// MARK: - MoviesDisplayLogic
extension MoviesListViewController: MoviesDisplayLogic {
    func displayMoviesList(viewModel: MoviesListModel.Fetch.ViewModel) {
        DispatchQueue.main.async {
            self.moviesViewModel?.moviesList = viewModel.moviesList
            self.tableView.reloadData()
        }
    }
}
