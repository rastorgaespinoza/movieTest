//
//  MovieDetailViewController.swift
//  PruebaMovies
//
//  Created by Rodrigo Astorga on 2/25/19.
//  Copyright © 2019 rastorga. All rights reserved.
//

import UIKit

protocol MovieDetailView: NSObjectProtocol {
    func setMovie(movie: Movie)
}

class MovieDetailViewController: UIViewController {
    
    var movie: Movie!
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    @IBOutlet weak var resumeMovie: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

    }

    func updateView(){
        
        self.titleMovie.text = movie.title
        self.date.text = "Fecha lanzamiento: \(movie.release_date)"
        self.voteAverage.text = "Nota promedio: \(movie.vote_average.description)"
        self.resumeMovie.text = movie.overview
        
        posterImageView.image = nil
        
        if let imageURL = MovieDB.posterUrl(movie: movie) {
            posterImageView.load(url: imageURL)
            
        }
    }
}

extension MovieDetailViewController: MovieDetailView {
    
    func setMovie(movie: Movie) {
        self.movie = movie

    }
    
}
