//
//  MovieListTableViewController.swift
//  PruebaMovies
//
//  Created by Rodrigo Astorga on 2/24/19.
//  Copyright © 2019 rastorga. All rights reserved.
//

import UIKit
import Moya

class MovieListTableViewController: UITableViewController {

    //MARK: - Data source
    let movieProvider = MoyaProvider<MovieDB>()
    var movies: [Movie]?
    
    // MARK: - View State
    private var state: State = .loading {
        didSet {
            switch state {
            case .ready(let movie):
                print("listo")
                self.movies = movie
                self.tableView.isHidden = false
                self.tableView.reloadData()
            case .loading:
                print("cargando")
                self.tableView.isHidden = true
            case .error:
                print("error")
                self.tableView.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MovieViewCell", bundle: nil), forCellReuseIdentifier: "MovieViewCell")
        
        state = .loading
        mostPopular()
    }

    @IBAction func SortBy(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Tipo de filtro", preferredStyle: .actionSheet)
        
        let popularAction = UIAlertAction(title: "Más populares", style: .default, handler: sortByPopular)
        let ratedAction = UIAlertAction(title: "Mejor evaluadas", style: .default, handler: sortByRated)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)

        optionMenu.addAction(popularAction)
        optionMenu.addAction(ratedAction)
        optionMenu.addAction(cancelAction)
 
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func sortByPopular(alert: UIAlertAction!) {
        mostPopular()
    }
    
    func sortByRated(alert: UIAlertAction!) {
        topRated()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies?.count ?? 0
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieViewCell", for: indexPath) as! MovieViewCell
        
        if let movie = movies?[indexPath.row] {
            cell.setCellWith(movie)
        }

        return cell
     }
}

//MARK: - API
extension MovieListTableViewController {
    func mostPopular() {
        movieProvider.request(.mostPopular) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    print(try response.mapJSON())
                    self.state = .ready(try response.map(MovieDBResponse<Movie>.self).results)
                    
                } catch {
                    self.state = .error
                }
            case .failure:
                self.state = .error
            }
        }
    }
    
    func topRated() {
        movieProvider.request(.topRated) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                do {
                    print(try response.mapJSON())
                    self.state = .ready(try response.map(MovieDBResponse<Movie>.self).results)
                    
                } catch {
                    self.state = .error
                }
            case .failure:
                self.state = .error
            }
        }
    }
}

extension MovieListTableViewController {
    enum State {
        case loading
        case ready([Movie])
        case error
    }
}
