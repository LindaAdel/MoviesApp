//
//  MoviesDetailViewController.swift
//  MoviesApp
//
//  Created by Linda adel on 19/07/2025.
//

import UIKit
import SDWebImage

class MoviesDetailViewController: UIViewController{
    var movie: MoviesResultResponse?
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func configureUI() {
        movieTitle.text = movie?.title
        movieDate.text = "Released: \(String(describing: movie?.release_date))"
           
        if let posterPath = movie?.poster_path {
            if let posterPath = movie?.poster_path {
                if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w185/\(posterPath)") {
                    moviePoster.sd_setImage(
                        with: imageUrl
                    )
                }
            } else {
                moviePoster.image = UIImage(named: "movie_placeholder")
            }
        }
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
