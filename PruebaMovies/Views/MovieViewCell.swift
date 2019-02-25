//
//  MovieViewCell.swift
//  PruebaMovies
//
//  Created by Rodrigo Astorga on 2/24/19.
//  Copyright © 2019 rastorga. All rights reserved.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    public func setCellWith(_ movie: Movie){
        title.text = movie.title
        releaseDate.text = "Fecha lanzamiento: \(movie.release_date)"
        voteAverage.text = "Nota promedio: \(movie.vote_average.description)"

        posterImageView.image = nil

        if let imageURL = MovieDB.posterUrl(movie: movie) {
            posterImageView.load(url: imageURL)

        }
    }

}
