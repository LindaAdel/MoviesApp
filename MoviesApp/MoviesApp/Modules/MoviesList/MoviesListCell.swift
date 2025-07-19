//
//  MoviesListCell.swift
//  MoviesApp
//
//  Created by Linda adel on 19/07/2025.
//

import UIKit
import SDWebImage

class MoviesListCell: UITableViewCell {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var isFavorite: Bool = false {
        didSet {
            favoriteButton.isSelected = isFavorite
        }
    }
    
    var didTapFavouriteButton: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isFavorite = false
    }
    
    func configure(with movie: MoviesResultResponse?) {
        movieTitle.text = movie?.title
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
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        print("Button tapped!")
        isFavorite.toggle()
        favoriteButton.isSelected = isFavorite
        didTapFavouriteButton?()
    }
}
